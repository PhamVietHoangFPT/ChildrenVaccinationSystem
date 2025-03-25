import { useParams } from 'react-router-dom';
import { Table, Typography, Spin } from 'antd';
import { useGetFacilitiesInventoryQuery } from '../../../features/facilities/facilitiesAPI'; 

const { Title } = Typography;

const ManagerFacilityInventory: React.FC = () => {
  const { id } = useParams();  // Lấy id từ URL

  const { data, isLoading, isFetching } = useGetFacilitiesInventoryQuery({
    id: id as string,  // Truyền đúng id vào API
  }) as { 
    data?: { 
      data?: Array<{
        vaccine: { id: string, name: string },
        totalStock: number
      }>, 
      items?: any[] 
    }, 
    isLoading: boolean, 
    isFetching: boolean 
  };

  if (isLoading || isFetching) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size="large" />
      </div>
    );
  }

  const columns = [
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

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Inventory của Facility</Title>
      <Table
        columns={columns}
        dataSource={data?.data}  // Đảm bảo truyền đúng dữ liệu vào
        rowKey="vaccine.id"
        pagination={false}
        loading={isFetching}
      />
    </div>
  );
};

export default ManagerFacilityInventory;
