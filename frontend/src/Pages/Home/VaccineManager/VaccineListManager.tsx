import React, { useEffect, useState } from 'react'
import { Table, Button, Input, Pagination } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, SearchOutlined } from '@ant-design/icons'

import { useNavigate } from 'react-router-dom'
import { useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI'
import { Vaccines } from '../../../types/vaccine'

interface VaccineResponse {
  data: {
    data: {
      items: Vaccines[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const ManagerVaccineList: React.FC = () => {
  const [pageSize, setPageSize] = useState<number>(12)
  const [pageNumber, setPageNumber] = useState<number>(1)
  const [name, setName] = useState<string>('')
  const [debouncedName, setDebouncedName] = useState(name)
  const navigate = useNavigate()
  const { data: vaccines, isLoading } =
    useGetVaccineListMiniMalQuery<VaccineResponse>({
      pageNumber: pageNumber,
      pageSize: pageSize,
      name: debouncedName,
    })

  // Xử lý debounce với timeout 500ms
  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedName(name)
    }, 500) // Chỉ cập nhật sau 500ms

    return () => clearTimeout(handler) // Xóa timeout khi name thay đổi
  }, [name])

  // Xử lý thay đổi input
  const handleSetName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setName(e.target.value)
  }

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
      render: (price) => (price ? `$${price}` : 'N/A'),
      sorter: (a, b) => (a.price ?? 0) - (b.price ?? 0),
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
    <div style={{ padding: 24 }}>
      <h2>Vaccine List</h2>

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
          value={name}
          onChange={handleSetName}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          onClick={() => navigate('/manager/vaccine/create')}
        >
          Create Vaccine
        </Button>
      </div>
      <Table
        dataSource={vaccines?.data.items}
        columns={columns}
        rowKey='id'
        loading={isLoading}
        pagination={false}
      />
      <Pagination
        current={pageNumber}
        pageSize={pageSize}
        total={vaccines?.data.totalItems}
        pageSizeOptions={['12', '24', '36']}
        showSizeChanger={true}
        style={{ textAlign: 'center' }}
        align='center'
        onChange={(page, size) => {
          setPageNumber(page)
          setPageSize(size)
        }}
        locale={{
          items_per_page: 'vaccines / trang',
        }}
      />
    </div>
  )
}

export default ManagerVaccineList
