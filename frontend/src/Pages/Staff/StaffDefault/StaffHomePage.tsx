import React, { useEffect, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { Customer } from '../../../types/customer'
import { useGetCustomerListQuery } from '../../../features/customer/customerAPI'
import { Button, Input, Table } from 'antd'
import { EditOutlined, LoadingOutlined } from '@ant-design/icons'
import CustomerDetailModal from '../../../components/Modal/CustomerDetail'

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

  // Pagination and search states
  const initialPage = parseInt(searchParams.get('page') || '1', 10)
  const [searchTerm, setSearchTerm] = useState('')
  const [currentPage, setCurrentPage] = useState(initialPage)
  const pageSize = 7

  // Modal state
  const [isModalVisible, setIsModalVisible] = useState(false)
  const [selectedCustomerId, setSelectedCustomerId] = useState<string | null>(
    null
  )

  // Fetch customer list
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
  const totalCustomers = customers?.data.totalItems ?? 0

  // Update URL search params
  useEffect(() => {
    setSearchParams({
      page: currentPage.toString(),
      phoneNumber: searchTerm,
    })
  }, [currentPage, searchTerm, setSearchParams])

  // Loading state for the table

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

  // Table columns
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
      render: (_: any, record: Customer) => (
        <Button
          type='primary'
          icon={<EditOutlined />}
          onClick={() => {
            setSelectedCustomerId(record.id) // Set the selected customer ID
            setIsModalVisible(true) // Show the modal
          }}
        />
      ),
    },
  ]

  // Handle modal close
  const handleModalClose = () => {
    setIsModalVisible(false)
    setSelectedCustomerId(null) // Reset selected customer
  }

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
      <CustomerDetailModal
        visible={isModalVisible}
        customerId={selectedCustomerId}
        onClose={handleModalClose}
      />
    </div>
  )
}

export default StaffHomePage
