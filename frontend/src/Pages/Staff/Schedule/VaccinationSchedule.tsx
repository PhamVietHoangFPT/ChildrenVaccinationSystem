import React, { useEffect, useState } from 'react'
import { Children } from '../../../types/children';
import { Vaccination } from '../../../types/vaccination';
import { useSearchParams } from 'react-router-dom';
import { useGetVaccinationListQuery, usePaymentVaccinationMutation } from '../../../features/vaccinations/vaccinationAPI';
import dayjs, { Dayjs } from 'dayjs';
import { useGetChildrenListQuery } from '../../../features/children/childrenAPI';
import { AutoComplete, Button, message, Table, Tag } from 'antd';
import {
    LoadingOutlined,
} from '@ant-design/icons';
import ScheduleFilter from '../../../components/VaccinationFilter/ScheduleFilter';
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
const VaccinationSchedule: React.FC = () => {
    const [searchParams, setSearchParams] = useSearchParams();
    const [selectedVaccines, setSelectedVaccines] = useState<string[]>([]);// State để lưu các hàng được chọn
    // Pagination and search states from URL
    const initialPage = parseInt(searchParams.get('page') || '1', 10);
    const initialScheduleFrom = searchParams.get('scheduleFrom') || undefined;
    const initialScheduleTo = searchParams.get('scheduleTo') || undefined;
    const initialChildCode = searchParams.get('childCode') || undefined;

    const [currentPage, setCurrentPage] = useState(initialPage);
    const [scheduleFrom, setScheduleFrom] = useState<string | undefined>(initialScheduleFrom);
    const [scheduleTo, setScheduleTo] = useState<string | undefined>(initialScheduleTo);
    const [childCode, setChildCode] = useState<string | undefined>(initialChildCode);
    const [searchValue, setSearchValue] = useState<string>(initialChildCode || ''); // For AutoComplete input
    const pageSize = 7;

    // Fetch vaccination list with dynamic filters including childCode
    const {
        data: vaccinations,
        isFetching: vaccinationFetching,
        isLoading: vaccinationLoading,
    } = useGetVaccinationListQuery<VaccinationListResponse>({
        status: 0,
        pageNumber: currentPage,
        pageSize: pageSize,
        scheduleFrom,
        scheduleTo,
        childCode,
    });

    const dataVaccinations = vaccinations?.data.items ?? [];
    const totalVaccinations = vaccinations?.data.totalItems ?? 0;
    const [payment] = usePaymentVaccinationMutation()
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
        if (childCode) params.childCode = childCode;

        setSearchParams(params);
    }, [currentPage, scheduleFrom, scheduleTo, childCode, setSearchParams]);

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
            title: 'Schedule',
            dataIndex: 'schedule',
            key: 'schedule',
            render: (schedule: Date | undefined) =>
                <span style={{ fontSize: '12px' }}>{schedule ? dayjs(schedule).format('YYYY-MM-DD') : 'N/A'}</span>,
        },
        {
            title: 'Price',
            dataIndex: 'price',
            key: 'price',
        },
        {
            title: 'Status',
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
                    default:
                        return <Tag color="gray" style={tagStyle}>Unknown</Tag>;
                }
            },
        },
    ];
    // Handle row selection
    const onSelectChange = (newSelectedRowKeys: React.Key[]) => {
        // Chuyển đổi React.Key[] thành string[]
        const selectedKeys = newSelectedRowKeys.map((key) => key.toString());
        setSelectedVaccines(selectedKeys);
    };

    // Row selection configuration
    const rowSelection = {
        selectedRowKeys: selectedVaccines, // Sử dụng selectedVaccines kiểu string[]
        onChange: onSelectChange,
        type: 'checkbox' as const,
    };

    // Handle Pay button click
    const handlePay = async () => {
        const selectedVaccinations = dataVaccinations.filter((item) =>
            selectedVaccines.includes(item.id)
        );
        const inputValues = selectedVaccinations.map((v) => v.id)
        try {
            const res = (await payment({ data: inputValues }).unwrap()) as {
                message: string
                data: string
            }
            message.success(res.message)
            window.open(res.data, '_blank')
        } catch (error: any) {
            console.log(error)
            message.error(error.data.message)
        }
    };
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
            <ScheduleFilter
                scheduleFrom={scheduleFrom}
                scheduleTo={scheduleTo}
                onScheduleFromChange={handleScheduleFromChange}
                onScheduleToChange={handleScheduleToChange}
            />
            <div style={{ marginBottom: 16 }}>
                {selectedVaccines.length > 0 && (
                    <Button type="primary" onClick={handlePay}>
                        Pay
                    </Button>
                )}
            </div>
            <Table
                columns={columns}
                rowSelection={rowSelection}
                dataSource={dataVaccinations.map((item) => ({
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
        </div>
    )
}
export default VaccinationSchedule;
