// src/components/Table/vaccine.table.tsx
import React from 'react';
import { Button, Table } from 'antd';
import { Vaccines } from '../../types/vaccine';

interface VaccineTableProps {
  vaccines: Vaccines[];
  loading: boolean;
  totalItems: number;
  selectedVaccines: string[];
  setSelectedVaccines: (vaccines: string[]) => void;
  selectedPackages: any;
  calculateTotalPriceAddSingleVaccine: (items: any[]) => void;
  onPaginationChange: (page: number, pageSize: number) => void;
  pageNumber: number; // Nhận pageNumber từ props
  pageSize: number;   // Nhận pageSize từ props
}

const VaccineTable: React.FC<VaccineTableProps> = ({
  vaccines,
  loading,
  totalItems,
  selectedVaccines,
  setSelectedVaccines,
  selectedPackages,
  calculateTotalPriceAddSingleVaccine,
  onPaginationChange,
  pageNumber,
  pageSize,
}) => {
  const columns = [
    {
      title: 'Tên',
      dataIndex: 'name',
      key: 'name',
      width: 120,
    },
    {
      title: 'Bệnh',
      key: 'category',
      render: (record: any) => record.category.name,
      width: 350,
    },
    {
      title: '',
      key: 'action',
      render: (record: any) => (
        <div style={{ display: 'flex', justifyContent: 'flex-end' }}>
          <Button
            onClick={() => {
              setSelectedVaccines([...selectedVaccines, record]);
              calculateTotalPriceAddSingleVaccine([...selectedVaccines, record]);
            }}
            disabled={selectedVaccines.includes(record) || selectedPackages !== null}
            title={
              selectedVaccines.includes(record)
                ? 'Vaccine đã được chọn'
                : selectedPackages
                  ? 'Không thể chọn vaccine lẻ khi đã chọn gói vaccine'
                  : 'Chọn vaccine'
            }
          >
            Chọn
          </Button>
        </div>
      ),
      width: 100,
    },
  ];

  return (
    <Table
      dataSource={vaccines}
      columns={columns}
      loading={loading}
      style={{ marginBottom: '16px' }}
      tableLayout="fixed"
      pagination={{
        current: pageNumber, // Sử dụng pageNumber từ props
        pageSize: pageSize,  // Sử dụng pageSize từ props
        total: totalItems,
        onChange: onPaginationChange, // Gọi callback khi thay đổi
        locale: {
          items_per_page: 'vaccines / trang',
        },
      }}
    />
  );
};

export default VaccineTable;