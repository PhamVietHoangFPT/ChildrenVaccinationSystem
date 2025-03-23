import React from 'react'
import { DatePicker, Space, Card, Select } from 'antd'
import dayjs, { Dayjs } from 'dayjs'

const { Option } = Select

interface VaccinationDateFilterProps {
  scheduleFrom: string | undefined
  scheduleTo: string | undefined
  status: number | undefined
  onScheduleFromChange: (date: Dayjs | null) => void
  onScheduleToChange: (date: Dayjs | null) => void
  onStatusChange: (status: number | undefined) => void
}

const VaccinationDateFilter: React.FC<VaccinationDateFilterProps> = ({
  scheduleFrom,
  scheduleTo,
  status,
  onScheduleFromChange,
  onScheduleToChange,
  onStatusChange,
}) => {
  return (
    <Card style={{ marginBottom: 20 }}>
      <Space direction='vertical' size='middle' style={{ width: '100%' }}>
        <Space direction='horizontal' size='middle'>
          <Space>
            <span>Schedule From:</span>
            <DatePicker
              value={scheduleFrom ? dayjs(scheduleFrom) : null}
              onChange={onScheduleFromChange}
              format='YYYY-MM-DD'
              placeholder='Select start date'
            />
          </Space>
          <Space>
            <span>Schedule To:</span>
            <DatePicker
              value={scheduleTo ? dayjs(scheduleTo) : null}
              onChange={onScheduleToChange}
              format='YYYY-MM-DD'
              placeholder='Select end date'
            />
          </Space>
        </Space>
        <Space>
          <span>Status:</span>
          <Select
            value={status}
            onChange={onStatusChange}
            placeholder='Select status'
            style={{ width: 200 }}
            allowClear
          >
            <Option value={0}>Pending</Option>
            <Option value={1}>Paid</Option>
            <Option value={2}>Consulting</Option>
            <Option value={3}>Queued</Option>
            <Option value={4}>Injecting</Option>
            <Option value={5}>Monitoring</Option>
            <Option value={6}>Completed</Option>
            <Option value={7}>Emergency</Option>
            <Option value={8}>Canceled</Option>
            <Option value={9}>Refunded</Option>
          </Select>
        </Space>
      </Space>
    </Card>
  )
}

export default VaccinationDateFilter
