// src/components/AddChildrenModal.tsx
import React, { useEffect, useState } from 'react'
import {
  Button,
  Card,
  Col,
  DatePicker,
  Input,
  message,
  Modal,
  Row,
  Select,
  Space,
  Table,
  Typography,
} from 'antd'
const { Text } = Typography
import { Children } from '../../types/children'
import { useGetVaccineListMiniMalQuery } from '../../features/vaccine/vaccineAPI'
import {
  useGetPackageDetailQuery,
  useGetPackageListMiniMalQuery,
} from '../../features/package/packageAPI'
import { useCreateRegisterVaccinationMutation } from '../../features/vaccinations/vaccinationAPI'
import { Vaccines } from '../../types/vaccine'
import { PackageDetails, Packages } from '../../types/package'
import { DeleteOutlined, LoadingOutlined, TagOutlined } from '@ant-design/icons'
import Cookies from 'js-cookie'
import dayjs from 'dayjs'
import { Option } from 'antd/es/mentions'
import { useGetCategoriesListQuery } from '../../features/categories/categoriesAPI'
import { Category } from '../../types/category'
import VaccineTable from '../Table/vaccine.table'
import PackageTable from '../Table/package.table'
interface RegisterCustomerProps {
  visible: boolean
  onClose: () => void
  children?: Children
}
interface VaccineListResponse {
  data: {
    data: {
      items: Vaccines[]
      totalItems: number
      totalPages: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

interface PackageListResponse {
  data: {
    data: {
      items: Packages[]
      totalItems: number
      totalPages: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

interface PackageDetailsResponse {
  data: {
    data: PackageDetails
  }
  isLoading: boolean
  isFetching: boolean
}

interface CategoriesListResponse {
  data: {
    data: {
      items: Category[]
    }
  }
  isLoading: boolean
}
const RegisterCustomerModal: React.FC<RegisterCustomerProps> = ({
  visible,
  onClose,
  children,
}) => {
  const [preSelectedVaccine, setPreSelectedVaccine] = useState<string | null>(
    null
  )
  const [registerVaccination] = useCreateRegisterVaccinationMutation()
  const [paymentChoice, setPaymentChoice] = useState<'1' | '2' | '3' | null>(
    null
  )
  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null
  //page number, page size
  const [pageNumber, setPageNumber] = useState(1)
  const [pageSize, setPageSize] = useState(5)
  const [pagePackageNumber, setPagePackageNumber] = useState(1)
  const [pagePackageSize, setPagePackageSize] = useState(3)

  const [selectedDate, setSelectedDate] = useState<Date | null>(null)
  const [selectedVaccines, setSelectedVaccines] = useState<string[]>([])
  const [selectedPackages, setSelectedPackages] = useState<Packages | null>(
    null
  )
  const [totalPrice, setTotalPrice] = useState<number>(0)
  const [searchCategory, setSearchCategory] = useState<string>('')
  const [searchName, setSearchName] = useState('')

  const disabledDate = (current: dayjs.Dayjs) => {
    return current.isBefore(dayjs().endOf('day'))
  }

  const { data: packageDetail, isFetching: packageDetailFetching } =
    useGetPackageDetailQuery<PackageDetailsResponse>(
      selectedPackages?.id || null,
      {
        skip: !selectedPackages,
      }
    )
  //api call
  const {
    data: vaccines,
    isFetching: vaccineFetching,
    isLoading: vaccineLoading,
    refetch: refetchVaccines,
  } = useGetVaccineListMiniMalQuery<VaccineListResponse>({
    pageSize: pageSize,
    pageNumber: pageNumber,
    categoryName: searchCategory || undefined, // Đảm bảo truyền undefined nếu rỗng
    name: searchName || undefined,
  })

  const {
    data: packages,
    isFetching: packageFetching,
    isLoading: packageLoading,
  } = useGetPackageListMiniMalQuery<PackageListResponse>({
    pageSize: pagePackageSize,
    pageNumber: pagePackageNumber,
  })

  const { data: categories } =
    useGetCategoriesListQuery<CategoriesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  useEffect(() => {
    let total = 0

    if (packageDetail?.data?.packageItems?.length) {
      total = packageDetail.data.packageItems.reduce(
        (sum, v) => sum + (v.vaccine?.price || 0),
        0
      )
    }

    setTotalPrice(total) // ✅ Hook luôn được gọi, tránh lỗi conditionally
  }, [packageDetail])

  const handleSearch = () => {
    setPageNumber(1); // Reset về trang 1 khi tìm kiếm
    refetchVaccines(); // Gọi lại API với các tham số tìm kiếm mới
  };

  const selectPackageColumns = [
    {
      title: 'Vaccine',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Giá (VND)',
      dataIndex: 'price',
      key: 'price',
      render: (price: any) => price.toLocaleString(),
    },
  ]

  const selectPackageDataSource = packageDetail?.data?.packageItems.map(
    (item, index) => ({
      key: index,
      name: item.vaccine.name,
      price: item.vaccine.price,
    })
  )
  const handleCategoryChange = (value: string) => {
    setSearchCategory(value);
    setPageNumber(1); // Reset về trang 1 khi thay đổi danh mục
    refetchVaccines(); // Gọi lại API ngay khi thay đổi danh mục
  };

  const calculateTotalPriceAddSingleVaccine = (item: any) => {
    let total = 0
    item.forEach((v: any) => {
      total += v.price
    })

    setTotalPrice(total)
  }

  const calculateTotalPriceRemoveSingleVaccine = (item: any) => {
    let total = totalPrice
    item.forEach((v: any) => {
      total -= v.price
    })
    setTotalPrice(total)
  }

  const registerVaccinationHandler = async () => {
    const data = {
      facilityId: userData?.Facility,
      childId: children?.id,
      schedule: selectedDate ? dayjs(selectedDate).format('YYYY-MM-DD') : null,
      vaccineIds: selectedVaccines.map((v: any) => v.id),
      packageId: selectedPackages?.id || null,
      paymentChoice: paymentChoice,
      vaccineId: preSelectedVaccine,
    }

    try {
      const res = (await registerVaccination(data).unwrap()) as {
        message: string
        data: string
      }
      message.success(res.message)
      clearSelected()
      window.open(res.data, '_blank')
    } catch (error: any) {
      console.log(error)
      message.error(error.data.message)
    }
  }

  const clearSelected = () => {
    setSelectedDate(null)
    setSelectedVaccines([])
    setSelectedPackages(null)
    setPaymentChoice(null)
    setPreSelectedVaccine(null)
    setTotalPrice(0)
  }

  const handlePaginationChange = (page: number, size: number) => {
    setPageNumber(page);
    setPageSize(size);
    refetchVaccines(); // Gọi lại API khi phân trang thay đổi
  };

  const handlePackagePaginationChange = (page: number, size: number) => {
    setPagePackageNumber(page);
    setPagePackageSize(size);
  };
  if (vaccineLoading || packageLoading) {
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
      <Modal
        title='Đăng ký vaccine'
        open={visible}
        onCancel={onClose}
        footer={null}
        width={1000}
      >
        <div style={{ marginBottom: '20px' }}>
          <h1 style={{ textAlign: 'center' }}>Đăng ký tiêm Vaccine</h1>
          {userData?.Facility && (
            <div>
              <div
                style={{
                  margin: '20px',
                }}
              >
                <h1
                  style={{
                    textAlign: 'center',
                  }}
                >
                  Chọn vaccine lẻ
                </h1>
                <Space
                  direction='vertical'
                  style={{
                    width: '100%',
                    display: 'flex',
                    justifyContent: 'center',
                    gap: '16px',
                    flexDirection: 'row',
                  }}
                >
                  <Input
                    value={searchName}
                    onChange={(e) => {
                      setSearchName(e.target.value);
                      setPageNumber(1); // Reset về trang 1 khi thay đổi tìm kiếm
                    }}
                    onPressEnter={handleSearch} // Tìm kiếm khi nhấn Enter
                    placeholder="Nhập tên vaccine"
                    style={{ width: '300px', height: '100%' }}
                  />
                  <Select
                    value={searchCategory}
                    onChange={handleCategoryChange} // Gọi hàm xử lý khi thay đổi danh mục
                    size="large"
                    placeholder="Chọn bệnh"
                    style={{ width: '300px' }}
                    allowClear
                  >
                    {categories?.data.items.map((category) => (
                      <Option key={category.id} value={category.name}>
                        {category.name}
                      </Option>
                    ))}
                    <Option value=''>Tất cả các loại bệnh</Option>
                  </Select>
                  <Button type='primary' onClick={handleSearch} block>
                    Tìm kiếm
                  </Button>
                </Space>
                <VaccineTable
                  vaccines={vaccines?.data.items || []}
                  loading={vaccineFetching}
                  totalItems={vaccines?.data.totalItems || 0}
                  selectedVaccines={selectedVaccines}
                  setSelectedVaccines={setSelectedVaccines}
                  selectedPackages={selectedPackages}
                  calculateTotalPriceAddSingleVaccine={calculateTotalPriceAddSingleVaccine}
                  onPaginationChange={handlePaginationChange}
                  pageNumber={pageNumber} // Truyền pageNumber
                  pageSize={pageSize}     // Truyền pageSize
                />
              </div>
              <div
                style={{
                  margin: '20px',
                }}
              >
                <h1
                  style={{
                    textAlign: 'center',
                  }}
                >
                  Chọn gói vaccine
                </h1>
                <PackageTable
                  packages={packages?.data.items || []}
                  loading={packageFetching}
                  totalItems={packages?.data.totalItems || 0}
                  selectedPackages={selectedPackages}
                  setSelectedPackages={setSelectedPackages}
                  setPaymentChoice={setPaymentChoice}
                  selectedVaccines={selectedVaccines}
                  onPaginationChange={handlePackagePaginationChange}
                />
              </div>
            </div>
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
                  <Col xs={24} sm={12} md={8} key={vaccine.id}>
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
                            setPaymentChoice(null)

                            calculateTotalPriceRemoveSingleVaccine([vaccine])
                            const vaccineId = vaccine.id
                            if (preSelectedVaccine === vaccineId) {
                              setPreSelectedVaccine(null)
                            }
                          }}
                        />
                      }
                      style={{ height: 300, border: "1px solid" }}
                    >
                      <p>
                        <strong>Nguồn gốc:</strong> {vaccine.manufacturer.name} -{' '}
                        {vaccine.manufacturer.country.name}
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
              <Card
                style={{
                  textAlign: 'center',
                  padding: 16,
                  backgroundColor: '#f5f5f5',
                  borderRadius: 8,
                  display: 'flex',
                  justifyContent: 'center',
                }}
              >
                <Text strong style={{ fontSize: '18px', color: '#1890ff' }}>
                  Tổng giá: {totalPrice.toLocaleString()} VND
                </Text>
              </Card>
            </div>
          )}
          <div>
            {selectedPackages && (
              <div
                style={{
                  width: '80%',
                  margin: 'auto',
                  display: 'flex',
                  flexDirection: 'column',
                  gap: '16px',
                }}
              >
                <h2>Gói vaccine đã chọn</h2>
                <Row align='middle'>
                  {selectedPackages && (
                    <Col key={selectedPackages.id} span={24}>
                      <Card
                        title={selectedPackages.name}
                        extra={
                          <Button
                            type='text'
                            danger
                            icon={<DeleteOutlined />}
                            onClick={() => {
                              clearSelected()
                            }}
                          />
                        }
                        style={{ minHeight: 350 }}
                      >
                        {packageDetailFetching ? (
                          <LoadingOutlined
                            style={{
                              fontSize: '24px',
                              display: 'block',
                              textAlign: 'center',
                            }}
                          />
                        ) : (
                          <>
                            <Table
                              columns={selectPackageColumns}
                              dataSource={selectPackageDataSource}
                              pagination={false}
                            />
                            <div
                              style={{
                                display: 'flex',
                                justifyContent: 'space-between',
                                alignItems: 'center',
                                marginTop: 16,
                                padding: 12,
                                backgroundColor: '#f5f5f5',
                                borderRadius: 8,
                              }}
                            >
                              <div>
                                <Text
                                  type='secondary'
                                  delete
                                  style={{ fontSize: 16 }}
                                >
                                  Giá gốc: {totalPrice.toLocaleString()} VND
                                </Text>
                              </div>
                              <div>
                                <Text
                                  strong
                                  style={{ fontSize: 18, color: '#1890ff' }}
                                >
                                  Tổng giá:{' '}
                                  {packageDetail?.data.price.toLocaleString()} VND
                                </Text>
                              </div>
                            </div>
                          </>
                        )}
                      </Card>
                    </Col>
                  )}
                </Row>
              </div>
            )}
          </div>
          <div style={{ marginTop: 16 }}>
            <h2 style={{ textAlign: 'center' }}>Chọn ngày đăng ký</h2>
            <DatePicker
              value={selectedDate ? dayjs(selectedDate) : null}
              placeholder='Chọn ngày đăng ký'
              style={{
                width: '50%',
                margin: 'auto',
                display: 'flex',
                flexDirection: 'column',
                gap: '16px',
                fontSize: '18px', // Tăng kích thước font cho Select
              }}
              size='large'
              onChange={(date) => setSelectedDate(date ? date.toDate() : null)}
              format='DD/MM/YYYY'
              disabledDate={disabledDate} // Chặn ngày quá khứ
            />
          </div>

          {selectedVaccines.length > 0 && (
            <>
              {!selectedPackages && (
                <>
                  <div
                    style={{
                      marginBottom: '20px',
                    }}
                  >
                    <h2 style={{ textAlign: 'center' }}>Chọn kiểu thanh toán</h2>
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
                      placeholder='Chọn kiểu thanh toán'
                      value={paymentChoice}
                      onChange={(value) => setPaymentChoice(value)}
                    >
                      <Option value='1'>Thanh toán trước 1 vaccine</Option>
                      <Option value='2'>Thanh toán hết</Option>
                    </Select>
                  </div>
                  <div
                    style={{
                      marginBottom: '20px',
                    }}
                  >
                    {paymentChoice === '1' ? (
                      <h2 style={{ textAlign: 'center' }}>
                        Chọn vaccine thanh toán trước
                      </h2>
                    ) : paymentChoice === '2' ? (
                      <h2 style={{ textAlign: 'center' }}>
                        Chọn vaccine tiêm trước
                      </h2>
                    ) : null}
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
                      placeholder={
                        paymentChoice === '1'
                          ? 'Chọn vaccine thanh toán trước'
                          : paymentChoice === '2'
                            ? 'Chọn vaccine tiêm trước'
                            : ''
                      }
                      value={preSelectedVaccine}
                      onChange={(value) => setPreSelectedVaccine(value)}
                    >
                      {selectedVaccines.map((vaccine: any) => (
                        <Option key={vaccine.id} value={vaccine.id}>
                          {vaccine.name}
                        </Option>
                      ))}
                    </Select>
                  </div>
                </>
              )}
            </>
          )}

          {selectedPackages && (
            <>
              <h2 style={{ textAlign: 'center' }}>Chọn vaccine tiêm trước</h2>
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
                placeholder='Chọn vaccine tiêm trước'
                value={preSelectedVaccine}
                onChange={(value) => {
                  setPreSelectedVaccine(value)
                }}
              >
                {packageDetail?.data.packageItems.map((vaccine: any) => (
                  <Option key={vaccine.vaccine.id} value={vaccine.vaccine.id}>
                    {vaccine.vaccine.name}
                  </Option>
                ))}
              </Select>
            </>
          )}

          <Button
            style={{
              width: '50%',
              margin: 'auto',
              display: 'flex',
              flexDirection: 'column',
              gap: '16px',
              fontSize: '18px', // Tăng kích thước font cho Select
            }}
            size='large'
            type='primary'
            disabled={selectedVaccines.length === 0 && selectedPackages === null}
            title='Vui lòng chọn ngày đăng ký và ít nhất 1 vaccine hoặc 1 gói vaccine'
            onClick={() => {
              registerVaccinationHandler()
            }}
          >
            Đăng ký
          </Button>
        </div>
      </Modal>
  )
}

export default RegisterCustomerModal
