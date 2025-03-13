import React, { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message, Modal, Spin } from 'antd'
import axios from 'axios'

const { Title } = Typography

export interface Vaccine {
  id: string
  name: string
  price: number
  startRecommendedAge?: number
  endRecommendedAge?: number
  dosage?: number
  dosageInterval?: number
  description?: string
  category: {
    name: string
  }
  manufacturer: {
    name: string
  }
}

const VaccineDetail: React.FC = () => {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  const [vaccine, setVaccine] = useState<Vaccine | null>(null)
  const [loading, setLoading] = useState<boolean>(true)
  const [form] = Form.useForm()

  useEffect(() => {
    axios
      .get(
        `https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`
      )
      .then((response) => {
        const data = response.data.data
        setVaccine(data)
        form.setFieldsValue(data)
        setLoading(false)
      })
      .catch((error) => {
        message.error('Error fetching vaccine details: ' + error.message)
        setLoading(false)
      })
  }, [id, form])

  const handleSave = async (values: any) => {
    try {
      await axios.put(
        `https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`,
        values
      )
      message.success('Vaccine updated successfully!')
      navigate('/manager/vaccine')
    } catch (error: any) {
      message.error('Error updating vaccine: ' + error.message)
    }
  }

  const handleDelete = () => {
    Modal.confirm({
      title: 'Are you sure you want to delete this vaccine?',
      content: `This action cannot be undone.`,
      okText: 'Delete',
      okType: 'danger',
      cancelText: 'Cancel',
      onOk: async () => {
        try {
          await axios.delete(
            `https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`
          )
          message.success('Vaccine deleted successfully!')
          navigate('/manager/vaccine')
        } catch (error: any) {
          message.error('Error deleting vaccine: ' + error.message)
        }
      },
    })
  }

  if (loading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size='large' />
      </div>
    )
  }

  if (!vaccine) {
    return <div>No vaccine found.</div>
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Vaccine Details</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
        initialValues={vaccine}
      >
        <Form.Item label='ID' name='id'>
          <Input disabled />
        </Form.Item>

        <Form.Item
          label='Name'
          name='name'
          rules={[{ required: true, message: 'Please enter the vaccine name' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Price'
          name='price'
          rules={[
            { required: true, message: 'Please enter the price' },
            {
              validator: (_, value) => {
                const num = Number(value)
                if (Number.isNaN(num)) {
                  return Promise.reject(
                    new Error('Price must be a valid number')
                  )
                }
                if (num <= 0) {
                  return Promise.reject(
                    new Error('Price must be greater than 0')
                  )
                }
                return Promise.resolve()
              },
            },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item label='Recommended Age' style={{ marginBottom: 0 }}>
          <Form.Item
            name='startRecommendedAge'
            style={{ display: 'inline-block', width: 'calc(50% - 8px)' }}
            rules={[
              {
                required: true,
                message: 'Enter start age',
              },
              {
                validator(_, value) {
                  if (value === undefined || value === null || value === '') {
                    return Promise.reject('Start age is required')
                  }

                  const num = Number(value)
                  if (isNaN(num)) {
                    return Promise.reject('Start age must be a valid number')
                  }

                  if (num < 0 || num > 15) {
                    return Promise.reject('Start age must be between 0 and 15')
                  }

                  return Promise.resolve()
                },
              },
            ]}
          >
            <Input placeholder='Start Age' />
          </Form.Item>
          <span
            style={{
              display: 'inline-block',
              width: '16px',
              textAlign: 'center',
            }}
          >
            -
          </span>
          <Form.Item
            name='endRecommendedAge'
            dependencies={['startRecommendedAge']}
            style={{ display: 'inline-block', width: 'calc(50% - 8px)' }}
            rules={[
              {
                required: true,
                message: 'Enter end age',
              },
              ({ getFieldValue }) => ({
                validator(_, value) {
                  if (value === undefined || value === null || value === '') {
                    return Promise.reject('End age is required')
                  }

                  const endNum = Number(value)
                  const startNum = Number(getFieldValue('startRecommendedAge'))

                  if (isNaN(endNum)) {
                    return Promise.reject('End age must be a valid number')
                  }

                  if (endNum < 1 || endNum > 16) {
                    return Promise.reject('End age must be between 1 and 16')
                  }

                  if (startNum >= endNum) {
                    return Promise.reject(
                      'End age must be greater than start age'
                    )
                  }

                  return Promise.resolve()
                },
              }),
            ]}
          >
            <Input placeholder='End Age' />
          </Form.Item>
        </Form.Item>

        <Form.Item
          label='Dosage'
          name='dosage'
          
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Dosage Interval'
          name='dosageInterval'
          
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Description'
          name='description'
          rules={[{ message: 'Please enter the description' }]}
        >
          <Input.TextArea rows={3} />
        </Form.Item>

        <Form.Item label='Category' name={['category', 'name']}>
          <Input disabled />
        </Form.Item>

        <Form.Item label='Manufacturer' name={['manufacturer', 'name']}>
          <Input disabled />
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Save
            </Button>
            <Button danger onClick={handleDelete}>
              Delete
            </Button>
            <Button onClick={() => navigate('/manager/vaccine')}>Back</Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default VaccineDetail
