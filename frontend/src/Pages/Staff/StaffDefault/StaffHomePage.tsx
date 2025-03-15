import React, { useEffect, useState } from 'react'
import { useSearchParams, useNavigate } from 'react-router-dom'
import { Customer } from '../../../types/customer'
import { useGetCustomerListQuery } from '../../../features/customer/customerAPI'
import { Button, Input, Table } from 'antd'
import { EditOutlined, LoadingOutlined } from '@ant-design/icons'

interface CustomerListResponse {
  data: {
    data: {
      items: Customer[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const StaffHomePage: React.FC = () => {
  const [searchParams, setSearchParams] = useSearchParams()
  const [searchTerm, setSearchTerm] = useState<string | undefined>(undefined)
  const navigate = useNavigate()

  // Default page = 1, pageSize = 7
  const initialPage = parseInt(searchParams.get('page') || '1', 10)
  const [currentPage, setCurrentPage] = useState(initialPage)
  const pageSize = 7

  const {
    data: customers,
    isFetching: customerFetching,
    isLoading: customerLoading,
  } = useGetCustomerListQuery<CustomerListResponse>({
    phoneNumber: searchTerm || undefined,
    pageNumber: currentPage,
    pageSize: pageSize,
  })

  const dataCustomer = customers?.data.items ?? []
  const totalCustomers = customers?.data?.totalItems ?? 0

  useEffect(() => {
    setSearchParams({
      page: currentPage.toString(),
    })
  }, [currentPage, setSearchParams])

  if (customerLoading) {
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
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Phone Number',
      dataIndex: 'phoneNumber',
      key: 'phoneNumber',
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
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
      render: (_: any, record: any) => (
        <Button
          type='primary'
          icon={<EditOutlined />}
          onClick={() => navigate(`${record.id}`)}
        />
      ),
    },
  ]
  return (
    <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
      <Input.Search
        placeholder='Search by phone number'
        allowClear
        onSearch={(value) => setSearchTerm(value)}
        style={{ marginBottom: 16, width: 300 }}
      />
      <Table
        columns={columns}
        dataSource={dataCustomer.map((item, index) => ({
          ...item,
          key: item.id,
          index: (currentPage - 1) * pageSize + index + 1,
          children: undefined,
        }))}
        loading={customerFetching}
        bordered
        pagination={{
          current: currentPage,
          pageSize: pageSize,
          total: totalCustomers,
          pageSizeOptions: ['1', '5', '10', '20'],

          onChange: (page) => {
            setCurrentPage(page)
          },
        }}
      />
    </div>
  )
}

export default StaffHomePage
