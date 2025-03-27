import { useState } from 'react'
import { BarChart } from '@mui/x-charts/BarChart'
import { useGetFacilitiesMinimalQuery } from '../../features/facilities/facilitiesAPI'
import {
  useGetVaccinationsAdministeredQuery,
  useGetRegistrationsQuery,
  useGetStockDataQuery,
  useGetCompletionRateQuery,
  useGetRevenueQuery,
  useGetVaccinantionsStatusQuery,
} from '../../features/dashboard/dashboardAPI'
import { Select, DatePicker } from 'antd'
import dayjs from 'dayjs'
import { Facilities } from '../../types/facility'
const { RangePicker } = DatePicker
const { Option } = Select
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
  const [dateRange, setDateRange] = useState<[string, string]>([
    '2024-01-01',
    '2024-12-31',
  ])
  const [selectedFacility, setSelectedFacility] = useState<string | null>(null)

  const { data: vaccinationsAdministered } =
    useGetVaccinationsAdministeredQuery({
      start: dateRange[0],
      end: dateRange[1],
    })

  const handleDateChange = (dates: any, dateStrings: [string, string]) => {
    if (dates) {
      setDateRange(dateStrings)
    }
  }
  return (
    <>
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
        {facilities?.data.items.map((facility) => (
          <Option
            key={facility.id}
            value={facility.id}
            style={{ fontSize: 'large' }}
          >
            {facility.name}
          </Option>
        ))}
      </Select>

      <RangePicker
        style={{ width: '100%' }}
        size='large'
        format='YYYY-MM-DD'
        defaultValue={[dayjs(dateRange[0]), dayjs(dateRange[1])]}
        onChange={handleDateChange}
      />

      <BarChart
        data={vaccinationsAdministered?.data}
        xField='date'
        yField='count'
        groupField='status'
        height={400}
      />
    </>
  )
}

export default ManagerHomePage
