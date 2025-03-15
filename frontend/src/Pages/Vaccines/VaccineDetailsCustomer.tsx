import { useState } from 'react'
import { useGetVaccineDetailQuery } from '../../features/vaccine/vaccineAPI'
import { useParams } from 'react-router-dom'
import { Vaccines } from '../../types/vaccine'
import { LoadingOutlined } from '@ant-design/icons'
import { Card, Select, Typography, Image, Descriptions, Alert } from 'antd'

const { Title } = Typography
const { Option } = Select

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
  const [selectedFacility, setSelectedFacility] = useState<string | null>(null)

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

  const filteredInventories = Array.isArray(vaccine.vaccineInventories)
    ? selectedFacility
      ? vaccine.vaccineInventories.filter(
          (inventory: any) => inventory.facility.id === selectedFacility
        )
      : [] // Nếu chưa chọn, không hiển thị gì
    : []

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

      {/* Chọn cơ sở */}
      <Title level={4} style={{ marginTop: '20px' }}>
        Chọn cơ sở
      </Title>
      <Select
        style={{ width: '100%' }}
        placeholder='Chọn cơ sở'
        onChange={(value) => {
          setSelectedFacility(value)
        }}
      >
        {Array.isArray(vaccine.vaccineInventories) &&
          vaccine.vaccineInventories.map((inventory: any, index: number) => (
            <Option key={index} value={inventory.facility.id}>
              Cơ sở {inventory.facility.name} - {inventory.facility.address}
            </Option>
          ))}
      </Select>

      {/* Hiển thị kho vaccine của cơ sở đã chọn */}
      <Title level={4} style={{ marginTop: '20px' }}>
        Thông tin kho hàng
      </Title>
      {filteredInventories.length > 0 ? (
        filteredInventories.map((inventory: any, index: number) => (
          <Descriptions
            bordered
            column={1}
            key={index}
            style={{ marginTop: '10px' }}
          >
            <Descriptions.Item label='Số lượng tồn'>
              {inventory.stock}
            </Descriptions.Item>
            <Descriptions.Item label='Ngày nhập khẩu'>
              {inventory.importedDate}
            </Descriptions.Item>
            <Descriptions.Item label='Hạn sử dụng'>
              {inventory.expiryDate}
            </Descriptions.Item>
            <Descriptions.Item label='Số lô'>
              {inventory.batchNumber}
            </Descriptions.Item>
          </Descriptions>
        ))
      ) : (
        <Alert message='Không có dữ liệu tồn kho.' type='warning' showIcon />
      )}
    </Card>
  )
}
