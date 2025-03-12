import { useGetVaccineListQuery } from '../../features/vaccine/vaccineAPI'
import { useState } from 'react'
import { Vaccines } from '../../types/vaccine'
import { Col, Pagination, Row } from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
import { Card, Typography, Space, Button } from 'antd'
import { useNavigate } from 'react-router-dom'
const { Title, Text } = Typography
interface VaccineListResponse {
  data: {
    data: {
      items: Vaccines[]
      totalItems: number
      totalPages: number
    }
  }
  isLoading: boolean
}

export default function AllVaccinesCustomer() {
  const [pageNumber, setPageNumber] = useState(1)
  const [pageSize, setPageSize] = useState(12)
  const navigate = useNavigate()
  const { data, isLoading } = useGetVaccineListQuery<VaccineListResponse>({
    pageNumber: pageNumber,
    pageSize: pageSize,
  })

  if (isLoading) {
    return (
      <LoadingOutlined
        style={{
          fontSize: '50px',
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          height: '30vh',
        }}
      />
    )
  }

  return (
    <>
      <h1 style={{ textAlign: 'center' }}>Danh sách vaccine</h1>
      <Row align='middle'>
        {data.data.items.map((vaccine) => (
          <Col span={6} key={vaccine.id}>
            <Card
              hoverable
              style={{
                borderRadius: '12px',
                boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
                margin: '8px',
                minHeight: '400px', // Giữ chiều cao đồng đều
                display: 'flex',
                flexDirection: 'column',
              }}
              cover={
                <img
                  src={
                    vaccine.images && vaccine.images.length > 0
                      ? import.meta.env.VITE_IMAGE_ENDPOINT +
                        vaccine.images[0].imageSource
                      : '/placeholder.svg'
                  }
                  alt={vaccine.name}
                  style={{
                    objectFit: 'cover',
                    borderTopLeftRadius: '12px',
                    borderTopRightRadius: '12px',
                  }}
                />
              }
            >
              <div
                style={{
                  flexGrow: 1,
                  display: 'flex',
                  flexDirection: 'column',
                }}
              >
                <Title level={4}>{vaccine.name}</Title>
                <Space direction='vertical' size='middle'>
                  <Text strong>Giá: {vaccine.price?.toLocaleString()} VND</Text>
                  <Text>
                    Độ tuổi khuyến nghị: {vaccine.startRecommendedAge} -{' '}
                    {vaccine.endRecommendedAge} tuổi
                  </Text>
                  <Text>Trình tự: {vaccine.sequence}</Text>
                  <Text>Liều lượng: {vaccine.dosage}</Text>
                  <Text>
                    Khoảng cách giữa các liều: {vaccine.dosageInterval} tháng
                  </Text>

                  <Button
                    type='primary'
                    onClick={() => navigate(`/vaccines/${vaccine.id}`)}
                  >
                    Xem chi tiết
                  </Button>
                </Space>
              </div>
            </Card>
          </Col>
        ))}
      </Row>
      <Pagination
        current={pageNumber}
        pageSize={pageSize}
        total={data?.data.totalItems}
        pageSizeOptions={['12', '24', '36']}
        showSizeChanger={true}
        style={{ textAlign: 'center' }}
        align='center'
        onChange={(page, size) => {
          setPageNumber(page)
          setPageSize(size)
        }}
        locale={{
          items_per_page: 'vaccines / trang',
        }}
      />
    </>
  )
}
