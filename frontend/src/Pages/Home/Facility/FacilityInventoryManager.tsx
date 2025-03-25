import { useParams } from 'react-router-dom';
import { Table, Typography, Spin, Tabs } from 'antd';
import { useGetFacilitiesInventoryQuery, useGetFacilitiesBatchesQuery } from '../../../features/facilities/facilitiesAPI';

const { Title } = Typography;
const { TabPane } = Tabs;

const ManagerFacilityInventory: React.FC = () => {
  const { id } = useParams();  

  // Fetching Inventory Data
  const { data: inventoryData, isLoading: inventoryLoading, isFetching: inventoryFetching } = useGetFacilitiesInventoryQuery(id as string);

  // Fetching Batch Data
  const { data: batchData, isLoading: batchLoading, isFetching: batchFetching } = useGetFacilitiesBatchesQuery(id as string);

  // Loading State
  if (inventoryLoading || inventoryFetching || batchLoading || batchFetching) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size="large" />
      </div>
    );
  }

  // Inventory Columns
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

  // Batch Columns with Date Formatting
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
      render: (text) => text ? new Date(text).toLocaleDateString() : '-',
    },
    {
      title: 'Expire Date',
      dataIndex: 'expireDate',
      key: 'expireDate',
      render: (text) => text ? new Date(text).toLocaleDateString() : '-',
    },
    {
      title: 'Vaccine Name',
      dataIndex: 'vaccine.name',
      key: 'vaccineName',
      render: (text, record) => record.vaccines[0]?.name || '-', // Access vaccine name from the vaccines array
    },
    {
      title: 'Stock',
      dataIndex: 'vaccines.stock',
      key: 'stock',
      render: (text, record) => record.vaccines[0]?.stock || '-', // Access stock from the vaccines array
    },
  ];

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Inventory của Facility</Title>
      
      <Tabs defaultActiveKey="1">
        <TabPane tab="Inventory" key="1">
          <Table
            columns={inventoryColumns}
            dataSource={inventoryData?.data}  // Ensure `data` exists
            rowKey="vaccine.id"
            pagination={false}
            loading={inventoryFetching}
          />
        </TabPane>

        <TabPane tab="Batch" key="2">
          <Table
            columns={batchColumns}
            dataSource={batchData?.data}  // Ensure `data` exists
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
