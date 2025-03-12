import { useGetVaccineListQuery } from '../../features/vaccine/vaccineAPI'
import { useState } from 'react'
import { Vaccines } from '../../types/vaccine'
import { Col, Pagination, Row } from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
import { Card, Typography, Space, Button } from 'antd'
const { Title, Text, Paragraph } = Typography
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
  const [pageSize, setPageSize] = useState(10)
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
                <Paragraph style={{ flexGrow: 1 }}>
                  {vaccine.description}
                </Paragraph>
                <Space direction='vertical' size='middle'>
                  <Text strong>Giá: ${vaccine.price}</Text>
                  <Text>
                    Độ tuổi khuyến nghị: {vaccine.startRecommendAge} -{' '}
                    {vaccine.endRecommendAge} tuổi
                  </Text>
                  <Text>Trình tự: {vaccine.sequence}</Text>
                  <Text>Liều lượng: {vaccine.dosage}</Text>
                  <Text>
                    Khoảng cách giữa các liều: {vaccine.dosageInterval} tháng
                  </Text>

                  <Button type='primary'>Xem chi tiết</Button>
                </Space>
              </div>
            </Card>
          </Col>
        ))}
      </Row>
      <Pagination
        defaultCurrent={pageNumber}
        defaultPageSize={pageSize}
        pageSizeOptions={['10', '20', '30']}
        total={data?.data.totalItems}
        style={{ textAlign: 'center' }}
        align='center'
        onChange={(page, size) => {
          setPageNumber(page)
          console.log(size)
          setPageSize(size)
        }}
      />
    </>
  )
}
