import React from 'react'
import { Table, Button, Modal, message } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'

export interface Vaccine {
  id: number
  name: string
  imageUrl?: string
  description?: string
  price?: number
  startRecommendAge?: number
  endRecommendAge?: number
  sequence?: number
  dosage?: string
  dosageInterval?: number
}

const vaccineData: Vaccine[] = [
  {
    id: 1,
    name: 'Vaccine A',
    price: 100,
    startRecommendAge: 1,
    endRecommendAge: 5,
    sequence: 1,
    dosage: '0.5ml',
    dosageInterval: 30,
    description: 'Protects against virus A',
  },
  {
    id: 2,
    name: 'Vaccine B',
    price: 150,
    startRecommendAge: 2,
    endRecommendAge: 6,
    sequence: 2,
    dosage: '1ml',
    dosageInterval: 60,
    description: 'Prevents disease B',
  },
  {
    id: 3,
    name: 'Vaccine C',
    price: 120,
    startRecommendAge: 0,
    endRecommendAge: 3,
    sequence: 3,
    dosage: '0.25ml',
    dosageInterval: 15,
    description: 'Effective against infection C',
  },
]

const ManagerVaccineList: React.FC = () => {
  const handleView = (record: Vaccine) => {
    Modal.info({
      title: 'Vaccine Details',
      content: (
        <div>
          <p>
            <strong>ID:</strong> {record.id}
          </p>
          <p>
            <strong>Name:</strong> {record.name}
          </p>
          {record.price && (
            <p>
              <strong>Price:</strong> ${record.price}
            </p>
          )}
          {record.startRecommendAge !== undefined &&
            record.endRecommendAge !== undefined && (
              <p>
                <strong>Recommended Age:</strong> {record.startRecommendAge} -{' '}
                {record.endRecommendAge} years
              </p>
            )}
          {record.dosage && (
            <p>
              <strong>Dosage:</strong> {record.dosage}
            </p>
          )}
          {record.dosageInterval && (
            <p>
              <strong>Dosage Interval:</strong> {record.dosageInterval} days
            </p>
          )}
          {record.description && (
            <p>
              <strong>Description:</strong> {record.description}
            </p>
          )}
        </div>
      ),
    })
  }

  const handleEdit = (record: Vaccine) => {
    Modal.warning({
      title: 'Edit Vaccine',
      content: `You clicked to edit ${record.name}. (Simulated action)`,
    })
  }

  const handleDelete = (record: Vaccine) => {
    Modal.confirm({
      title: 'Are you sure?',
      content: `Do you really want to delete ${record.name}?`,
      okText: 'Delete',
      okType: 'danger',
      cancelText: 'Cancel',
      onOk() {
        message.success(`${record.name} has been deleted.`)
      },
    })
  }

  const columns: ColumnsType<Vaccine> = [
    {
      title: 'ID',
      dataIndex: 'id',
      key: 'id',
    },
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Price',
      dataIndex: 'price',
      key: 'price',
      render: (price) => (price ? `$${price}` : 'N/A'),
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
        <>
          <Button
            type='primary'
            icon={<EyeOutlined />}
            onClick={() => handleView(record)}
            style={{ marginRight: 8 }}
          >
            View
          </Button>
          <Button
            icon={<EditOutlined />}
            onClick={() => handleEdit(record)}
            style={{ marginRight: 8 }}
          >
            Edit
          </Button>
          <Button
            type='primary'
            danger
            icon={<DeleteOutlined />}
            onClick={() => handleDelete(record)}
          >
            Delete
          </Button>
        </>
      ),
    },
  ]

  return (
    <div style={{ padding: 24 }}>
      <h2>Vaccine List</h2>
      <Table dataSource={vaccineData} columns={columns} rowKey='id' />
    </div>
  )
}

export default ManagerVaccineList
