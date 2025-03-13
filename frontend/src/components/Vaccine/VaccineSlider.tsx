import { Typography, Button, Space, Carousel, Card } from 'antd'
import { FC } from 'react'
import { Vaccines } from '../../types/vaccine'

const { Title, Text, Paragraph } = Typography

interface VaccineSliderProps {
  vaccines: Vaccines[]
}

export const VaccineSlider: FC<VaccineSliderProps> = ({ vaccines }) => {
  return (
    <Carousel
      autoplay
      dots={false}
      infinite
      slidesToShow={4} // Hiển thị 4 items trên màn hình lớn
      slidesToScroll={1}
      responsive={[
        { breakpoint: 1024, settings: { slidesToShow: 2 } }, // Tablet
        { breakpoint: 768, settings: { slidesToShow: 1 } }, // Mobile
      ]}
    >
      {vaccines.map((vaccine) => (
        <div key={vaccine.id}>
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
                  width: '100%',
                  height: '200px', // Đảm bảo ảnh có cùng kích thước
                  objectFit: 'cover',
                  borderTopLeftRadius: '12px',
                  borderTopRightRadius: '12px',
                }}
              />
            }
          >
            <div
              style={{ flexGrow: 1, display: 'flex', flexDirection: 'column' }}
            >
              <Title level={4}>{vaccine.name}</Title>
              <Paragraph style={{ flexGrow: 1 }}>
                {vaccine.description}
              </Paragraph>
              <Space direction='vertical' size='middle'>
                <Text strong>Price: ${vaccine.price}</Text>
                <Text>
                  Recommended Age: {vaccine.startRecommendedAge} -{' '}
                  {vaccine.endRecommendedAge} years
                </Text>
                <Text>Sequence: {vaccine.sequence}</Text>
                <Text>Dosage: {vaccine.dosage}</Text>
                <Text>Dosage Interval: {vaccine.dosageInterval} months</Text>
                <Button type='primary'>Book Appointment</Button>
              </Space>
            </div>
          </Card>
        </div>
      ))}
    </Carousel>
  )
}
