import React from 'react'
import { Table, Button, Modal, message } from 'antd'
import type { ColumnsType } from 'antd/es/table'
import { EyeOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'

interface Staff {
  id: number
  name: string
  position: string
  email: string
}

const staffData: Staff[] = [
  { id: 1, name: 'Nguyễn Văn A', position: 'Manager', email: 'a@example.com' },
  { id: 2, name: 'Trần Thị B', position: 'Staff', email: 'b@example.com' },
  { id: 3, name: 'Lê Văn C', position: 'Staff', email: 'c@example.com' },
]

const ManagerStaffList: React.FC = () => {
  const handleView = (record: Staff) => {
    Modal.info({
      title: 'Staff Details',
      content: (
        <div>
          <p>
            <strong>ID:</strong> {record.id}
          </p>
          <p>
            <strong>Name:</strong> {record.name}
          </p>
          <p>
            <strong>Position:</strong> {record.position}
          </p>
          <p>
            <strong>Email:</strong> {record.email}
          </p>
        </div>
      ),
    })
  }

  const handleEdit = (record: Staff) => {
    Modal.warning({
      title: 'Edit Staff',
      content: `You clicked to edit ${record.name}. (This is a simulated action)`,
    })
  }

  const handleDelete = (record: Staff) => {
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

  const columns: ColumnsType<Staff> = [
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
      title: 'Position',
      dataIndex: 'position',
      key: 'position',
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
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
      <h2>Staff List</h2>
      <Table dataSource={staffData} columns={columns} rowKey='id' />
    </div>
  )
}

export default ManagerStaffList
