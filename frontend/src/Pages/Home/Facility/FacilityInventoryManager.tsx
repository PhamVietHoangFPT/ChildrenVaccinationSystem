import { useParams, useNavigate } from 'react-router-dom'
import { Table, Typography, Spin, Tabs, Button, Tag } from 'antd'
import {
  useGetFacilitiesInventoryQuery,
  useGetFacilitiesBatchesQuery,
} from '../../../features/facilities/facilitiesAPI'

const { Title } = Typography
const { TabPane } = Tabs

interface InventoryData {
  data: {
    data: {
      vaccine: {
        id: string
        name: string
      }
    }
  }
  isLoading: boolean
  isFetching: boolean
  totalStock: number
}

interface BatchData {
  data: {
    data: {
      batchNumber: string
      importDate?: string
      expireDate?: string
      vaccines: Array<{
        name: string
        stock: number
      }>
    }
  }
  isLoading: boolean
  isFetching: boolean
}

const ManagerFacilityInventory: React.FC = () => {
  const { id } = useParams()
  const navigate = useNavigate()

  const {
    data: inventoryData,
    isLoading: inventoryLoading,
    isFetching: inventoryFetching,
  } = useGetFacilitiesInventoryQuery<InventoryData>(id as string)

  const {
    data: batchData,
    isLoading: batchLoading,
    isFetching: batchFetching,
  } = useGetFacilitiesBatchesQuery<BatchData>(id as string)

  if (inventoryLoading || inventoryFetching || batchLoading || batchFetching) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size='large' />
      </div>
    )
  }

  const inventoryColumns = [
    {
      title: 'Vaccine',
      dataIndex: 'vaccine.name',
      key: 'vaccineName',
      render: (_text: any, record: any) => record.vaccine.name,
    },
    {
      title: 'Số lượng tồn',
      dataIndex: 'totalStock',
      key: 'totalStock',
    },
  ]

  const batchColumns = [
    {
      title: 'Số lô',
      dataIndex: 'batchNumber',
      key: 'batchNumber',
    },
    {
      title: 'Ngày nhập',
      dataIndex: 'importDate',
      key: 'importDate',
      render: (_text: any, record: any) =>
        record
          ? new Date(record.importedDate).toLocaleDateString('vi-VN')
          : '-',
    },
    {
      title: 'Ngày hết hạn',
      dataIndex: 'expireDate',
      key: 'expireDate',
      render: (_text: any, record: any) =>
        record ? new Date(record.expiryDate).toLocaleDateString('vi-VN') : '-',
    },
    {
      title: 'Vaccine & Số lượng',
      dataIndex: 'vaccines',
      key: 'vaccineStock',
      render: (vaccines: any[]) => (
        <Table
          columns={[
            {
              title: 'Vaccine',
              dataIndex: 'name',
              key: 'name',
              width: '50%',
              render: (name: string) => <Tag>{name}</Tag>,
            },
            {
              title: 'Số lượng',
              dataIndex: 'stock',
              key: 'stock',
              align: 'center',
              width: '50%',
              render: (stock: number) => <div>Số lượng: {stock}</div>,
            },
          ]}
          dataSource={vaccines}
          pagination={false}
          showHeader={false}
          size='small'
          rowKey='name'
        />
      ),
    },
  ]

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Inventory của Facility</Title>

      <Tabs defaultActiveKey='1'>
        <TabPane tab='Inventory' key='1'>
          <Table
            columns={inventoryColumns}
            dataSource={
              Array.isArray(inventoryData?.data) ? inventoryData?.data : []
            }
            rowKey='vaccine.id'
            pagination={false}
            loading={inventoryFetching}
          />
        </TabPane>

        <TabPane tab='Batch' key='2'>
          <div style={{ marginBottom: '16px' }}>
            <Button
              type='primary'
              onClick={() =>
                navigate(`/manager/facility/inventory/import/${id}`)
              }
            >
              + Create Batch
            </Button>
          </div>
          <Table
            columns={batchColumns}
            dataSource={Array.isArray(batchData?.data) ? batchData?.data : []}
            rowKey='batchNumber'
            pagination={false}
            loading={batchFetching}
          />
        </TabPane>
      </Tabs>
    </div>
  )
}

export default ManagerFacilityInventory
