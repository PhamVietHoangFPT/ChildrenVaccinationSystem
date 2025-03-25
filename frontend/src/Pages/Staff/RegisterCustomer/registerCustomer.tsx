import React, { useEffect, useState } from 'react'
import { Children } from '../../../types/children'
import { useSearchParams } from 'react-router-dom'
import { useGetChildrenListQuery } from '../../../features/children/childrenAPI'
import { LoadingOutlined } from '@ant-design/icons'
import { Input, Table, Button } from 'antd'
import RegisterCustomerModal from '../../../components/Modal/RegisterCustomerModal'
interface ChildrenListResponse {
  data: {
    data: {
      items: Children[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const RegisterCustomer: React.FC = () => {
  const [searchParams, setSearchParams] = useSearchParams()

  // Pagination and search states
  const initialPage = parseInt(searchParams.get('page') || '1', 10)
  const [modelVisible, setModelVisible] = useState(false)
  const [currentChildren, setCurrentChildren] = useState<Children>()
  const [searchPhoneTerm, setSearchPhoneTerm] = useState('')
  const [searchNameTerm, setSearchNameTerm] = useState('')
  const [currentPage, setCurrentPage] = useState(initialPage)
  const pageSize = 7

  const closeModel = () => {
    setModelVisible(false)
  }

  // Fetch customer list
  const { data: children, isLoading: chilrenLoading } =
    useGetChildrenListQuery<ChildrenListResponse>({
      parentPhoneNumber: searchPhoneTerm || undefined,
      name: searchNameTerm || undefined,
      pageNumber: currentPage,
      pageSize: pageSize,
    })

  const dataChildren = children?.data.items ?? []
  const totalChildren = children?.data.totalItems ?? 0

  // Update URL search params
  useEffect(() => {
    setSearchParams({
      page: currentPage.toString(),
      parentPhoneNumber: searchPhoneTerm,
      name: searchNameTerm,
    })
  }, [currentPage, searchPhoneTerm, searchNameTerm, setSearchParams])

  if (chilrenLoading) {
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
      title: 'Child Name',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Date Of Birth',
      dataIndex: 'dateOfBirth',
      key: 'dateOfBirth',
    },
    {
      title: 'Medical Note',
      dataIndex: 'medicalNote',
      key: 'medicalNote',
    },
    {
      title: 'Gender',
      dataIndex: 'gender',
      key: 'gender',
      render: (gender: boolean) => (gender ? 'Male' : 'Female'),
    },
    {
      title: 'Vaccination',
      key: 'action',
      render: (record: Children) => (
        <Button
          type='primary'
          onClick={() => {
            setModelVisible(true)
            setCurrentChildren(record)
          }}
        >
          Register
        </Button>
      ),
    },
  ]
  if (chilrenLoading) {
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
  return (
    <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
      <div style={{ display: 'flex' }}>
        <Input.Search
          placeholder='Search by phone number'
          allowClear
          onSearch={(value) => setSearchPhoneTerm(value)}
          style={{ marginBottom: 16, width: 300 }}
        />
        <Input.Search
          placeholder='Search by chidren name'
          allowClear
          onSearch={(value) => setSearchNameTerm(value)}
          style={{ marginBottom: 16, width: 300 }}
        />
      </div>
      <Table
        columns={columns}
        dataSource={dataChildren.map((item, index) => ({
          ...item,
          key: item.id,
          index: (currentPage - 1) * pageSize + index + 1,
          children: undefined,
        }))}
        bordered
        pagination={{
          current: currentPage,
          pageSize: pageSize,
          total: totalChildren,
          onChange: (page) => {
            setCurrentPage(page)
          },
        }}
      />
      <RegisterCustomerModal
        onClose={closeModel}
        visible={modelVisible}
        children={currentChildren}
      />
    </div>
  )
}
export default RegisterCustomer
