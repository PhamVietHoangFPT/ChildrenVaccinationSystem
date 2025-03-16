import {
  Button,
  Card,
  Pagination,
  Table,
  Row,
  Col,
  Select,
  DatePicker,
  message,
  Typography,
} from 'antd'
const { Text } = Typography
import { useGetFacilitiesListQuery } from '../../features/facilities/facilitiesAPI'
import { useGetVaccineListMiniMalQuery } from '../../features/vaccine/vaccineAPI'
import { useGetChildrenListQuery } from '../../features/children/childrenAPI'
import {
  useGetPackageListMiniMalQuery,
  useGetPackageDetailQuery,
} from '../../features/package/packageAPI'
import { Facilities } from '../../types/facilities'
import { Vaccines } from '../../types/vaccine'
import { Packages, PackageDetails } from '../../types/package'
import { Children } from '../../types/children'
import { DeleteOutlined, LoadingOutlined, TagOutlined } from '@ant-design/icons'
import { useState } from 'react'
import VaccineRegisterTutorial from '../../components/Vaccine/VaccineRegisterToturial'
import { useCreateRegisterVaccinationMutation } from '../../features/vaccinations/vaccinationAPI'
const { Option } = Select
import Cookies from 'js-cookie'
import dayjs from 'dayjs'
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

interface ChildrenListResponse {
  data: {
    data: {
      items: Children[]
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
  const [pagePackageNumber, setPagePackageNumber] = useState(1)
  const [pagePackageSize, setPagePackageSize] = useState(12)
  const [selectedDate, setSelectedDate] = useState<Date | null>(null)
  const [selectedVaccines, setSelectedVaccines] = useState<string[]>([])
  const [selectedPackages, setSelectedPackages] = useState<Packages | null>(
    null
  )
  const [totalPrice, setTotalPrice] = useState<number>(0)
  const [selectedFacility, setSelectedFacility] = useState<string | null>(null)
  const [selectedChild, setSelectedChild] = useState<string | null>(null)
  const [preSelectedVaccine, setPreSelectedVaccine] = useState<string | null>(
    null
  )
  const [registerVaccination] = useCreateRegisterVaccinationMutation()
  const [paymentChoice, setPaymentChoice] = useState<string | null>(null)
  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') || '{}')
    : null
  const {
    data: vaccines,
    isFetching: vaccineFetching,
    isLoading: vaccineLoading,
  } = useGetVaccineListMiniMalQuery<VaccineListResponse>({
    pageSize: pageSize,
    pageNumber: pageNumber,
  })

  const {
    data: packages,
    isFetching: packageFetching,
    isLoading: packageLoading,
  } = useGetPackageListMiniMalQuery<PackageListResponse>({
    pageSize: pageSize,
    pageNumber: pageNumber,
  })

  const { data: packageDetail, isFetching: packageDetailFetching } =
    useGetPackageDetailQuery<PackageDetailsResponse>(
      selectedPackages?.id || null,
      {
        skip: !selectedPackages,
      }
    )

  const { data: facilities, isLoading: facilitiesLoading } =
    useGetFacilitiesListQuery<FacilitiesListResponse>({
      pageSize: -1,
      pageNumber: -1,
    })

  const { data: children, isLoading: childrenLoading } =
    useGetChildrenListQuery<ChildrenListResponse>(
      {
        parentId: userData ? userData.Id : '',
        pageNumber: -1,
        pageSize: -1,
      },
      {
        skip: !userData,
      }
    )

  // Chặn ngày nhỏ hơn hoặc bằng hôm nay
  const disabledDate = (current: dayjs.Dayjs) => {
    return current.isBefore(dayjs().endOf('day'))
  }

  const columns = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
      width: 120, // Cố định độ rộng
    },
    {
      title: 'Bệnh',
      key: 'category',
      render: (record: any) => record.category.name,
      width: 350, // Cột này rộng hơn các cột khác
    },
    {
      title: 'Nhà sản xuất',
      key: 'manufacturer',
      render: (record: any) =>
        record.manufacturer.name + ' - ' + record.manufacturer.country.name,
      width: 150,
    },
    {
      title: 'Giá',
      key: 'price',
      render: (record: any) =>
        record.price.toLocaleString().toUpperCase() + ' VND',
      width: 120,
      sorter: (a: any, b: any) => a.price - b.price,
    },
    {
      title: '',
      key: 'action',
      render: (record: any) => (
        <div
          style={{
            display: 'flex',
            justifyContent: 'flex-end',
          }}
        >
          <Button
            onClick={() => {
              setSelectedVaccines([...selectedVaccines, record])
              calculateTotalPriceAddSingleVaccine([...selectedVaccines, record])
            }}
            disabled={
              selectedVaccines.includes(record) || selectedPackages !== null
            }
            title={
              selectedVaccines.includes(record)
                ? 'Vaccine đã được chọn'
                : selectedPackages
                  ? 'Không thể chọn vaccine lẻ khi đã chọn gói vaccine'
                  : 'Chọn vaccine'
            }
          >
            Chọn
          </Button>
        </div>
      ),
      width: 100,
    },
  ]

  const packageColumns = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
      width: 120, // Cố định độ rộng
    },
    {
      title: 'Giá',
      key: 'price',
      render: (record: any) =>
        record.price.toLocaleString().toUpperCase() + ' VND',
      width: 120,
      sorter: (a: any, b: any) => a.price - b.price,
    },
    {
      title: '',
      key: 'action',
      render: (record: any) => (
        <div
          style={{
            display: 'flex',
            justifyContent: 'flex-end',
          }}
        >
          <Button
            onClick={() => {
              setSelectedPackages(record)
              calculateTotalPriceAddVaccinePackage()
              setPaymentChoice('3')
            }}
            disabled={selectedPackages !== null || selectedVaccines.length > 0}
            title={
              selectedPackages
                ? 'Gói vaccine đã được chọn'
                : selectedVaccines.length > 0
                  ? 'Không thể chọn gói vaccine khi đã chọn vaccine lẻ'
                  : 'Chọn gói vaccine'
            }
          >
            Chọn
          </Button>
        </div>
      ),
      width: 100,
    },
  ]

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

  if (vaccineLoading || facilitiesLoading || packageLoading) {
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

  const calculateTotalPriceAddSingleVaccine = (item: any) => {
    let total = 0
    console.log(item)
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

  const calculateTotalPriceAddVaccinePackage = () => {
    let total = 0
    packageDetail.data.packageItems.forEach((v: any) => {
      total += v.vaccine.price
    })
    setTotalPrice(total)
  }

  const registerVaccinationHandler = async () => {
    const data = {
      facilityId: selectedFacility,
      childId: selectedChild,
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
      window.open(res.data, '_blank')
    } catch (error: any) {
      message.error(error.message)
    }
  }

  return (
    <>
      <div style={{ marginBottom: '20px' }}>
        <h1 style={{ textAlign: 'center' }}>Đăng ký tiêm Vaccine</h1>
        <VaccineRegisterTutorial />
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
              <Table
                dataSource={vaccines.data.items}
                columns={columns}
                pagination={false}
                loading={vaccineFetching}
                style={{ marginBottom: '16px' }}
                tableLayout='fixed'
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
              <Table
                dataSource={packages.data.items}
                columns={packageColumns}
                pagination={false}
                loading={packageFetching}
                style={{ marginBottom: '16px' }}
                tableLayout='fixed'
              />
              <Pagination
                current={pagePackageNumber}
                pageSize={pagePackageSize}
                total={packages?.data.totalItems}
                pageSizeOptions={['12', '24', '36']}
                showSizeChanger={true}
                style={{ textAlign: 'center' }}
                align='center'
                onChange={(page, size) => {
                  setPagePackageNumber(page)
                  setPagePackageSize(size)
                }}
                locale={{
                  items_per_page: 'gói vaccines / trang',
                }}
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
                          calculateTotalPriceRemoveSingleVaccine([vaccine])
                          const vaccineId = vaccine.id
                          if (preSelectedVaccine === vaccineId) {
                            setPreSelectedVaccine(null)
                          }
                        }}
                      />
                    }
                    style={{ minHeight: 350 }}
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
                          setSelectedPackages(null)
                          setTotalPrice(0)
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
      {userData ? (
        <div>
          {childrenLoading ? (
            <LoadingOutlined
              style={{
                fontSize: '24px',
                display: 'block',
                textAlign: 'center',
              }}
            />
          ) : (
            <div
              style={{
                marginBottom: '20px',
              }}
            >
              <h2 style={{ textAlign: 'center' }}>Chọn con của bạn</h2>
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
                placeholder='Chọn con của bạn'
                value={selectedChild}
                onChange={(value) => setSelectedChild(value)}
              >
                {children.data.items.map((child) => (
                  <Option key={child.id} value={child.id}>
                    {child.name} -{' '}
                    {child.dateOfBirth
                      ? new Date(child.dateOfBirth).toLocaleDateString('vi-VN')
                      : 'Không có ngày sinh'}
                  </Option>
                ))}
              </Select>
            </div>
          )}
          {selectedChild && selectedVaccines.length > 0 && (
            <>
              {!selectedPackages && (
                <>
                  <div
                    style={{
                      marginBottom: '20px',
                    }}
                  >
                    <h2 style={{ textAlign: 'center' }}>
                      Chọn kiểu thanh toán
                    </h2>
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
                  {paymentChoice === '1' && (
                    <div
                      style={{
                        marginBottom: '20px',
                      }}
                    >
                      <h2 style={{ textAlign: 'center' }}>
                        Chọn vaccine thanh toán trước
                      </h2>
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
                        placeholder='Chọn vaccine thanh toán trước'
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
                  )}
                </>
              )}
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
            disabled={
              selectedFacility === null ||
              (selectedVaccines.length === 0 && selectedPackages === null)
            }
            title='Vui lòng chọn cơ sở y tế, ngày đăng ký và ít nhất 1 vaccine hoặc 1 gói vaccine'
            onClick={() => {
              registerVaccinationHandler()
            }}
          >
            Đăng ký
          </Button>
        </div>
      ) : (
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
          href='/login'
        >
          Vui lòng đăng nhập để đăng ký tiêm vaccine
        </Button>
      )}
    </>
  )
}
