import { useGetVaccineDetailQuery } from '../../features/vaccine/vaccineAPI'
import { useParams } from 'react-router-dom'
import { Vaccines } from '../../types/vaccine'
import { LoadingOutlined } from '@ant-design/icons'
import { Card, Typography, Image, Descriptions, Alert } from 'antd'

const { Title } = Typography

interface VaccineListResponse {
  data: {
    data: Vaccines
  }
  isLoading: boolean
}

export default function VaccineDetailsCustomer() {
  const { vaccineID } = useParams()
  const { data: data, isLoading } =
    useGetVaccineDetailQuery<VaccineListResponse>(vaccineID as string)

  const vaccine = data?.data

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

  if (!vaccine) {
    return (
      <Alert message='Không tìm thấy thông tin vaccine' type='error' showIcon />
    )
  }

  return (
    <Card
      style={{
        maxWidth: '800px',
        margin: 'auto',
        marginTop: '20px',
        borderRadius: '12px',
      }}
    >
      <Title level={2}>Chi tiết Vaccine</Title>

      {/* Hình ảnh vaccine */}
      <Image
        src={
          vaccine.images && vaccine.images.length > 0
            ? import.meta.env.VITE_IMAGE_ENDPOINT +
              vaccine.images[0].imageSource
            : '/placeholder.svg'
        }
        alt={vaccine.name || 'Vaccine'}
        width={300}
        height={200}
        style={{ borderRadius: '12px', objectFit: 'cover' }}
      />

      {/* Thông tin vaccine */}
      <Descriptions bordered column={1} style={{ marginTop: '20px' }}>
        <Descriptions.Item label='Tên vaccine'>
          {vaccine.name || 'Không có thông tin'}
        </Descriptions.Item>
        <Descriptions.Item label='Mô tả'>
          {vaccine.description}
        </Descriptions.Item>
        <Descriptions.Item label='Giá'>
          {vaccine.price && vaccine.price > 0
            ? `${vaccine.price.toLocaleString()} VND`
            : 'Miễn phí'}
        </Descriptions.Item>
        <Descriptions.Item label='Loại'>
          {vaccine.category?.name}
        </Descriptions.Item>
        <Descriptions.Item label='Nhà sản xuất'>
          {vaccine.manufacturer?.name} ({vaccine.manufacturer?.country?.name})
        </Descriptions.Item>
      </Descriptions>
    </Card>
  )
}
