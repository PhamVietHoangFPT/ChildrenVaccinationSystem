import { useGetVaccineListQuery } from '../../features/vaccine/vaccineAPI'
import { useState, useEffect, useCallback } from 'react'
import { Vaccines } from '../../types/vaccine'
import { Col, Pagination, Row, Input, Select, Spin } from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
import { Card, Typography, Space, Button } from 'antd'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { useGetManufacturersListQuery } from '../../features/manufactures/manufacturesAPI'
import { useGetCategoriesListQuery } from '../../features/categories/categoriesAPI'
import { Category } from '../../types/category'
import { Manufacturers } from '../../types/manufacturer'
const { Title, Text } = Typography
const { Option } = Select

interface VaccineListResponse {
  data: {
    data: {
      items: Vaccines[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

interface ManufacturersListResponse {
  data: {
    data: {
      items: Manufacturers[]
    }
  }
  isLoading: boolean
}

interface CategoriesListResponse {
  data: {
    data: {
      items: Category[]
    }
  }
  isLoading: boolean
}

export default function AllVaccinesCustomer() {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()

  // Khởi tạo state với giá trị mặc định hoặc từ URL
  const [vaccineName, setVaccineName] = useState(searchParams.get('name') || '')
  const [categoryName, setCategoryName] = useState(
    searchParams.get('categoryName') || ''
  )
  const [manufacturerCountry, setManufacturerCountry] = useState(
    searchParams.get('manufacturerCountry') || ''
  )
  const [pageNumber, setPageNumber] = useState(
    Number(searchParams.get('pageNumber')) || 1
  )
  const [pageSize, setPageSize] = useState(4)

  const { data: manufacturers, isLoading: manufacturerLoading } =
    useGetManufacturersListQuery<ManufacturersListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })
  const { data: categories, isLoading: categoriesLoading } =
    useGetCategoriesListQuery<CategoriesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  // Tạo URL động từ các bộ lọc
  const updateURL = useCallback(() => {
    const params = new URLSearchParams()
    params.append('pageNumber', pageNumber.toString())
    if (vaccineName) params.append('name', vaccineName)
    if (categoryName) params.append('categoryName', categoryName)
    if (manufacturerCountry)
      params.append('manufacturerCountry', manufacturerCountry)

    navigate(`/vaccines?${params.toString()}`)
  }, [pageNumber, vaccineName, categoryName, manufacturerCountry, navigate])

  useEffect(() => {
    setPageNumber(1) // Reset về trang 1 khi thay đổi bộ lọc
  }, [categoryName, manufacturerCountry])

  useEffect(() => {
    updateURL()
  }, [updateURL])

  // Gọi API lấy danh sách vaccine
  const { data, isFetching, isLoading } =
    useGetVaccineListQuery<VaccineListResponse>({
      pageNumber,
      pageSize,
      name: vaccineName,
      categoryName: categoryName,
      manufacturerCountry: manufacturerCountry,
    })

  return (
    <>
      <h1 style={{ textAlign: 'center' }}>Danh sách vaccine</h1>

      {/* Bộ lọc tìm kiếm */}
      <Space
        style={{ marginBottom: 20, display: 'flex', justifyContent: 'center' }}
      >
        <Input
          placeholder='Nhập tên vaccine'
          value={vaccineName}
          onChange={(e) => setVaccineName(e.target.value)}
        />
        {categoriesLoading ? (
          <Spin />
        ) : (
          categories && (
            <Select
              placeholder='Chọn danh mục'
              onChange={setCategoryName}
              defaultValue={''}
            >
              <Option value={''}>Tất cả danh mục</Option>
              {categories.data.items.map((cat) => (
                <Option key={cat.id} value={cat.name}>
                  {cat.name}
                </Option>
              ))}
            </Select>
          )
        )}
        {manufacturerLoading ? (
          <Spin />
        ) : (
          manufacturers && (
            <Select
              placeholder='Select a manufacturer'
              onChange={setManufacturerCountry}
              defaultValue={''}
            >
              <Option value={''}>Tất cả các nước sản xuất</Option>
              {manufacturers.data.items.map((man: any) => (
                <Option key={man.id} value={man.name}>
                  {man.name}
                </Option>
              ))}
            </Select>
          )
        )}
      </Space>

      {isLoading || isFetching ? (
        <LoadingOutlined
          style={{
            fontSize: '50px',
            display: 'flex',
            justifyContent: 'center',
            height: '30vh',
          }}
        />
      ) : (
        <Row align='middle'>
          {data?.data?.items?.map((vaccine) => (
            <Col span={6} key={vaccine.id}>
              <Card
                hoverable
                style={{
                  borderRadius: '12px',
                  boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
                  margin: '8px',
                  minHeight: '400px',
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
                      height: '200px',
                      objectFit: 'cover',
                    }}
                  />
                }
              >
                <Title level={4}>{vaccine.name}</Title>
                <Space direction='vertical'>
                  <Text strong>Giá: {vaccine.price?.toLocaleString()} VND</Text>
                  <Text>
                    Độ tuổi: {vaccine.startRecommendedAge} -{' '}
                    {vaccine.endRecommendedAge} tuổi
                  </Text>
                  <Text>Liều lượng: {vaccine.dosage}</Text>
                  <Button
                    type='primary'
                    onClick={() => navigate(`/vaccines/${vaccine.id}`)}
                  >
                    Xem chi tiết
                  </Button>
                </Space>
              </Card>
            </Col>
          ))}
        </Row>
      )}

      {/* Phân trang */}
      {!isLoading && (
        <Pagination
          current={pageNumber}
          pageSize={pageSize}
          total={data?.data.totalItems}
          style={{ textAlign: 'center' }}
          align='center'
          onChange={(page, size) => {
            setPageNumber(page)
            setPageSize(size)
          }}
        />
      )}
    </>
  )
}
