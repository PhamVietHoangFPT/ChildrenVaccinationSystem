import React from 'react'
import { DatePicker, Space, Card } from 'antd'
import dayjs, { Dayjs } from 'dayjs'

interface ScheduleDateFilterProps {
    scheduleFrom: string | undefined
    scheduleTo: string | undefined
    onScheduleFromChange: (date: Dayjs | null) => void
    onScheduleToChange: (date: Dayjs | null) => void
}
const ScheduleFilter: React.FC <ScheduleDateFilterProps>= ({
    scheduleFrom,
    scheduleTo,
    onScheduleFromChange,
    onScheduleToChange,
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
             </Space>
           </Card>
    )
}
export default ScheduleFilter