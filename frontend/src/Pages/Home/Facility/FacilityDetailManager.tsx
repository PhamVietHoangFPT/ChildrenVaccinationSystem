import { useParams, useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message, Spin } from 'antd'
import {
  useGetFacilitiesDetailQuery,
  useUpdateFacilitiesMutation,
} from '../../../features/facilities/facilitiesAPI'
import { Facilities } from '../../../types/facilities'

const { Title } = Typography

interface FacilityDetailResponse {
  data: {
    data: Facilities
  }
  isLoading: boolean
}

const ManagerFacilityDetail: React.FC = () => {
  const navigate = useNavigate()
  const { id } = useParams()

  const { data, isLoading } =
    useGetFacilitiesDetailQuery<FacilityDetailResponse>(id as string)

  const [updateFacility] = useUpdateFacilitiesMutation()

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      const facilityData = {
        address: values.address,
      }

      const dataUpdate = (await updateFacility({
        id,
        data: facilityData,
      }).unwrap()) as { message: string }

      message.success(dataUpdate.message)
    } catch (error: any) {
      message.error('Lỗi khi cập nhật địa chỉ: ' + error.message)
    }
  }

  if (isLoading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size='large' />
      </div>
    )
  }

  if (!data) {
    return <div>Không tìm thấy Facility</div>
  }

  const initialValues = {
    address: data.data.address,
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thông tin Facility</Title>

      <Form
        form={form}
        layout='vertical'
        initialValues={initialValues}
        onFinish={handleSave}
      >
        <Form.Item
          label='Địa chỉ Facility'
          name='address'
          rules={[
            { required: true, message: 'Vui lòng nhập địa chỉ facility' },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px', marginTop: '24px' }}>
            <Button type='primary' htmlType='submit'>
              Lưu
            </Button>
            <Button onClick={() => navigate('/manager/facility')}>
              Trở lại
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default ManagerFacilityDetail
