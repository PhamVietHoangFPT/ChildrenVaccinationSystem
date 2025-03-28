import React, { useEffect, useState } from 'react'
import { Vaccination } from '../../types/vaccination'
import { useSearchParams } from 'react-router-dom'
import {
  useGetVaccinationListVaccinatorQuery,
  useUpdateVaccinationStatusMutation,
} from '../../features/vaccinations/vaccinationAPI'
import {
  CheckCircleOutlined,
  CheckOutlined,
  ClockCircleOutlined,
  ExclamationCircleOutlined,
  LoadingOutlined,
  MinusCircleOutlined,
  SyncOutlined,
} from '@ant-design/icons'
import dayjs from 'dayjs'
import { Button, message, Table, Tag } from 'antd'

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

const VaccinatorHomePage: React.FC = () => {
  const [searchParams, setSearchParams] = useSearchParams()

  const initialPage = parseInt(searchParams.get('page') || '1', 10)
  const [currentPage, setCurrentPage] = useState(initialPage)
  const pageSize = 7

  const {
    data: vaccinations,
    isFetching: vaccinationFetching,
    isLoading: vaccinationLoading,
  } = useGetVaccinationListVaccinatorQuery<VaccinationListResponse>({
    pageNumber: currentPage,
    pageSize: pageSize,
  })

  const dataVaccinations = vaccinations?.data.items ?? []
  const totalVaccinations = vaccinations?.data.totalItems ?? 0
  const [updateVaccinationStatus, { isLoading: isUpdating }] =
    useUpdateVaccinationStatusMutation()
  // Update URL search params for pagination, date filters, status, and childCode
  useEffect(() => {
    const params: { [key: string]: string } = {
      page: currentPage.toString(),
    }
    setSearchParams(params)
  }, [currentPage, setSearchParams])

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
    )
  }
  const handleStatusChangeClick = async (id: string, newStatus: number) => {
    try {
      await updateVaccinationStatus({ id, status: newStatus }).unwrap()
      message.success('Status updated successfully')
    } catch (error) {
      console.error('Failed to update status:', error)
      message.error('Failed to update status')
    }
  }

  const columns = [
    {
      title: 'No.',
      key: 'index',
      render: (_: any, __: Vaccination, index: number) =>
        (currentPage - 1) * pageSize + index + 1,
    },
    {
      title: 'Tên trẻ em',
      dataIndex: 'child.name',
      key: 'childName',
      render: (_: string | undefined, record: Vaccination) => (
        <span>{record.child?.name ?? 'N/A'}</span>
      ),
    },
    {
      title: 'Tên vaccine',
      dataIndex: 'vaccine.name',
      key: 'vaccineName',
      render: (_: string | undefined, record: Vaccination) => (
        <span>{record.vaccine?.name ?? 'N/A'}</span>
      ),
    },
    {
      title: 'Lịch tiêm',
      dataIndex: 'schedule',
      key: 'schedule',
      render: (schedule: Date | undefined) => (
        <span>{schedule ? dayjs(schedule).format('YYYY-MM-DD') : 'N/A'}</span>
      ),
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
        }

        switch (status) {
          case 0:
            return (
              <Tag color='geekblue' style={tagStyle}>
                Pending
              </Tag>
            )
          case 1:
            return (
              <Tag color='processing' style={tagStyle}>
                Paid
              </Tag>
            )
          case 2:
            return (
              <Tag color='purple' style={tagStyle}>
                Consulting
              </Tag>
            )
          case 3:
            return (
              <Tag color='blue' icon={<SyncOutlined spin />} style={tagStyle}>
                Queued
              </Tag>
            )
          case 4:
            return (
              <Tag
                color='magenta'
                icon={<ExclamationCircleOutlined />}
                style={tagStyle}
              >
                Injecting
              </Tag>
            )
          case 5:
            return (
              <Tag
                color='orange'
                icon={<ExclamationCircleOutlined />}
                style={tagStyle}
              >
                Monitoring
              </Tag>
            )
          case 6:
            return (
              <Tag
                color='success'
                icon={<CheckCircleOutlined />}
                style={tagStyle}
              >
                Completed
              </Tag>
            )
          case 7:
            return (
              <Tag
                color='error'
                icon={<ClockCircleOutlined />}
                style={tagStyle}
              >
                Emergency
              </Tag>
            )
          case 8:
            return (
              <Tag color='red' icon={<MinusCircleOutlined />} style={tagStyle}>
                Canceled
              </Tag>
            )
          case 9:
            return (
              <Tag color='red' style={tagStyle}>
                Refunded
              </Tag>
            )
          default:
            return (
              <Tag color='gray' style={tagStyle}>
                Unknown
              </Tag>
            )
        }
      },
    },
    {
      title: 'Xác nhận đã tiêm',
      key: 'changeStatus',
      render: (_: any, record: Vaccination) => (
        <div style={{ display: 'flex', justifyContent: 'center' }}>
          <Button
            type='primary'
            loading={isUpdating}
            onClick={() => handleStatusChangeClick(record.id, 5)}
            disabled={isUpdating}
          >
            <CheckOutlined />
          </Button>
        </div>
      ),
    },
  ]

  return (
    <>
      <Table
        columns={columns}
        dataSource={dataVaccinations.map((item) => ({
          ...item,
          key: item.id,
        }))}
        loading={vaccinationFetching}
        bordered
        pagination={{
          current: currentPage,
          pageSize: pageSize,
          total: totalVaccinations,
          onChange: (page) => {
            setCurrentPage(page)
          },
        }}
      />
    </>
  )
}

export default VaccinatorHomePage
