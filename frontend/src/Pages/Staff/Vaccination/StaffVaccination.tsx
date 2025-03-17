import React, { useEffect, useState } from 'react';
import { Vaccination } from '../../../types/vaccination';
import { useSearchParams } from 'react-router-dom';
import {
    CheckCircleOutlined,
    ClockCircleOutlined,
    EditOutlined,
    ExclamationCircleOutlined,
    LoadingOutlined,
    MinusCircleOutlined,
    SyncOutlined,
} from '@ant-design/icons';
import { Button, Table, Tag } from 'antd';
import { useGetVaccinationListQuery } from '../../../features/vaccinations/vaccinationAPI';
import dayjs, { Dayjs } from 'dayjs';
import VaccinationDateFilter from '../../../components/VaccinationFilter/VaccinationFilter';

interface VaccinationListResponse {
    data: {
        data: {
            items: Vaccination[];
            totalItems: number;
        };
    };
    isLoading: boolean;
    isFetching: boolean;
}

const StaffVaccination: React.FC = () => {
    const [searchParams, setSearchParams] = useSearchParams();

    // Pagination and search states from URL
    const initialPage = parseInt(searchParams.get('page') || '1', 10);
    const initialScheduleFrom = searchParams.get('scheduleFrom') || undefined;
    const initialScheduleTo = searchParams.get('scheduleTo') || undefined;
    const initialStatus = searchParams.get('status')
        ? parseInt(searchParams.get('status')!, 10)
        : undefined; // Default to undefined if not present

    const [currentPage, setCurrentPage] = useState(initialPage);
    const [scheduleFrom, setScheduleFrom] = useState<string | undefined>(initialScheduleFrom);
    const [scheduleTo, setScheduleTo] = useState<string | undefined>(initialScheduleTo);
    const [status, setStatus] = useState<number | undefined>(initialStatus);
    const pageSize = 7;

    // Fetch vaccination list with dynamic filters
    const {
        data: vaccinations,
        isFetching: vaccinationFetching,
        isLoading: vaccinationLoading,
    } = useGetVaccinationListQuery<VaccinationListResponse>({
        status: status,
        pageNumber: currentPage,
        pageSize: pageSize,
        scheduleFrom,
        scheduleTo,
    });

    const dateVaccinations = vaccinations?.data.items ?? [];
    const totalVaccinations = vaccinations?.data.totalItems ?? 0;

    // Update URL search params for pagination, date filters, and status
    useEffect(() => {
        const params: { [key: string]: string } = {
            page: currentPage.toString(),
        };
        if (scheduleFrom) params.scheduleFrom = scheduleFrom;
        if (scheduleTo) params.scheduleTo = scheduleTo;
        if (status !== undefined) params.status = status.toString();

        setSearchParams(params);
    }, [currentPage, scheduleFrom, scheduleTo, status, setSearchParams]);

    // Handle date changes
    const handleScheduleFromChange = (date: Dayjs | null) => {
        setScheduleFrom(date ? date.format('YYYY-MM-DD') : undefined);
        setCurrentPage(1); // Reset to first page on filter change
    };

    const handleScheduleToChange = (date: Dayjs | null) => {
        setScheduleTo(date ? date.format('YYYY-MM-DD') : undefined);
        setCurrentPage(1); // Reset to first page on filter change
    };

    const handleStatusChange = (value: number | undefined) => {
        setStatus(value);
        setCurrentPage(1); // Reset to first page on filter change
    };

    // Loading state for the table
    if (vaccinationLoading && !vaccinationFetching) {
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
        );
    }

    const columns = [
        {
            title: 'No.',
            key: 'index',
            render: (_: any, __: Vaccination, index: number) =>
                (currentPage - 1) * pageSize + index + 1,
        },
        {
            title: 'Child Name',
            dataIndex: 'child.name',
            key: 'childName',
            render: (_: string | undefined, record: Vaccination) =>
                record.child?.name ?? 'N/A',
        },
        {
            title: 'Schedule',
            dataIndex: 'schedule',
            key: 'schedule',
            render: (schedule: Date | undefined) =>
                schedule ? dayjs(schedule).format('YYYY-MM-DD') : 'N/A',
        },
        {
            title: 'Vaccine Name',
            dataIndex: 'vaccine.name',
            key: 'vaccineName',
            render: (_: string | undefined, record: Vaccination) =>
                record.vaccine?.name ?? 'N/A',
        },
        {
            title: 'Status',
            dataIndex: 'status',
            key: 'status',
            render: (status: number | undefined) => {
                switch (status) {
                    case 0:
                        return <Tag color="geekblue">Pending</Tag>;
                    case 1:
                        return <Tag color="processing">Paid</Tag>;
                    case 2:
                        return <Tag color="purple">Consulting</Tag>;
                    case 3:
                        return <Tag color="blue" icon={<SyncOutlined spin />}>Queued</Tag>;
                    case 4:
                        return <Tag color="magenta" icon={<ExclamationCircleOutlined />}>Injecting</Tag>;
                    case 5:
                        return <Tag color="orange" icon={<ExclamationCircleOutlined />}>Monitoring</Tag>;
                    case 6:
                        return <Tag color="success" icon={<CheckCircleOutlined />}>Completed</Tag>;
                    case 7:
                        return <Tag color="error" icon={<ClockCircleOutlined />}>Emergency</Tag>;
                    case 8:
                        return <Tag color="red" icon={<MinusCircleOutlined />}>Canceled</Tag>;
                    case 9:
                        return <Tag color="purple">Refunded</Tag>;
                    default:
                        return <Tag color="gray">Unknown</Tag>;
                }
            },
        },
        {
            title: 'Gender',
            dataIndex: 'child.gender',
            key: 'gender',
            render: (gender: boolean | undefined) =>
                gender === undefined ? 'N/A' : gender ? 'Male' : 'Female',
        },
        {
            title: 'Update',
            key: 'update',
            render: (_: any) => (
                <Button type="primary" icon={<EditOutlined />} />
            ),
        },
    ];

    return (
        <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
            <VaccinationDateFilter
                scheduleFrom={scheduleFrom}
                scheduleTo={scheduleTo}
                status={status}
                onScheduleFromChange={handleScheduleFromChange}
                onScheduleToChange={handleScheduleToChange}
                onStatusChange={handleStatusChange}
            />
            <Table
                columns={columns}
                dataSource={dateVaccinations.map((item) => ({
                    ...item,
                    key: item.id,
                }))}
                loading={vaccinationFetching}
                bordered
                pagination={{
                    current: currentPage,
                    pageSize: pageSize,
                    total: totalVaccinations,
                    pageSizeOptions: ['1', '5', '10', '20'],
                    onChange: (page) => {
                        setCurrentPage(page);
                    },
                }}
            />
        </div>
    );
};

export default StaffVaccination;