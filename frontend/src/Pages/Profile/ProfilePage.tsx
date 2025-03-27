import { Layout, Card, Descriptions, message, Spin, Button } from 'antd'
import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import Cookies from 'js-cookie'
import { useGetChildrenListQuery } from '../../features/children/childrenAPI'

const { Content } = Layout
import { Children } from '../../types/children'

interface UserData {
  Id: string
  Name: string
  Email: string
  PhoneNumber: string
  Address: string
}

interface ChildrenDataResponse {
  data: {
    data: {
      items: Children[]
      totalItems: number
      totalPages: number
    }
  }
  isLoading: boolean
}

export default function ProfilePage() {
  const navigate = useNavigate()
  const [userData, setUserData] = useState<UserData>({} as UserData)

  // Fetch danh sách trẻ em
  const { data: childrenResponse, isLoading } =
    useGetChildrenListQuery<ChildrenDataResponse>({
      pageNumber: 1,
      pageSize: 10,
      parentId: userData?.Id,
    })

  useEffect(() => {
    try {
      const storedUser = Cookies.get('userData')
      if (storedUser) {
        setUserData(JSON.parse(storedUser))
      } else {
        navigate('/login')
      }
    } catch (error: any) {
      message.error(error)
      message.error('Vui lòng đăng nhập để xem thông tin cá nhân')
      navigate('/login')
    }
  }, [navigate])

  if (!userData) return null // Tránh render khi chưa có dữ liệu

  return (
    <Layout>
      <Content style={{ maxWidth: 600, margin: '20px auto' }}>
        {/* Thông tin cá nhân */}
        <Card
          title='Thông tin cá nhân'
          bordered
          style={{
            borderRadius: 12,
            marginBottom: 20,
          }}
        >
          <Descriptions column={1}>
            <Descriptions.Item label='Họ và Tên'>
              {userData.Name}
            </Descriptions.Item>
            <Descriptions.Item label='Email'>
              {userData.Email}
            </Descriptions.Item>
            <Descriptions.Item label='Số điện thoại'>
              {userData.PhoneNumber}
            </Descriptions.Item>
            <Descriptions.Item label='Địa chỉ'>
              {userData.Address}
            </Descriptions.Item>
          </Descriptions>
          <div style={{ display: 'flex', justifyContent: 'space-between' }}>
            <Button
              type='primary'
              danger
              onClick={() => navigate('/profile/update-password')}
            >
              Đổi mật khẩu
            </Button>
            <Button
              type='primary'
              onClick={() => navigate('/profile/update-email')}
            >
              Đổi email
            </Button>
          </div>
        </Card>

        {/* Danh sách trẻ em */}
        <h3>Danh sách trẻ em</h3>
        {isLoading ? (
          <Spin size='large' />
        ) : (
          childrenResponse?.data?.items?.map((child) => (
            <Card
              key={child.id}
              title={`👶 ${child.name}`}
              bordered
              style={{ marginBottom: 16, borderRadius: 12 }}
            >
              <div
                style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                }}
              >
                <div>
                  <Button
                    type='primary'
                    style={{
                      marginBottom: 16,
                      backgroundColor: '#52c41a',
                      borderColor: '#52c41a',
                    }} // Xanh lá
                    onClick={() =>
                      navigate(
                        `/vaccinations-history?childId=${child.id}&isUpcoming=true`
                      )
                    }
                  >
                    Xem các mũi tiêm kế tiếp của trẻ
                  </Button>
                </div>
                <div>
                  <Button
                    type='primary'
                    style={{
                      marginBottom: 16,
                      backgroundColor: '#fa8c16',
                      borderColor: '#fa8c16',
                    }} // Cam
                    onClick={() =>
                      navigate(
                        `/vaccinations-history?childId=${child.id}&isUpcoming=false`
                      )
                    }
                  >
                    Xem lịch sử tiêm chủng của trẻ
                  </Button>
                </div>
              </div>

              <Descriptions column={1}>
                <Descriptions.Item label='Ngày sinh'>
                  {child.dateOfBirth
                    ? new Date(child.dateOfBirth).toLocaleDateString('vi-VN')
                    : 'Không có'}
                </Descriptions.Item>

                <Descriptions.Item label='Chiều cao'>
                  {child.height ? `${child.height} cm` : 'Chưa có'}
                </Descriptions.Item>
                <Descriptions.Item label='Cân nặng'>
                  {child.weight ? `${child.weight} kg` : 'Chưa có'}
                </Descriptions.Item>
                <Descriptions.Item label='Giới tính'>
                  {child.gender ? 'Nữ' : 'Nam'}
                </Descriptions.Item>
                <Descriptions.Item label='Ghi chú y tế'>
                  {child.medicalNote || 'Không có'}
                </Descriptions.Item>
              </Descriptions>
            </Card>
          ))
        )}
      </Content>
    </Layout>
  )
}
