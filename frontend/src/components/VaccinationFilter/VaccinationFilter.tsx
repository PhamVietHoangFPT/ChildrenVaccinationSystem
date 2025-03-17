import React from 'react';
import { DatePicker, Space, Card } from 'antd';
import dayjs, { Dayjs } from 'dayjs';

interface VaccinationDateFilterProps {
    scheduleFrom: string | undefined;
    scheduleTo: string | undefined;
    onScheduleFromChange: (date: Dayjs | null) => void;
    onScheduleToChange: (date: Dayjs | null) => void;
}

const VaccinationDateFilter: React.FC<VaccinationDateFilterProps> = ({
    scheduleFrom,
    scheduleTo,
    onScheduleFromChange,
    onScheduleToChange,
}) => {
    return (
        <Card style={{ marginBottom: 20 }}>
            <Space direction="horizontal" size="middle" style={{ width: '100%' }}>
                <Space>
                    <span>Schedule From:</span>
                    <DatePicker
                        value={scheduleFrom ? dayjs(scheduleFrom) : null}
                        onChange={onScheduleFromChange}
                        format="YYYY-MM-DD"
                        placeholder="Select start date"
                    />
                </Space>
                <Space>
                    <span>Schedule To:</span>
                    <DatePicker
                        value={scheduleTo ? dayjs(scheduleTo) : null}
                        onChange={onScheduleToChange}
                        format="YYYY-MM-DD"
                        placeholder="Select end date"
                    />
                </Space>
            </Space>
        </Card>
    );
};

export default VaccinationDateFilter;