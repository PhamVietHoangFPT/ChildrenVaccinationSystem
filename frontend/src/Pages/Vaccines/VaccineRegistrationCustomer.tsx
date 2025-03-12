import { Button, Card, Pagination, Table, Row, Col, Select } from 'antd'
import { useGetFacilitiesListQuery } from '../../features/facilities/facilitiesAPI'
import { useGetVaccineListMiniMalQuery } from '../../features/vaccine/vaccineAPI'
import { Facilities } from '../../types/facilities'
import { Vaccines } from '../../types/vaccine'
import { DeleteOutlined, LoadingOutlined, TagOutlined } from '@ant-design/icons'
import { useState } from 'react'
const { Option } = Select

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

interface FacilitiesListResponse {
  data: {
    data: {
      items: Facilities[]
    }
  }
  isLoading: boolean
}
export default function VaccineRegistrationCustomer() {
  const [pageNumber, setPageNumber] = useState(1)
  const [pageSize, setPageSize] = useState(12)
  const [selectedVaccines, setSelectedVaccines] = useState<string[]>([])
  const [selectedFacility, setSelectedFacility] = useState<string | null>(null)
  const { data: vaccines, isLoading: vaccineLoading } =
    useGetVaccineListMiniMalQuery<VaccineListResponse>({
      pageSize: pageSize,
      pageNumber: pageNumber,
    })

  const { data: facilities, isLoading: facilitiesLoading } =
    useGetFacilitiesListQuery<FacilitiesListResponse>({
      pageSize: -1,
      pageNumber: -1,
    })

  const columns = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Bệnh',
      key: 'category',
      render: (record: any) => record.category.name,
    },
    {
      title: 'Nhà sản xuất',
      key: 'manufacturer',
      render: (record: any) => record.manufacturer.name,
    },
    {
      title: 'Giá',
      key: 'price',
      render: (record: any) =>
        record.price.toLocaleString().toUpperCase() + ' VND',
    },
    {
      title: 'Độ tuổi khuyến nghị',
      key: 'recommendedAge',
      render: (record: any) =>
        `${record.startRecommendedAge} - ${record.endRecommendedAge}`,
    },
    {
      title: 'Liều lượng',
      key: 'dosage',
      render: (record: any) => record.dosage + ' ' + 'ml',
    },
    {
      title: '',
      key: 'action',
      render: (record: any) => (
        <Button
          onClick={() => {
            setSelectedVaccines([...selectedVaccines, record])
          }}
          disabled={selectedVaccines.includes(record)}
        >
          Chọn
        </Button>
      ),
    },
  ]

  if (vaccineLoading || facilitiesLoading) {
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
      <h1 style={{ textAlign: 'center' }}>Đăng ký tiêm Vaccine</h1>
      <h2 style={{ textAlign: 'center' }}>Chọn cơ sở y tế</h2>
      <Select
        style={{
          width: '50%',
          margin: 'auto',
          display: 'flex',
          flexDirection: 'column',
          gap: '16px',
          fontSize: '18px', // Tăng kích thước font cho Select
        }}
        size='large'
        dropdownStyle={{ fontSize: '18px' }} // Tăng kích thước font cho dropdown
        placeholder='Chọn cơ sở y tế'
        onChange={(value) => setSelectedFacility(value)}
      >
        {facilities.data.items.map((facility) => (
          <Option
            key={facility.id}
            value={facility.id}
            style={{ fontSize: 'large' }}
          >
            {facility.name} - {facility.address}
          </Option>
        ))}
      </Select>

      {selectedFacility && (
        <>
          <Table
            dataSource={vaccines.data.items}
            columns={columns}
            pagination={false}
            style={{ marginBottom: '16px' }}
          />
          <Pagination
            current={pageNumber}
            pageSize={pageSize}
            total={vaccines?.data.totalItems}
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
      )}
      {selectedVaccines.length > 0 && (
        <div
          style={{
            width: '80%',
            margin: 'auto',
            display: 'flex',
            flexDirection: 'column',
            gap: '16px',
          }}
        >
          <h2>Vaccine đã chọn</h2>
          <Row align='middle' gutter={[16, 16]}>
            {selectedVaccines.map((vaccine: any) => (
              <Col xs={24} sm={12} md={8} lg={6} key={vaccine.id}>
                <Card
                  title={vaccine.name}
                  extra={
                    <Button
                      type='text'
                      danger
                      icon={<DeleteOutlined />}
                      onClick={() => {
                        setSelectedVaccines(
                          selectedVaccines.filter((v) => v !== vaccine)
                        )
                      }}
                    />
                  }
                  style={{ minHeight: 350 }}
                >
                  <p>
                    <strong>Nguồn gốc:</strong> {vaccine.manufacturer.name}
                  </p>
                  <p>
                    <TagOutlined /> <strong>Giá:</strong>{' '}
                    {vaccine.price.toLocaleString()} VND
                  </p>
                  <p>
                    <strong>Phòng bệnh:</strong> {vaccine.category.name}
                  </p>
                  <p>
                    <strong>Liều lượng:</strong> {vaccine.dosage} ml
                  </p>
                </Card>
              </Col>
            ))}
          </Row>
        </div>
      )}
    </>
  )
}
