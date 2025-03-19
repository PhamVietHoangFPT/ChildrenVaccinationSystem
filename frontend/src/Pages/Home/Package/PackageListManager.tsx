import React, { useEffect, useState } from 'react'
import { Table, Button, Input, Typography, Spin, Pagination } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, SearchOutlined, PlusOutlined } from '@ant-design/icons'
import { useNavigate } from 'react-router-dom'

// Import your API hooks
import { useGetPackageListMiniMalQuery } from '../../../features/package/packageAPI'
import { Packages } from '../../../types/package'

const { Title } = Typography

interface PackagesListResponse {
  data: {
    data: {
      items: Packages[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const ManagerPackageList: React.FC = () => {
  const navigate = useNavigate()
  const [searchText, setSearchText] = useState<string>('')
  const [pageNumber, setPageNumber] = useState<number>(1)
  const [pageSize, setPageSize] = useState<number>(10)
  const [debouncedPackageName, setDebouncedPackageName] = useState('')
  const { data, isLoading, isFetching } =
    useGetPackageListMiniMalQuery<PackagesListResponse>({
      pageNumber: pageNumber,
      pageSize: pageSize,
      name: debouncedPackageName,
    })

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedPackageName(searchText)
    }, 500) // 500ms debounce time

    return () => {
      clearTimeout(handler)
    }
  }, [searchText])

  const columns: ColumnsType<Packages> = [
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
      sorter: (a, b) => a.name.localeCompare(b.name),
    },
    {
      title: 'Price',
      dataIndex: 'price',
      key: 'price',
      render: (price) =>
        price ? `${new Intl.NumberFormat('en-US').format(price)} ` : 'N/A',
      sorter: (a, b) => a.price! - b.price!,
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (_, record) => (
        <Button
          type='primary'
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/package/${record.id}`)}
        >
          Details
        </Button>
      ),
    },
  ]

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Package List</Title>

      <div
        style={{
          marginBottom: 16,
          display: 'flex',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Input
          placeholder='Search by package name'
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          icon={<PlusOutlined />}
          onClick={() => navigate('/manager/package/create')}
        >
          Create Package
        </Button>
      </div>

      {isLoading ? (
        <Spin />
      ) : (
        <>
          <Table
            dataSource={data?.data.items}
            columns={columns}
            rowKey='id'
            pagination={false}
            loading={isFetching}
          />
          {!isLoading && (
            <Pagination
              current={pageNumber}
              pageSize={pageSize}
              total={data?.data.totalItems}
              style={{ textAlign: 'center' }}
              align='center'
              onChange={(page, size) => {
                setPageNumber(page)
                setPageSize(size)
              }}
            />
          )}
        </>
      )}
    </div>
  )
}

export default ManagerPackageList