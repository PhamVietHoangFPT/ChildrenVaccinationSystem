import { useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message, Select } from 'antd'
const { Option } = Select
import { useCreateVaccineMutation } from '../../../features/vaccine/vaccineAPI'

import { useGetManufacturesListQuery } from '../../../features/manufactures/manufacturesAPI'
import { useGetCategoriesListQuery } from '../../../features/categories/categoriesAPI'

import { Vaccines } from '../../../types/vaccine'
import { Manufacturers } from '../../../types/manufacturer'
import { Category } from '../../../types/category'

const { Title } = Typography

interface VaccineResponse {
  data: Vaccines
  isLoading: boolean
  isFetching: boolean
}

interface ManufacturesListResponse {
  data: {
    data: {
      items: Manufacturers[]
    }
  }
}

interface CategoriesListResponse {
  data: {
    data: {
      items: Category[]
    }
  }
}

const VaccineDetail: React.FC = () => {
  const navigate = useNavigate()
  const [createVaccine] = useCreateVaccineMutation<VaccineResponse>()

  const { data: manufacturers } =
    useGetManufacturesListQuery<ManufacturesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })
  const { data: categories } =
    useGetCategoriesListQuery<CategoriesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      const value = { ...values, price: Number(values.price) }
      const data = (await createVaccine({
        data: value,
      }).unwrap()) as {
        message: string
      }
      message.success(data.message)
      // navigate('/manager/vaccine')
    } catch (error: any) {
      message.error('Error create vaccine: ' + error.message)
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Vaccine Details</Title>
      <Form form={form} layout='vertical' onFinish={handleSave}>
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
        <Form.Item label='Dosage' name='dosage'>
          <Input />
        </Form.Item>
        <Form.Item label='Dosage Interval' name='dosageInterval'>
          <Input />
        </Form.Item>
        <Form.Item
          label='Description'
          name='description'
          rules={[{ message: 'Please enter the description' }]}
        >
          <Input.TextArea rows={3} />
        </Form.Item>
        {categories && (
          <Form.Item
            label='Category'
            name='categoryId'
            rules={[{ required: true, message: 'Please select the category' }]}
          >
            <Select placeholder='Select a category'>
              {categories.data.items.map((cat) => (
                <Option key={cat.id} value={cat.id}>
                  {cat.name}
                </Option>
              ))}
            </Select>
          </Form.Item>
        )}
        {manufacturers && (
          <Form.Item
            label='Manufacturer'
            name='manufacturerId'
            rules={[
              { required: true, message: 'Please select the manufacturer' },
            ]}
          >
            <Select placeholder='Select a manufacturer'>
              {manufacturers.data.items.map((man) => (
                <Option key={man.id} value={man.id}>
                  {man.name}
                </Option>
              ))}
            </Select>
          </Form.Item>
        )}
        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Create vaccine
            </Button>
            <Button onClick={() => navigate('/manager/vaccine')}>Back</Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default VaccineDetail
