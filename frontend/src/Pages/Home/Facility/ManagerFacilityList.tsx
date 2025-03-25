import React, { useEffect, useState } from 'react'
import { Table, Button, Input, Typography, Spin, Pagination } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, SearchOutlined, PlusOutlined } from '@ant-design/icons'
import { useNavigate } from 'react-router-dom'

import { useGetFacilitiesListQuery } from '../../../features/facilities/facilitiesAPI'
import { Facilities } from '../../../types/facilities'

const { Title } = Typography

interface FacilitiesListResponse {
  data: {
    data: any
    items: Facilities[]
    totalItems: number
  }
  isLoading: boolean
  isFetching: boolean
}

const ManagerFacilityList: React.FC = () => {
  const navigate = useNavigate()
  const [searchText, setSearchText] = useState<string>('')
  const [pageNumber, setPageNumber] = useState<number>(1)
  const [pageSize, setPageSize] = useState<number>(10)
  const [debouncedSearchText, setDebouncedSearchText] = useState('')
  
  const { data, isLoading, isFetching } = useGetFacilitiesListQuery<FacilitiesListResponse>({
    pageNumber: pageNumber,
    pageSize: pageSize,
    name: debouncedSearchText,
  })

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedSearchText(searchText)
    }, 500) 

    return () => {
      clearTimeout(handler)
    }
  }, [searchText])

  const columns: ColumnsType<Facilities> = [
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
      sorter: (a, b) => a.name.localeCompare(b.name),
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (_, record) => (
        <Button
          type="primary"
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/facility/${record.id}`)}
        >
          Details
        </Button>
      ),
    },
  ]

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Facility List</Title>

      <div
        style={{
          marginBottom: 16,
          display: 'flex',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Input
          placeholder="Search by facility name"
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          icon={<PlusOutlined />}
          onClick={() => navigate('/manager/facility/create')}
        >
          Create Facility
        </Button>
      </div>

      {isLoading ? (
        <Spin />
      ) : (
        <>
        <Table
            dataSource={data?.data?.items} 
            columns={columns}
            rowKey="id"  
            pagination={false}
            loading={isFetching}
        />
          {!isLoading && (
            <Pagination
              current={pageNumber}
              pageSize={pageSize}
              total={data?.totalItems}
              style={{ textAlign: 'center' }}
              align="center"
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

export default ManagerFacilityList
