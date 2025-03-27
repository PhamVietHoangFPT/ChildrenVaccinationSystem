import { useState } from 'react'

import { LineChart, BarChart } from '@mui/x-charts'
import { useGetFacilitiesMinimalQuery } from '../../features/facilities/facilitiesAPI'

import {
  useGetVaccinationsAdministeredQuery,
  useGetRegistrationsQuery,
  useGetRevenueQuery,
  useGetTopFacilitiesQuery,
  useGetTopVaccineQuery,
  useGetVaccinantionsStatusQuery,
} from '../../features/dashboard/dashboardAPI'
import { Select, DatePicker, Row, Col, ConfigProvider, Card } from 'antd'
import viVN from 'antd/locale/vi_VN'
import dayjs from 'dayjs'
import 'dayjs/locale/vi' // Import ngôn ngữ tiếng Việt cho dayjs
dayjs.locale('vi') // Thiết lập locale mặc định cho dayjs
import { Facilities } from '../../types/facility'
const { RangePicker } = DatePicker
const { Option } = Select

const rankColors = ['#FFD700', '#C0C0C0', '#CD7F32', '#85a5ff', '#73d13d']
import { LoadingOutlined } from '@ant-design/icons'
interface FacilitiesListResponse {
  data: {
    data: {
      items: Facilities[]
    }
  }
  isLoading: boolean
}

const ManagerHomePage = () => {
  const { data: facilities, isLoading: facilitiesLoading } =
    useGetFacilitiesMinimalQuery<FacilitiesListResponse>({
      pageSize: -1,
      pageNumber: -1,
    })
  const [dateRange, setDateRange] = useState<[dayjs.Dayjs, dayjs.Dayjs]>([
    dayjs(`01/${dayjs().year()}`, 'MM/YYYY'),
    dayjs(`12/${dayjs().year()}`, 'MM/YYYY'),
  ])

  const [selectedFacility, setSelectedFacility] = useState<string | null>('')

  const dataQuery = {
    startMonth: dayjs(dateRange[0], 'MM/YYYY').format('MM'),
    startYear: dayjs(dateRange[0], 'MM/YYYY').format('YYYY'),
    endMonth: dayjs(dateRange[1], 'MM/YYYY').format('MM'),
    endYear: dayjs(dateRange[1], 'MM/YYYY').format('YYYY'),
    facilityId: selectedFacility,
  }

  const {
    data: vaccinationsAdministered,
    isLoading: vaccinationsAdministeredLoading,
    isFetching: vaccinationsAdministeredFetching,
  } = useGetVaccinationsAdministeredQuery(dataQuery)

  const {
    data: registrations,
    isLoading: registrationsLoading,
    isFetching: registrationsFetching,
  } = useGetRegistrationsQuery({
    startMonth: dayjs(dateRange[0], 'MM/YYYY').format('MM'),
    startYear: dayjs(dateRange[0], 'MM/YYYY').format('YYYY'),
    endMonth: dayjs(dateRange[1], 'MM/YYYY').format('MM'),
    endYear: dayjs(dateRange[1], 'MM/YYYY').format('YYYY'),
  })

  const {
    data: revenue,
    isLoading: revenueLoading,
    isFetching: revenueFetching,
  } = useGetRevenueQuery(dataQuery)

  const {
    data: vaccinationsStatus,
    isLoading: vaccinationsStatusLoading,
    isFetching: vaccinationsStatusFetching,
  } = useGetVaccinantionsStatusQuery(dataQuery)

  const {
    data: topVaccine,
    isLoading: topVaccineLoading,
    isFetching: topVaccineFetching,
  } = useGetTopVaccineQuery({
    topN: 5,
    facilityId: selectedFacility,
  })

  const {
    data: topFacilities,
    isLoading: topFacilitiesLoading,
    isFetching: topFacilitiesFetching,
  } = useGetTopFacilitiesQuery({
    topN: 5,
  })

  const handleDateChange = (
    dates: [dayjs.Dayjs | null, dayjs.Dayjs | null] | null
  ) => {
    if (dates && dates[0] && dates[1]) {
      setDateRange([dates[0], dates[1]])
    }
  }

  const statusLabels: Record<number, string> = {
    0: 'Chưa thanh toán',
    6: 'Hoàn thành',
    8: 'Đã hủy',
    9: 'Hoàn tiền',
  }

  return (
    <>
      <Row>
        <Col span={12}>
          <div>
            <h2 style={{ textAlign: 'center' }}>Chọn cơ sở y tế</h2>
            {facilitiesLoading ? (
              <LoadingOutlined
                style={{
                  fontSize: '50px',
                  display: 'flex',
                  justifyContent: 'center',
                  alignItems: 'center',
                }}
              />
            ) : (
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
                {facilities?.data.items.map((facility) => (
                  <Option
                    key={facility.id}
                    value={facility.id}
                    style={{ fontSize: 'large' }}
                  >
                    {facility.name}
                  </Option>
                ))}
                <Option value='' style={{ fontSize: 'large' }}>
                  Tất cả cơ sở
                </Option>
              </Select>
            )}
          </div>
        </Col>
        <Col span={12}>
          <div>
            <h2 style={{ textAlign: 'center' }}>Chọn thời gian</h2>
            <ConfigProvider locale={viVN}>
              <RangePicker
                style={{ width: '100%' }}
                size='large'
                picker='month'
                format='MM/YYYY'
                defaultValue={[
                  dayjs(dateRange[0], 'MM/YYYY'),
                  dayjs(dateRange[1], 'MM/YYYY'),
                ]}
                onChange={handleDateChange}
              />
            </ConfigProvider>
          </div>
        </Col>
      </Row>

      <Row gutter={16} style={{ marginTop: 20 }}>
        {topVaccineLoading || topVaccineFetching ? (
          <Col span={12}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={12}>
            <Card
              style={{
                borderRadius: 12,
                boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
              }}
            >
              <h3
                style={{
                  textAlign: 'center',
                  fontSize: 18,
                  fontWeight: 600,
                  marginBottom: 10,
                }}
              >
                🌟 Top 5 vắc xin được sử dụng nhiều nhất
              </h3>
              <ul style={{ listStyleType: 'none', padding: 0, margin: 0 }}>
                {topVaccine?.data
                  ?.slice(0, 5)
                  .map((item: any, index: number) => (
                    <li
                      key={item.vaccineId}
                      style={{
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        padding: '10px 15px',
                        borderBottom:
                          index !== 4 ? '1px solid #f0f0f0' : 'none',
                        fontSize: 16,
                        fontWeight: index === 0 ? 700 : 500, // Nhấn mạnh top 1
                        color: index === 0 ? '#222' : '#555',
                      }}
                    >
                      <span
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: 10,
                        }}
                      >
                        <span
                          style={{
                            backgroundColor: rankColors[index], // Màu theo thứ hạng
                            color: '#fff',
                            width: 24,
                            height: 24,
                            display: 'flex',
                            justifyContent: 'center',
                            alignItems: 'center',
                            borderRadius: '50%',
                            fontSize: 14,
                            fontWeight: 600,
                          }}
                        >
                          {index + 1}
                        </span>
                        {item.vaccineName}
                      </span>
                      <span style={{ fontWeight: 600, fontSize: 16 }}>
                        {item.totalCount.toLocaleString()}
                      </span>
                    </li>
                  ))}
              </ul>
            </Card>
          </Col>
        )}
        {topFacilitiesLoading || topFacilitiesFetching ? (
          <Col span={12}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={12}>
            <Card
              style={{
                borderRadius: 12,
                boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
              }}
            >
              <h3
                style={{
                  textAlign: 'center',
                  fontSize: 18,
                  fontWeight: 600,
                  marginBottom: 10,
                }}
              >
                🌟 Top 5 cơ sở có doanh thu cao nhất
              </h3>
              <ul style={{ listStyleType: 'none', padding: 0, margin: 0 }}>
                {topFacilities?.data
                  ?.slice(0, 5)
                  .map((item: any, index: number) => (
                    <li
                      key={item.facilityId}
                      style={{
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        padding: '10px 15px',
                        borderBottom:
                          index !== 4 ? '1px solid #f0f0f0' : 'none',
                        fontSize: 16,
                        fontWeight: index === 0 ? 700 : 500, // Nhấn mạnh top 1
                        color: index === 0 ? '#222' : '#555',
                      }}
                    >
                      <span
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: 10,
                        }}
                      >
                        <span
                          style={{
                            backgroundColor: rankColors[index], // Màu theo thứ hạng
                            color: '#fff',
                            width: 24,
                            height: 24,
                            display: 'flex',
                            justifyContent: 'center',
                            alignItems: 'center',
                            borderRadius: '50%',
                            fontSize: 14,
                            fontWeight: 600,
                          }}
                        >
                          {index + 1}
                        </span>
                        {item.facilityName}
                      </span>
                      <span style={{ fontWeight: 600, fontSize: 16 }}>
                        {item.totalRevenue.toLocaleString()} VND
                      </span>
                    </li>
                  ))}
              </ul>
            </Card>
          </Col>
        )}
      </Row>

      <Row gutter={16}>
        {registrationsLoading || registrationsFetching ? (
          <Col span={24}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={24}>
            <h2 style={{ textAlign: 'center' }}>Số lượt đăng ký</h2>
            <BarChart
              dataset={registrations?.data?.result?.map((item: any) => ({
                period: dayjs(item.period, 'YYYY-MM').format('MM/YYYY'), // Định dạng MM/YYYY
                count: item.count, // Dữ liệu số lượt đăng ký
              }))}
              xAxis={[{ scaleType: 'band', dataKey: 'period' }]}
              yAxis={[
                {
                  scaleType: 'linear',
                  dataKey: 'count',
                  valueFormatter: (value) => {
                    if (value >= 1_000_000)
                      return `${(value / 1_000_000).toLocaleString()}M` // Triệu
                    if (value >= 1_000)
                      return `${(value / 1_000).toLocaleString()}K` // Nghìn
                    return value.toLocaleString() // Nếu nhỏ hơn 1K thì giữ nguyên
                  },
                },
              ]}
              series={[{ dataKey: 'count', label: 'Số lượt đăng ký' }]}
              height={400}
            />
          </Col>
        )}
      </Row>

      <Row gutter={16}>
        {vaccinationsAdministeredLoading || vaccinationsAdministeredFetching ? (
          <Col span={8}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={8}>
            <h2 style={{ textAlign: 'center' }}>
              Số lượng liều vắc xin đã tiêm
            </h2>
            <BarChart
              dataset={vaccinationsAdministered?.data?.result?.map(
                (item: any) => ({
                  period: dayjs(item.period, 'YYYY-MM').format('MM/YYYY'), // Chuyển thành MM/YYYY
                  totalCount: item.totalCount, // Giữ nguyên giá trị
                })
              )}
              xAxis={[{ scaleType: 'band', dataKey: 'period' }]}
              yAxis={[
                {
                  scaleType: 'linear',
                  dataKey: 'totalCount',
                  valueFormatter: (value) => {
                    if (value >= 1_000_000)
                      return `${(value / 1_000_000).toLocaleString()}M` // Triệu
                    if (value >= 1_000)
                      return `${(value / 1_000).toLocaleString()}K` // Nghìn
                    return value.toLocaleString() // Nếu nhỏ hơn 1K thì giữ nguyên
                  },
                },
              ]}
              series={[
                { dataKey: 'totalCount', label: 'Số mũi vắc xin đã tiêm' },
              ]}
              height={400}
            />
          </Col>
        )}

        {vaccinationsStatusLoading || vaccinationsStatusFetching ? (
          <Col span={8}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={8}>
            <h2 style={{ textAlign: 'center' }}>Tình trạng tiêm chủng</h2>
            <BarChart
              dataset={vaccinationsStatus?.data?.map((item: any) => ({
                period: dayjs(item.period, 'YYYY-MM').format('MM/YYYY'),
                ...Object.fromEntries(
                  item.statusCounts.map((statusItem: any) => [
                    statusLabels[statusItem.status],
                    statusItem.count,
                  ])
                ),
              }))}
              xAxis={[{ scaleType: 'band', dataKey: 'period' }]}
              yAxis={[
                {
                  scaleType: 'linear',
                  valueFormatter: (value) => {
                    if (value >= 1_000_000)
                      return `${(value / 1_000_000).toLocaleString()}M` // Triệu
                    if (value >= 1_000)
                      return `${(value / 1_000).toLocaleString()}K` // Nghìn
                    return value.toLocaleString() // Nếu nhỏ hơn 1K thì giữ nguyên
                  },
                },
              ]}
              series={[
                {
                  dataKey: 'Chưa thanh toán',
                  label: 'Chưa thanh toán',
                  color: '#FF4D4F',
                },
                {
                  dataKey: 'Hoàn thành',
                  label: 'Hoàn thành',
                  color: '#FA8C16',
                },
                {
                  dataKey: 'Đã hủy',
                  label: 'Đã hủy',
                  color: '#52C41A',
                },
                {
                  dataKey: 'Hoàn tiền',
                  label: 'Hoàn tiền',
                  color: '#1890FF',
                },
              ]}
              height={400}
            />
          </Col>
        )}

        {revenueLoading || revenueFetching ? (
          <Col span={8}>
            <LoadingOutlined
              style={{
                fontSize: '50px',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          </Col>
        ) : (
          <Col span={8}>
            <h2 style={{ textAlign: 'center' }}>Doanh thu</h2>
            <LineChart
              dataset={revenue?.data?.result?.map((item: any) => ({
                period: dayjs(item.period, 'YYYY-MM').format('MM/YYYY'), // Chuyển thành MM/YYYY
                revenue: item.revenue, // Giữ nguyên giá trị
              }))}
              yAxis={[
                {
                  scaleType: 'linear',
                  dataKey: 'revenue',
                  valueFormatter: (value) => {
                    if (value >= 1_000_000_000)
                      return `${(value / 1_000_000_000).toLocaleString()}B` // Tỷ (Billion)
                    if (value >= 1_000_000)
                      return `${(value / 1_000_000).toLocaleString()}M` // Triệu (Million)
                    if (value >= 1_000)
                      return `${(value / 1_000).toLocaleString()}K` // Nghìn (Thousand)
                    return value.toLocaleString() // Nếu nhỏ hơn 1K thì hiển thị bình thường
                  },
                },
              ]}
              xAxis={[{ scaleType: 'band', dataKey: 'period' }]}
              series={[{ dataKey: 'revenue', label: 'Doanh thu tháng' }]}
              height={400}
            />
          </Col>
        )}
      </Row>
    </>
  )
}

export default ManagerHomePage
