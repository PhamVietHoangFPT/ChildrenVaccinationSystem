import { useParams, useNavigate } from 'react-router-dom';
import { Table, Typography, Spin, Tabs, Button } from 'antd';
import { useGetFacilitiesInventoryQuery, useGetFacilitiesBatchesQuery } from '../../../features/facilities/facilitiesAPI';

const { Title } = Typography;
const { TabPane } = Tabs;

interface InventoryData {
  vaccine: {
    id: string;
    name: string;
  };
  totalStock: number;
}

interface BatchData {
  batchNumber: string;
  importDate?: string;
  expireDate?: string;
  vaccines: Array<{
    name: string;
    stock: number;
  }>;
}

const ManagerFacilityInventory: React.FC = () => {
  const { id } = useParams();  
  const navigate = useNavigate();

  const { data: inventoryData, isLoading: inventoryLoading, isFetching: inventoryFetching } = useGetFacilitiesInventoryQuery(id as string);

  const { data: batchData, isLoading: batchLoading, isFetching: batchFetching } = useGetFacilitiesBatchesQuery(id as string);

  if (inventoryLoading || inventoryFetching || batchLoading || batchFetching) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size="large" />
      </div>
    );
  }

  const inventoryColumns = [
    {
      title: 'Vaccine',
      dataIndex: 'vaccine.name',
      key: 'vaccineName',
    },
    {
      title: 'Số lượng tồn',
      dataIndex: 'totalStock',
      key: 'totalStock',
    },
  ];

  const batchColumns = [
    {
      title: 'Batch Number',
      dataIndex: 'batchNumber',
      key: 'batchNumber',
    },
    {
      title: 'Import Date',
      dataIndex: 'importDate',
      key: 'importDate',
      render: (text: string | number | Date) => text ? new Date(text).toLocaleDateString() : '-',
    },
    {
      title: 'Expire Date',
      dataIndex: 'expireDate',
      key: 'expireDate',
      render: (text: string | number | Date) => text ? new Date(text).toLocaleDateString() : '-',
    },
    {
      title: 'Vaccine Name',
      dataIndex: 'vaccine.name',
      key: 'vaccineName',
      render: (_text: any, record: BatchData) => record.vaccines[0]?.name || '-', 
    },
    {
      title: 'Stock',
      dataIndex: 'vaccines.stock',
      key: 'stock',
      render: (_text: any, record: BatchData) => record.vaccines[0]?.stock || '-', 
    },
  ];

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Inventory của Facility</Title>
      
      <Tabs defaultActiveKey="1">
        <TabPane tab="Inventory" key="1">
          <Table
            columns={inventoryColumns}
            dataSource={inventoryData?.data as InventoryData[]}  
            rowKey="vaccine.id"
            pagination={false}
            loading={inventoryFetching}
          />
        </TabPane>

        <TabPane tab="Batch" key="2">
          <div style={{ marginBottom: '16px' }}>
            <Button
              type="primary"
              onClick={() => navigate(`/manager/facility/inventory/import/${id}`)}
            >
              + Create Batch
            </Button>
          </div>
          <Table
            columns={batchColumns}
            dataSource={batchData?.data as BatchData[]} 
            rowKey="batchNumber"
            pagination={false}
            loading={batchFetching}
          />
        </TabPane>
      </Tabs>
    </div>
  );
};

export default ManagerFacilityInventory;