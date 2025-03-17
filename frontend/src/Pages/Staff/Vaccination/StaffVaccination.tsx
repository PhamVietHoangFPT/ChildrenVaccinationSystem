import React, { useEffect, useState } from 'react'
import { Vaccination } from '../../../types/vaccination'
import { useSearchParams } from 'react-router-dom'
import { useGetVaccinationListQuery } from '../../../features/vaccination/vaccinationAPI'
import { CheckCircleOutlined, ClockCircleOutlined, EditOutlined, ExclamationCircleOutlined, LoadingOutlined, MinusCircleOutlined, SyncOutlined } from '@ant-design/icons'
import { Button, Table, Tag } from 'antd'
interface VaccinationListResponse {
    data: {
        data: {
            items: Vaccination[]
            totalItems: number
        }
    }
    isLoading: boolean
    isFetching: boolean
}

const StaffVaccination: React.FC = () => {
    const [searchParams, setSearchParams] = useSearchParams()

    // Pagination and search states
    const initialPage = parseInt(searchParams.get('page') || '1', 10)
    const [currentPage, setCurrentPage] = useState(initialPage)
    const pageSize = 7

    // Fetch vaccination list
    const {
        data: vaccinations,
        isFetching: vaccinationFetching,
        isLoading: vaccinationLoading,
    } = useGetVaccinationListQuery<VaccinationListResponse>({
        pageNumber: currentPage,
        pageSize: pageSize,
    })

    const dateVaccinations = vaccinations?.data.items ?? []
    const totalVaccinations = vaccinations?.data.totalItems ?? 0


    // Update URL search params
    useEffect(() => {
        setSearchParams({
            page: currentPage.toString(),
        })
    }, [currentPage, setSearchParams])

    // Loading state for the table
    if (vaccinationLoading) {
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

    const columns = [
        {
            title: 'No.',
            dataIndex: 'index',
            key: 'index',
            render: (_: any, __: any, index: number) =>
                (currentPage - 1) * pageSize + index + 1,
        },
        {
            title: 'Child Name',
            dataIndex: 'child.name',
            key: 'name',
            render: (_: string | undefined, record: Vaccination) =>
                record.child?.name ?? 'N/A', // Fallback for undefined child
        },
        {
            title: 'Schedule',
            dataIndex: 'schedule',
            key: 'schedule',
        },
        {
            title: 'Vaccine Name',
            dataIndex: 'vaccines.name',
            key: 'name',
            render: (_: string | undefined, record: Vaccination) =>
                record.vaccine?.name ?? 'N/A', // Fallback for undefined vaccines
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
            dataIndex: 'gender',
            key: 'gender',
            render: (gender: boolean) => (gender ? 'Male' : 'Female'),
        },
        {
            title: 'Update',
            key: 'update',
            render: (_: any) => (
                <Button
                    type='primary'
                    icon={<EditOutlined />}
                />
            ),
        },
    ]
    console.log(dateVaccinations)
    return (
        <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
            <Table
                columns={columns}
                dataSource={dateVaccinations.map((item, index) => ({
                    ...item,
                    key: item.id,
                    index: (currentPage - 1) * pageSize + index + 1,
                    children: undefined,
                }))}
                loading={vaccinationFetching}
                bordered
                pagination={{
                    current: currentPage,
                    pageSize: pageSize,
                    total: totalVaccinations,
                    pageSizeOptions: ['1', '5', '10', '20'],
                    onChange: (page) => {
                        setCurrentPage(page)
                    },
                }}
            />
        </div>
    )
}
export default StaffVaccination;