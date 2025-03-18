import React, { useEffect, useState } from 'react'
import { Table, Button, Input, Typography, Spin, Pagination } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, SearchOutlined, PlusOutlined } from '@ant-design/icons'
import { useNavigate } from 'react-router-dom'

// Import your API hooks
import { useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI'
import { Vaccines } from '../../../types/vaccine'

const { Title } = Typography

interface VaccinesListResponse {
  data: {
    data: {
      items: Vaccines[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const ManagerBlogList: React.FC = () => {
  const navigate = useNavigate()
  const [searchText, setSearchText] = useState<string>('')
  const [pageNumber, setPageNumber] = useState<number>(1)
  const [pageSize, setPageSize] = useState<number>(10)
  const [debouncedVaccineName, setDebouncedVaccineName] = useState('')
  const { data, isLoading, isFetching } =
    useGetVaccineListMiniMalQuery<VaccinesListResponse>({
      pageNumber: pageNumber,
      pageSize: pageSize,
      name: debouncedVaccineName,
    })

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedVaccineName(searchText)
    }, 500) // 500ms debounce time

    return () => {
      clearTimeout(handler)
    }
  }, [searchText])

  const columns: ColumnsType<Vaccines> = [
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
      sorter: (a, b) => a.name.localeCompare(b.name),
    },
    {
      title: 'Category',
      dataIndex: ['category', 'name'],
      key: 'category',
    },
    {
      title: 'Manufacturer',
      dataIndex: ['manufacturer', 'name'],
      key: 'manufacturer',
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
      title: 'Recommended Age',
      key: 'recommendedAge',
      render: (_, record) =>
        `${record.startRecommendedAge} - ${record.endRecommendedAge} years`,
    },
    {
      title: 'Dosage',
      dataIndex: 'dosage',
      key: 'dosage',
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (_, record) => (
        <Button
          type='primary'
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/vaccine/${record.id}`)}
        >
          Details
        </Button>
      ),
    },
  ]

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Vaccine List</Title>

      <div
        style={{
          marginBottom: 16,
          display: 'flex',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Input
          placeholder='Search by vaccine name'
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          icon={<PlusOutlined />}
          onClick={() => navigate('/manager/vaccine/create')}
        >
          Create Vaccine
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

export default ManagerBlogList
