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
import { Button, Table, Tag, AutoComplete } from 'antd'; // Replaced Input with AutoComplete
import { useGetVaccinationListQuery } from '../../../features/vaccinations/vaccinationAPI';
import dayjs, { Dayjs } from 'dayjs';
import VaccinationDateFilter from '../../../components/VaccinationFilter/VaccinationFilter';
import { Children } from '../../../types/children';
import { useGetChildrenListQuery } from '../../../features/children/childrenAPI';
import VaccinationUpdateModal from '../../../components/Modal/Vaccination/vaccinationDetail.modal';

interface ChildrenListResponse {
    data: {
        data: {
            items: Children[];
            totalItems: number;
        };
    };
    isLoading?: boolean;
    isFetching?: boolean;
}

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
        : undefined;
    const initialChildCode = searchParams.get('childCode') || undefined;

    const [currentPage, setCurrentPage] = useState(initialPage);
    const [scheduleFrom, setScheduleFrom] = useState<string | undefined>(initialScheduleFrom);
    const [scheduleTo, setScheduleTo] = useState<string | undefined>(initialScheduleTo);
    const [status, setStatus] = useState<number | undefined>(initialStatus);
    const [childCode, setChildCode] = useState<string | undefined>(initialChildCode);
    const [searchValue, setSearchValue] = useState<string>(initialChildCode || ''); // For AutoComplete input
    const pageSize = 7;
    // Modal state
    const [isDetailModalVisible, setIsDetailModalVisible] = useState(false)
    const [selectedVaccinationId, setSelectedVaccinationId] = useState<string | null>(null)
    // Fetch vaccination list with dynamic filters including childCode
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
        childCode,
    });

    const dateVaccinations = vaccinations?.data.items ?? [];
    const totalVaccinations = vaccinations?.data.totalItems ?? 0;

    // Fetch children list for childCode options
    const {
        data: children,
        isFetching: childrenFetching,
    } = useGetChildrenListQuery<ChildrenListResponse>({
        pageNumber: 1,
        pageSize: 100, // Adjust this if you need more or fewer options
    });

    const dataChildren = children?.data.items ?? [];

    // Update URL search params for pagination, date filters, status, and childCode
    useEffect(() => {
        const params: { [key: string]: string } = {
            page: currentPage.toString(),
        };
        if (scheduleFrom) params.scheduleFrom = scheduleFrom;
        if (scheduleTo) params.scheduleTo = scheduleTo;
        if (status !== undefined) params.status = status.toString();
        if (childCode) params.childCode = childCode;

        setSearchParams(params);
    }, [currentPage, scheduleFrom, scheduleTo, status, childCode, setSearchParams]);

    // Handle date changes
    const handleScheduleFromChange = (date: Dayjs | null) => {
        setScheduleFrom(date ? date.format('YYYY-MM-DD') : undefined);
        setCurrentPage(1);
    };

    const handleScheduleToChange = (date: Dayjs | null) => {
        setScheduleTo(date ? date.format('YYYY-MM-DD') : undefined);
        setCurrentPage(1);
    };

    const handleStatusChange = (value: number | undefined) => {
        setStatus(value);
        setCurrentPage(1);
    };

    // Handle childCode selection from AutoComplete
    const handleChildCodeSelect = (value: string) => {
        const trimmedValue = value.trim();
        setChildCode(trimmedValue || undefined);
        setSearchValue(trimmedValue);
        setCurrentPage(1);
    };

    // Handle AutoComplete input change
    const handleSearchChange = (value: string) => {
        setSearchValue(value);
    };

    // Map dataChildren to AutoComplete options
    const options = dataChildren.map((child) => ({
        value: child.childCode || undefined, // Assuming childCode is a property in Children type
        label: `${child.childCode} - ${child.name || 'N/A'}`, // Optional: Enhance display with name
    }));

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
            title: 'Note',
            dataIndex: 'note',
            key: 'note',
            render: (note: string) => note ? note : 'None'
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
            title: 'Update',
            key: 'update',
            render: (_: any, record: Vaccination) => (
                <Button
                    type='primary'
                    icon={<EditOutlined />}
                    onClick={() => {
                        setSelectedVaccinationId(record.id) // Set the selected customer ID
                        setIsDetailModalVisible(true) // Show the modal
                    }}
                />
            ),
        },
    ];
    // Handle modal close
    const handleDetailModalClose = () => {
        setIsDetailModalVisible(false)
        setSelectedVaccinationId(null)
    }
    return (
        <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
            <div style={{ marginBottom: 16 }}>
                <AutoComplete
                    style={{ width: 300 }}
                    options={options}
                    placeholder="Search by Child Code"
                    value={searchValue}
                    onSelect={handleChildCodeSelect}
                    onChange={handleSearchChange}
                    onSearch={(value) => {
                        if (!value) {
                            setChildCode(undefined);
                            setCurrentPage(1);
                        }
                    }}
                    allowClear
                    filterOption={(inputValue, option) =>
                        (option?.value?.toUpperCase() || '').indexOf(
                            inputValue.toUpperCase()
                        ) !== -1 ||
                        (option?.label?.toString().toUpperCase() || '').indexOf(
                            inputValue.toUpperCase()
                        ) !== -1
                    }
                />
            </div>
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
                loading={vaccinationFetching || childrenFetching} // Include childrenFetching
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
            <VaccinationUpdateModal
                visible={isDetailModalVisible}
                id={selectedVaccinationId}
                onClose={handleDetailModalClose}
            />
        </div>
    );
};

export default StaffVaccination;