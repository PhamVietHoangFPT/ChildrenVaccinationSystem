import { useParams, useNavigate } from 'react-router-dom'
import {
  Form,
  Input,
  Button,
  Typography,
  message,
  Modal,
  Spin,
  Select,
} from 'antd'
const { Option } = Select
import {
  useGetVaccineDetailQuery,
  useUpdateVaccineMutation,
  useDeleteVaccineMutation,
} from '../../../features/vaccine/vaccineAPI'

import { useGetManufacturesListQuery } from '../../../features/manufactures/manufacturesAPI'
import { useGetCategoriesListQuery } from '../../../features/categories/categoriesAPI'

import { Vaccines } from '../../../types/vaccine'
import { Manufacturers } from '../../../types/manufacturer'
import { Category } from '../../../types/category'

const { Title } = Typography
interface VaccineListResponse {
  data: {
    data: Vaccines
  }
  isLoading: boolean
}

interface ManufacturesListResponse {
  data: {
    data: {
      items: Manufacturers[]
    }
  }
  isLoading: boolean
}

interface CategoriesListResponse {
  data: {
    data: {
      items: Category[]
    }
  }
  isLoading: boolean
}

const VaccineDetail: React.FC = () => {
  const navigate = useNavigate()

  const { id } = useParams()
  const { data: data, isLoading } =
    useGetVaccineDetailQuery<VaccineListResponse>(id as string)
  const { data: manufacturers, isLoading: manufacturerLoading } =
    useGetManufacturesListQuery<ManufacturesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })
  const { data: categories, isLoading: categoriesLoading } =
    useGetCategoriesListQuery<CategoriesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })
  const [updateVaccine] = useUpdateVaccineMutation()
  const [deleteVaccine] = useDeleteVaccineMutation()
  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      console.log(values)
      const { id, ...value } = { ...values, price: Number(values.price) }
      const dataUpdate = (await updateVaccine({
        id: id,
        data: value,
      }).unwrap()) as {
        message: string
      }
      message.success(dataUpdate.message)
      // navigate('/manager/vaccine')
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
          const dataDelete = (await deleteVaccine(id).unwrap()) as {
            message: string
          }
          message.success(dataDelete.message)
          navigate('/manager/vaccine')
        } catch (error: any) {
          message.error('Error deleting vaccine: ' + error.message)
        }
      },
    })
  }

  if (isLoading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size='large' />
      </div>
    )
  }

  if (!data) {
    return <div>No vaccine found.</div>
  }

  const initialValues = {
    ...data.data,
    categoryId: data.data?.category?.id,
    manufacturerId: data.data?.manufacturer?.id,
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Vaccine Details</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
        initialValues={initialValues}
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
        {categoriesLoading ? (
          <Spin />
        ) : (
          categories && (
            <Form.Item
              label='Category'
              name='categoryId'
              rules={[
                { required: true, message: 'Please select the category' },
              ]}
            >
              <Select placeholder='Select a category'>
                {categories.data.items.map((cat) => (
                  <Option key={cat.id} value={cat.id}>
                    {cat.name}
                  </Option>
                ))}
              </Select>
            </Form.Item>
          )
        )}
        {manufacturerLoading ? (
          <Spin />
        ) : (
          manufacturers && (
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
          )
        )}
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
