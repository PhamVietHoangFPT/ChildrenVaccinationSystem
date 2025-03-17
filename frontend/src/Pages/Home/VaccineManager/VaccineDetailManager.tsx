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
  Upload,
} from 'antd'
import { UploadOutlined } from '@ant-design/icons'
import {
  useGetVaccineDetailQuery,
  useUpdateVaccineMutation,
  useDeleteVaccineMutation,
} from '../../../features/vaccine/vaccineAPI'
import { useGetManufacturersListQuery } from '../../../features/manufactures/manufacturesAPI'
import { useGetCategoriesListQuery } from '../../../features/categories/categoriesAPI'

import { Vaccines } from '../../../types/vaccine'
import { Manufacturers } from '../../../types/manufacturer'
import { Category } from '../../../types/category'

const { Option } = Select
const { Title } = Typography

interface VaccineListResponse {
  data: {
    data: Vaccines
  }
  isLoading: boolean
}

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

const VaccineDetail: React.FC = () => {
  const navigate = useNavigate()
  const { id } = useParams()

  const { data, isLoading } = useGetVaccineDetailQuery<VaccineListResponse>(
    id as string
  )

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

  const [updateVaccine] = useUpdateVaccineMutation()
  const [deleteVaccine] = useDeleteVaccineMutation()

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      console.log('Form values:', values)

      const formData = new FormData()
      formData.append('name', values.name)
      formData.append('price', String(values.price))
      formData.append('description', values.description || '')
      formData.append('startRecommendedAge', String(values.startRecommendedAge))
      formData.append('endRecommendedAge', String(values.endRecommendedAge))
      formData.append(
        'sequence',
        values.sequence ? String(values.sequence) : '0'
      )
      formData.append('dosage', values.dosage ? String(values.dosage) : '0')
      formData.append(
        'dosageInterval',
        values.dosageInterval ? String(values.dosageInterval) : '0'
      )
      formData.append('categoryId', values.categoryId)
      formData.append('manufacturerId', values.manufacturerId)

      // Phan nay de chon file upload
      if (values.imageSource && values.imageSource[0]?.originFileObj) {
        formData.append('imageSource', values.imageSource[0].originFileObj)
      }

      const dataUpdate = (await updateVaccine({
        id,
        data: formData,
      }).unwrap()) as { message: string }

      message.success(dataUpdate.message)
      // navigate('/manager/vaccine')
    } catch (error: any) {
      message.error(error.message)
    }
  }

  const handleDelete = () => {
    Modal.confirm({
      title: 'Bạn chắc chắn muốn xóa Vắc Xin này?',
      content: `Hành động này không thể hoàn tác`,
      okText: 'Xóa',
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
    return <div>Không tìm thấy Vắc Xin</div>
  }

  const initialValues = {
    ...data.data,
    categoryId: data.data?.category?.id,
    manufacturerId: data.data?.manufacturer?.id,
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thông tin Vắc Xin</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
        initialValues={initialValues}
      >
        <Form.Item name='id' hidden>
          <Input />
        </Form.Item>

        <Form.Item
          label='Tên'
          name='name'
          rules={[{ required: true, message: 'Vui lòng nhập tên Vắc-Xin' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Giá'
          name='price'
          rules={[
            { required: true, message: 'Vui lòng nhập giá cả' },
            {
              validator: (_, value) => {
                const num = Number(value)
                if (Number.isNaN(num)) {
                  return Promise.reject(new Error('Giá phải là một số hợp lệ'))
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

        <Form.Item label='Mô tả' name='description'>
          <Input.TextArea rows={3} />
        </Form.Item>

        <Form.Item label='Recommended Age' style={{ marginBottom: 0 }}>
          <Form.Item
            name='startRecommendedAge'
            style={{ display: 'inline-block', width: 'calc(50% - 8px)' }}
            rules={[
              { required: true, message: 'Nhập tuổi bắt đầu' },
              {
                validator(_, value) {
                  if (value === undefined || value === null || value === '') {
                    return Promise.reject('Yêu cầu nhập tuổi bắt đầu')
                  }
                  const num = Number(value)
                  if (isNaN(num)) {
                    return Promise.reject('Tuổi bắt đầu phỉa là một số hợp lệ')
                  }
                  if (num < 0 || num > 15) {
                    return Promise.reject(
                      'Tuổi bắt đầu phải nằm trong khoảng từ 0 đến 15'
                    )
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
              { required: true, message: 'Nhập tuổi kết thúc' },
              ({ getFieldValue }) => ({
                validator(_, value) {
                  if (value === undefined || value === null || value === '') {
                    return Promise.reject('Yêu cầu nhập tuổi kết thúc')
                  }
                  const endNum = Number(value)
                  const startNum = Number(getFieldValue('startRecommendedAge'))
                  if (isNaN(endNum)) {
                    return Promise.reject('Tuổi kết thúc phải là một số hợp lệ')
                  }
                  if (endNum < 1 || endNum > 16) {
                    return Promise.reject(
                      'Tuổi kết thúc phải nằm trong khoảng từ 1 đến 16'
                    )
                  }
                  if (startNum >= endNum) {
                    return Promise.reject(
                      'Tuổi kết thúc phải lớn hơn tuổi bắt đầu'
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

        <Form.Item label='Số mũi' name='sequence'>
          <Input />
        </Form.Item>

        <Form.Item label='Liều' name='dosage'>
          <Input />
        </Form.Item>

        <Form.Item label='Khoảng cách giữa các liều' name='dosageInterval'>
          <Input />
        </Form.Item>

        {categoriesLoading ? (
          <Spin />
        ) : (
          categories && (
            <Form.Item
              label='Danh mục'
              name='categoryId'
              rules={[{ required: true, message: 'Vui lòng chọn danh mục' }]}
            >
              <Select placeholder='Chọn danh mục'>
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

        <img
          src={
            data?.data.images && data?.data.images.length > 0
              ? import.meta.env.VITE_IMAGE_ENDPOINT +
                data?.data.images[0].imageSource
              : '/placeholder.svg'
          }
          alt={data?.data.name}
          style={{
            width: '200px',
            objectFit: 'cover',
          }}
        />

        <Form.Item
          label='Tệp hình ảnh'
          name='imageSource'
          valuePropName='fileList'
          getValueFromEvent={(e) => {
            if (Array.isArray(e)) {
              return e
            }
            return e?.fileList
          }}
        >
          <Upload
            name='image'
            listType='picture'
            beforeUpload={() => false} // ngan chan tu dong upload
            maxCount={1}
          >
            <Button icon={<UploadOutlined />}>Tải tệp lên</Button>
          </Upload>
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Lưu
            </Button>
            <Button danger onClick={handleDelete}>
              Xóa
            </Button>
            <Button onClick={() => navigate('/manager/vaccine')}>
              Trở lại
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default VaccineDetail
