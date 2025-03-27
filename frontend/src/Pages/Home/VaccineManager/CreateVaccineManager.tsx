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
      <Title level={2}>Thêm Vaccine</Title>
      <Form form={form} layout='vertical' onFinish={handleSave}>
        <Form.Item
          label='Tên'
          name='name'
          rules={[{ required: true, message: 'Vui lòng nhập tên Vaccine' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Giá'
          name='price'
          rules={[
            { required: true, message: 'Vui lòng nhập giá Vaccine' },
            {
              validator: (_, value) => {
                const num = Number(value)
                if (isNaN(num)) {
                  return Promise.reject(new Error('Giá phải là số'))
                }
                if (num <= 0) {
                  return Promise.reject(new Error('Giá phải lớn hơn 0'))
                }
                return Promise.resolve()
              },
            },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Mô tả'
          name='description'
          rules={[{ required: true, message: 'Vui lòng nhập mô tả' }]}
        >
          <Input.TextArea rows={3} />
        </Form.Item>

        <Form.Item label='Tuổi bắt đầu' style={{ marginBottom: 0 }}>
          <Form.Item
            name='startRecommendedAge'
            style={{ display: 'inline-block', width: 'calc(50% - 8px)' }}
            rules={[
              { required: true, message: 'Vui lòng nhập tuổi bắt đầu' },
              () => ({
                validator(_, value) {
                  const num = Number(value)
                  if (isNaN(num)) {
                    return Promise.reject(new Error('Tuổi phải là số'))
                  }
                  if (num < 0 || num > 15) {
                    return Promise.reject(
                      new Error(
                        'Tuổi bắt đầu phải nằm trong khoảng từ 0 đến 15'
                      )
                    )
                  }
                  return Promise.resolve()
                },
              }),
            ]}
          >
            <Input placeholder='Nhập tuổi bắt đầu' />
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
              { required: true, message: 'Vui lòng nhập tuổi kết thúc' },
              ({ getFieldValue }) => ({
                validator(_, value) {
                  const startAge = Number(getFieldValue('startRecommendedAge'))
                  const endAge = Number(value)

                  if (isNaN(endAge)) {
                    return Promise.reject(new Error('Tuổi kết thúc phải là số'))
                  }
                  if (endAge < 1 || endAge > 16) {
                    return Promise.reject(
                      new Error(
                        'Tuổi kết thúc phải nằm trong khoảng từ 1 đến 16'
                      )
                    )
                  }
                  if (endAge <= startAge) {
                    return Promise.reject(
                      new Error('Tuổi kết thúc phải lớn hơn tuổi bắt đầu')
                    )
                  }
                  return Promise.resolve()
                },
              }),
            ]}
          >
            <Input placeholder='Tuổi kết thúc' />
          </Form.Item>
        </Form.Item>

        <Form.Item
          label='Số mũi tiêm'
          name='sequence'
          rules={[
            { required: true, message: 'Vui lòng nhập số mũi tiêm' },
            {
              validator: (_, value) => {
                const num = Number(value)
                if (isNaN(num) || !Number.isInteger(num) || num <= 0) {
                  return Promise.reject(
                    new Error('Số mũi tiêm phải là số nguyên dương')
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
          label='Liều lượng'
          name='dosage'
          rules={[{ required: true, message: 'Vui lòng nhập vào liều lượng' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Khoảng cách giữa các liều'
          name='dosageInterval'
          rules={[{ required: true, message: 'Vui lòng nhập khoảng cách giữa các liều' }]}
        >
          <Input />
        </Form.Item>

        {categoriesLoading ? (
          <Spin />
        ) : (
          categories && (
            <Form.Item
              label='Danh mục Vaccines'
              name='categoryId'
              rules={[
                { required: true, message: 'Vui lòng chọn danh mục' },
              ]}
            >
              <Select placeholder='Chọn danh mục Vaccine'>
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
              label='Nhà sản xuất'
              name='manufacturerId'
              rules={[
                { required: true, message: 'Vui lòng chọn nhà sản xuất' },
              ]}
            >
              <Select placeholder='Chọn nhà sản xuất'>
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
          label='Hình ảnh'
          name='imageSource'
          valuePropName='fileList'
          getValueFromEvent={(e) => {
            if (Array.isArray(e)) {
              return e
            }
            return e?.fileList
          }}
          rules={[{ required: true, message: 'Vui lòng đăng tải hình ảnh' }]}
        >
          <Upload
            name='image'
            listType='picture'
            beforeUpload={() => false} 
            maxCount={1}
          >
            <Button icon={<UploadOutlined />}>Nhấp vào để đăng tải</Button>
          </Upload>
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Lưu
            </Button>
            <Button onClick={() => navigate('/manager/vaccine')}>Trở lại</Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default CreateVaccine
