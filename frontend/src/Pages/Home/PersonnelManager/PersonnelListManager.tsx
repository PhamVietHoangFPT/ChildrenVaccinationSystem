import React, { useEffect, useState } from 'react'
import { Table, Button, Input, Typography, Spin } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, SearchOutlined, PlusOutlined } from '@ant-design/icons'
import { useNavigate } from 'react-router-dom'
import { useGetAccountPersonnelMinimalQuery } from '../../../features/account/accountAPI'
import { Personnel } from '../../../types/personnel'

const { Title } = Typography

interface PersonnelListResponse {
  data: {
    data: {
      items: Personnel[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const PersonnelListManager: React.FC = () => {
  const navigate = useNavigate()
  const [searchText, setSearchText] = useState<string>('')
  const pageSize = 7
  const [filteredData, setFilteredData] = useState<Personnel[]>([])
  const [currentPage, setCurrentPage] = useState<number>(1)

  const { data, isLoading, isFetching } =
    useGetAccountPersonnelMinimalQuery<PersonnelListResponse>({
      pageNumber: currentPage,
      pageSize: pageSize,
    })

  useEffect(() => {
    if (data?.data?.items) {
      const filtered = data.data.items.filter((personnel) =>
        personnel.name.toLowerCase().includes(searchText.toLowerCase())
      )
      setFilteredData(filtered)
    }
  }, [data, searchText])

  const totalItems = data?.data?.totalItems || 0

  const columns: ColumnsType<Personnel> = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
      sorter: (a, b) => a.name.localeCompare(b.name),
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
    },

    {
      title: 'Cơ sở',
      dataIndex: ['facility', 'name'],
      key: 'facility',
    },

    {
      title: 'Chức vụ',
      dataIndex: 'role',
      key: 'role',
      render: (role: number) => {
        const roleMap: Record<number, string> = {
          1: 'Nhân viên',
          2: 'Bác sĩ',
          3: 'Người tiêm',
        }
        return roleMap[role] || 'N/A'
      },
    },

    {
      title: 'Số điện thoại',
      dataIndex: 'phoneNumber',
      key: 'phoneNumber',
      render: (phoneNumber) => (phoneNumber ? phoneNumber : 'N/A'),
    },
    {
      title: 'Hành động',
      key: 'actions',
      render: (_, record) => (
        <Button
          type='primary'
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/personnel/${record.id}`)}
        >
          Chi tiết
        </Button>
      ),
    },
  ]

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Quản lý Nhân sự</Title>

      <div
        style={{
          marginBottom: 16,
          display: 'flex',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Input
          placeholder='Tìm kiếm nhân sự theo tên'
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          icon={<PlusOutlined />}
          onClick={() => navigate('/manager/personnel/create')}
        >
          Thêm nhân sự
        </Button>
      </div>

      {isLoading ? (
        <Spin />
      ) : (
        <>
          <Table
            columns={columns}
            dataSource={filteredData.map((item, index) => ({
              ...item,
              key: item.id,
              index: (currentPage - 1) * pageSize + index + 1,
            }))}
            loading={isFetching}
            bordered
            pagination={{
              current: currentPage,
              pageSize: pageSize,
              total: totalItems,
              showSizeChanger: false,
              onChange: (page) => {
                setCurrentPage(page)
              },
            }}
          />
        </>
      )}
    </div>
  )
}

export default PersonnelListManager
