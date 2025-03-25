import React from 'react'
import { useGetVaccineListQuery } from '../../features/vaccine/vaccineAPI'
import { Typography, Button, Row, Col, Space } from 'antd'
import { CalendarOutlined, LoadingOutlined } from '@ant-design/icons'
import Logo from '../../assets/Logo.png'
import { Vaccines } from '../../types/vaccine'
import { VaccineSlider } from '../Vaccine/VaccineSlider'
import { Blogs } from '../../types/blog'
import { useGetBlogsMinimalListQuery } from '../../features/blogs/blogsAPI'
import { BlogSlider } from '../Blogs/BlogSlider'
import { useNavigate } from 'react-router-dom'
interface VaccineListResponse {
  data: {
    data: {
      items: Vaccines[]
    }
  }
  isLoading: boolean
}

interface BlogListResponse {
  data: {
    data: {
      items: Blogs[]
    }
  }
  isLoading: boolean
}

const { Title, Paragraph } = Typography

const Homepage: React.FC = () => {
  const navigate = useNavigate()
  const { data, isLoading } = useGetVaccineListQuery<VaccineListResponse>({
    pageNumber: 1,
    pageSize: 5,
  })

  const { data: dataBlog, isLoading: isLoadingBlog } =
    useGetBlogsMinimalListQuery<BlogListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  const dataVaccine = data?.data.items ?? []
  const allDataBlog = dataBlog?.data.items ?? []

  return (
    <div
      style={{
        background: '#f0f2f5',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}
    >
      {/* Container */}
      <div
        style={{
          width: '100%',
          maxWidth: '80%',
          padding: '24px',
          margin: '0 auto',
        }}
      >
        {/* Gioi thieu */}
        <Row gutter={[24, 24]} align='middle' style={{ marginBottom: '48px' }}>
          <Col xs={24} md={12}>
            <div style={{ padding: '0 16px' }}>
              <Title
                level={1}
                style={{ marginBottom: '24px', color: '#1890ff' }}
              >
                Bảo vệ bạn và những người thân yêu bằng tiêm chủng
              </Title>
              <Paragraph style={{ fontSize: '16px', marginBottom: '24px' }}>
                Tiêm chủng là một trong những cách hiệu quả nhất để phòng ngừa
                bệnh tật. Hãy tiêm chủng ngay hôm nay để bảo vệ bản thân và giúp
                xây dựng miễn dịch cộng đồng.
              </Paragraph>
              <Space>
                <Button
                  type='primary'
                  size='large'
                  icon={<CalendarOutlined />}
                  onClick={() => {
                    navigate('vaccine-registration')
                  }}
                >
                  Đặt lịch hẹn
                </Button>
              </Space>
            </div>
          </Col>
          <Col xs={24} md={12}>
            <img
              src={Logo || '/placeholder.svg'}
              alt=''
              style={{
                width: '100%',
                borderRadius: '8px',
                boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
              }}
            />
          </Col>
        </Row>

        {/* Danh sach vaccine */}
        <div style={{ marginBottom: '48px' }}>
          <Title
            level={2}
            style={{ textAlign: 'center', marginBottom: '32px' }}
          >
            Một số loại vaccine
          </Title>
          {isLoading ? (
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '30vh',
              }}
            />
          ) : (
            <VaccineSlider vaccines={dataVaccine as Vaccines[]} />
          )}
        </div>

        {/* Danh sach blog */}
        <div style={{ marginBottom: '48px' }}>
          <Title
            level={2}
            style={{ textAlign: 'center', marginBottom: '32px' }}
          >
            Các bài viết mới
          </Title>
          {isLoadingBlog ? (
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '30vh',
              }}
            />
          ) : (
            <BlogSlider blogs={allDataBlog as Blogs[]} />
          )}
        </div>
      </div>
    </div>
  )
}

export default Homepage
