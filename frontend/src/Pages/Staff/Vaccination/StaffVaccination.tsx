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
import { Button, Table, Tag, AutoComplete, message } from 'antd'; // Replaced Input with AutoComplete
import { useGetVaccinationListQuery, useUpdateVaccinationStatusMutation } from '../../../features/vaccinations/vaccinationAPI';
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
    const [updateVaccinationStatus, { isLoading: isUpdating }] = useUpdateVaccinationStatusMutation();
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

    // Handle date changes with validation
    const handleScheduleFromChange = (date: Dayjs | null) => {
        const newDate = date ? date.format('YYYY-MM-DD') : undefined;
        if (newDate && scheduleTo && dayjs(scheduleTo).isBefore(newDate)) {
            setScheduleTo(undefined);
        }
        setScheduleFrom(newDate);
        setCurrentPage(1);
    };

    const handleScheduleToChange = (date: Dayjs | null) => {
        const newDate = date ? date.format('YYYY-MM-DD') : undefined;
        if (newDate && scheduleFrom && dayjs(newDate).isBefore(scheduleFrom)) {
            return; // Prevent invalid date selection
        }
        setScheduleTo(newDate);
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
    const handleStatusChangeClick = async (id: string, newStatus: number, vaccination: Vaccination) => {
        try {
            // Check if changing to Consulting (status 2) and doctor doesn't exist
            if (newStatus === 2 && (!vaccination.doctor || !vaccination.doctor.id)) {
                message.error('Cannot set to Consulting: No doctor assigned');
                return;
            }
            // Check for Injecting (status 4) - vaccinator required
            if (newStatus === 4 && (!vaccination.vaccinator || !vaccination.vaccinator.id)) {
                message.error('Cannot set to Injecting: No vaccinator assigned');
                return;
            }

            await updateVaccinationStatus({ id, status: newStatus }).unwrap();
            message.success('Status updated successfully');
        } catch (error) {
            console.error('Failed to update status:', error);
            message.error('Failed to update status');
        }
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
    console.log(dateVaccinations)
    const columns = [
        {
            title: 'No.',
            key: 'index',
            render: (_: any, __: Vaccination, index: number) =>
                (currentPage - 1) * pageSize + index + 1,
        },
        {
            title: 'Tên trẻ',
            dataIndex: 'child.name',
            key: 'childName',
            render: (_: string | undefined, record: Vaccination) =>
                <span style={{ fontSize: '12px' }}>{record.child?.name ?? 'N/A'}</span>,
        },
        {
            title: 'Vaccine',
            dataIndex: 'vaccine.name',
            key: 'vaccineName',
            render: (_: string | undefined, record: Vaccination) =>
                <span style={{ fontSize: '12px' }}>{record.vaccine?.name ?? 'N/A'}</span>,
        },
        {
            title: 'Thứ tự mũi',
            dataIndex: 'currentSequence',
            key: 'currentSequence',
            render: (currentSequence: number) => (<span style={{ fontSize: '12px' }}>Mũi thứ {currentSequence}</span>)
        },
        {
            title: 'Lịch tiêm',
            dataIndex: 'schedule',
            key: 'schedule',
            render: (schedule: Date | undefined) =>
                <span style={{ fontSize: '12px' }}>{schedule ? dayjs(schedule).format('YYYY-MM-DD') : 'N/A'}</span>,
        },
        {
            title: 'Trạng thái',
            dataIndex: 'status',
            key: 'status',
            render: (status: number | undefined) => {
                const tagStyle: React.CSSProperties = {
                    width: '80px', // string is fine for widt
                    textAlign: 'center', // explicitly use a valid TextAlign value
                    display: 'inline-flex', // valid display value
                    alignItems: 'center', // valid align-items value
                    justifyContent: 'center', // valid justify-content value
                };

                switch (status) {
                    case 0:
                        return <Tag color="geekblue" style={tagStyle}>Pending</Tag>;
                    case 1:
                        return <Tag color="processing" style={tagStyle}>Paid</Tag>;
                    case 2:
                        return <Tag color="purple" style={tagStyle}>Consulting</Tag>;
                    case 3:
                        return <Tag color="blue" icon={<SyncOutlined spin />} style={tagStyle}>Queued</Tag>;
                    case 4:
                        return <Tag color="magenta" icon={<ExclamationCircleOutlined />} style={tagStyle}>Injecting</Tag>;
                    case 5:
                        return <Tag color="orange" icon={<ExclamationCircleOutlined />} style={tagStyle}>Monitoring</Tag>;
                    case 6:
                        return <Tag color="success" icon={<CheckCircleOutlined />} style={tagStyle}>Completed</Tag>;
                    case 7:
                        return <Tag color="error" icon={<ClockCircleOutlined />} style={tagStyle}>Emergency</Tag>;
                    case 8:
                        return <Tag color="red" icon={<MinusCircleOutlined />} style={tagStyle}>Canceled</Tag>;
                    case 9:
                        return <Tag color="red" style={tagStyle}>Refunded</Tag>;
                    default:
                        return <Tag color="gray" style={tagStyle}>Unknown</Tag>;
                }
            },
        },
        {
            title: 'Cập nhật',
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
        {
            title: 'Đổi trạng thái',
            key: 'changeStatus',
            render: (_: any, record: Vaccination) => (
                <>
                    {record.status === 1 && (
                        <div style={{ display: 'flex', gap: '8px' }}>
                            <Button
                                size="small"
                                type="primary"
                                loading={isUpdating}
                                onClick={() => handleStatusChangeClick(record.id, 2, record)}
                                disabled={isUpdating}
                            >
                                Consulting
                            </Button>
                            <Button
                                size="small"
                                type="primary"
                                danger
                                loading={isUpdating}
                                onClick={() => handleStatusChangeClick(record.id, 9, record)}
                                disabled={isUpdating}
                            >
                                Refunded
                            </Button>
                        </div>
                    )}
                    {record.status === 3 && (
                        <Button
                            size="small"
                            type="primary"
                            loading={isUpdating}
                            onClick={() => handleStatusChangeClick(record.id, 4, record)}
                            disabled={isUpdating}
                        >
                            Injecting
                        </Button>
                    )}
                    {record.status === 5 && (
                        <div style={{ display: 'flex', gap: '8px' }}>
                            <Button
                                size="small"
                                type="primary"
                                loading={isUpdating}
                                onClick={() => handleStatusChangeClick(record.id, 6, record)}
                                disabled={isUpdating}
                            >
                                Completed
                            </Button>
                            <Button
                                size="small"
                                type="default"
                                danger
                                loading={isUpdating}
                                onClick={() => handleStatusChangeClick(record.id, 7, record)}
                                disabled={isUpdating}
                            >
                                Emergency
                            </Button>
                        </div>
                    )}
                    {record.status === 7 && (
                        <Button
                            size="small"
                            type="primary"
                            danger
                            loading={isUpdating}
                            onClick={() => handleStatusChangeClick(record.id, 4, record)}
                            disabled={isUpdating}
                        >
                            Refunded
                        </Button>
                    )}
                </>
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
                    placeholder="Tìm kiếm bằng child code"
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