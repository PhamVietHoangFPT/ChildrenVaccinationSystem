import React from 'react'
import { Table, Button, Modal, message } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'

interface Customer {
  id: number
  name: string
  email: string
  phone: string
}

const data: Customer[] = [
  { id: 1, name: 'Nguyễn Văn A', email: 'a@example.com', phone: '0123456789' },
  { id: 2, name: 'Trần Thị B', email: 'b@example.com', phone: '0987654321' },
  { id: 3, name: 'Lê Văn C', email: 'c@example.com', phone: '0123987654' },
]

const CustomerListVaccinator: React.FC = () => {
  const handleView = (record: Customer) => {
    Modal.info({
      title: 'Customer Details',
      content: (
        <div>
          <p>
            <strong>ID:</strong> {record.id}
          </p>
          <p>
            <strong>Name:</strong> {record.name}
          </p>
          <p>
            <strong>Email:</strong> {record.email}
          </p>
          <p>
            <strong>Phone:</strong> {record.phone}
          </p>
        </div>
      ),
    })
  }

  const handleEdit = (record: Customer) => {
    Modal.warning({
      title: 'Edit Customer',
      content: `You clicked to edit ${record.name}. (Simulated action)`,
    })
  }

  const handleDelete = (record: Customer) => {
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

  const columns: ColumnsType<Customer> = [
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
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
    },
    {
      title: 'Phone',
      dataIndex: 'phone',
      key: 'phone',
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
            type='default'
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
      <h2>Customer List</h2>
      <Table dataSource={data} columns={columns} rowKey='id' />
    </div>
  )
}

export default CustomerListVaccinator
