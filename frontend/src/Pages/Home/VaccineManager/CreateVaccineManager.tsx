import { useNavigate } from 'react-router-dom'
import {
  Form,
  Input,
  Button,
  Typography,
  message,
  Spin,
  Select,
  Upload,
} from 'antd'
import { UploadOutlined } from '@ant-design/icons'
const { Option } = Select

import { useCreateVaccineMutation } from '../../../features/vaccine/vaccineAPI'
import { useGetManufacturersListQuery } from '../../../features/manufactures/manufacturesAPI'
import { useGetCategoriesListQuery } from '../../../features/categories/categoriesAPI'

import { Category } from '../../../types/category'
import { Manufacturers } from '../../../types/manufacturer'

const { Title } = Typography

interface ManufacturersListResponse {
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

const CreateVaccine: React.FC = () => {
  const navigate = useNavigate()
  const [form] = Form.useForm()

  const [createVaccine] = useCreateVaccineMutation()

  const { data: manufacturers, isLoading: manufacturerLoading } =
    useGetManufacturersListQuery<ManufacturersListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  const { data: categories, isLoading: categoriesLoading } =
    useGetCategoriesListQuery<CategoriesListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  const handleSave = async (values: any) => {
    try {
      const formData = new FormData()

      formData.append('name', values.name)
      formData.append('price', values.price)
      formData.append('description', values.description || '')
      formData.append('startRecommendedAge', values.startRecommendedAge)
      formData.append('endRecommendedAge', values.endRecommendedAge)
      formData.append('sequence', values.sequence)
      formData.append('dosage', values.dosage)
      formData.append('dosageInterval', values.dosageInterval)
      formData.append('categoryId', values.categoryId)
      formData.append('manufacturerId', values.manufacturerId)
      
      formData.append('imageSource', values.imageSource[0].originFileObj)
     
      const createResponse = (await createVaccine(formData).unwrap()) as {
        message: string
      }

      message.success(createResponse.message)
      navigate('/manager/vaccine')
      
    } catch (error: any) {
      message.error('Error creating vaccine: ' + error.message)
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Create Vaccine</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
      >
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
                if (isNaN(num)) {
                  return Promise.reject(new Error('Price must be a number'))
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

        <Form.Item
          label='Description'
          name='description'
          rules={[{ required: true, message: 'Please enter the description' }]}
        >
          <Input.TextArea rows={3} />
        </Form.Item>

        <Form.Item label='Recommended Age' style={{ marginBottom: 0 }}>
  <Form.Item
    name='startRecommendedAge'
    style={{ display: 'inline-block', width: 'calc(50% - 8px)' }}
    rules={[
      { required: true, message: 'Enter start age' },
      ( ) => ({
        validator(_, value) {
          const num = Number(value)
          if (isNaN(num)) {
            return Promise.reject(new Error('Start age must be a number'))
          }
          if (num < 0 || num > 15) {
            return Promise.reject(
              new Error('Start age must be between 0 and 15')
            )
          }
          return Promise.resolve()
        },
      }),
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
      { required: true, message: 'Enter end age' },
      ({ getFieldValue }) => ({
        validator(_, value) {
          const startAge = Number(getFieldValue('startRecommendedAge'))
          const endAge = Number(value)

          if (isNaN(endAge)) {
            return Promise.reject(new Error('End age must be a number'))
          }
          if (endAge < 1 || endAge > 16) {
            return Promise.reject(
              new Error('End age must be between 1 and 16')
            )
          }
          if (endAge <= startAge) {
            return Promise.reject(
              new Error('End age must be greater than start age')
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
          label='Sequence'
          name='sequence'
          rules={[{ required: true, message: 'Please enter sequence' },
            
            {
              validator: (_, value) => {
                const num = Number(value)
                if (isNaN(num)) {
                  return Promise.reject(new Error('Sequence must be a number'))
                }
                return Promise.resolve()
              },
            },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Dosage'
          name='dosage'
          rules={[{ required: true, message: 'Please enter dosage' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Dosage Interval'
          name='dosageInterval'
          rules={[{ required: true, message: 'Please enter dosage interval' }]}
        >
          <Input />
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

        <Form.Item
          label='Image Source'
          name='imageSource'
          valuePropName="fileList" 
          getValueFromEvent={(e) => {
            if (Array.isArray(e)) {
              return e
            }
            return e?.fileList
          }}
          rules={[{ required: true, message: 'Please upload image' }]}
        >
          <Upload
            name='image'
            listType='picture'
            beforeUpload={() => false} // prevents auto upload
            maxCount={1}
          >
            <Button icon={<UploadOutlined />}>Click to upload</Button>
          </Upload>
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Save
            </Button>
            <Button onClick={() => navigate('/manager/vaccine')}>
              Back
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default CreateVaccine
