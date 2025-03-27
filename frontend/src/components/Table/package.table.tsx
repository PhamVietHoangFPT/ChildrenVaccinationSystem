// src/components/PackageTable.tsx
import React, { useState } from 'react'
import { Button, Table } from 'antd'
import { Packages } from '../../types/package' // Đảm bảo đường dẫn đúng

interface PackageTableProps {
  packages: Packages[]
  loading: boolean
  totalItems: number
  selectedPackages: Packages | null
  setSelectedPackages: (pkg: Packages | null) => void
  setPaymentChoice: (choice: '1' | '2' | '3' | null) => void
  selectedVaccines: string[]
  onPaginationChange: (page: number, pageSize: number) => void
}

const PackageTable: React.FC<PackageTableProps> = ({
  packages,
  loading,
  totalItems,
  selectedPackages,
  setSelectedPackages,
  setPaymentChoice,
  selectedVaccines,
  onPaginationChange,
}) => {
  const [pageNumber, setPageNumber] = useState(1)
  const [pageSize, setPageSize] = useState(3)

  const columns = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
      width: 120,
    },
    {
      title: 'Giá',
      key: 'price',
      render: (record: any) =>
        record.price.toLocaleString().toUpperCase() + ' VND',
      width: 120,
      sorter: (a: any, b: any) => a.price - b.price,
    },
    {
      title: '',
      key: 'action',
      render: (record: any) => (
        <div style={{ display: 'flex', justifyContent: 'flex-end' }}>
          <Button
            onClick={() => {
              setPaymentChoice('3')
              setSelectedPackages(record)
            }}
            disabled={selectedPackages !== null || selectedVaccines.length > 0}
            title={
              selectedPackages
                ? 'Gói vaccine đã được chọn'
                : selectedVaccines.length > 0
                  ? 'Không thể chọn gói vaccine khi đã chọn vaccine lẻ'
                  : 'Chọn gói vaccine'
            }
          >
            Chọn
          </Button>
        </div>
      ),
      width: 100,
    },
  ]

  return (
    <Table
      dataSource={packages}
      columns={columns}
      loading={loading}
      style={{ marginBottom: '16px' }}
      tableLayout='fixed'
      pagination={{
        current: pageNumber,
        pageSize: pageSize,
        total: totalItems,
        onChange: (page, size) => {
          setPageNumber(page)
          setPageSize(size)
          onPaginationChange(page, size) // Thông báo thay đổi phân trang
        },
      }}
    />
  )
}

export default PackageTable
