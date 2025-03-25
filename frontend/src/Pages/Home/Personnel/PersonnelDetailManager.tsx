import { useParams, useNavigate } from 'react-router-dom'
import {
  Form,
  Input,
  Button,
  Typography,
  message,
  Spin,
  DatePicker,
  Select,
} from 'antd'
import {
  useUpdateAccountPersonnelMutation,
  useGetPersonnelDetailQuery,
} from '../../../features/account/accountAPI'
import { Personnel } from '../../../types/personnel'
import moment from 'moment'

const { Option } = Select
const { Title } = Typography

interface PersonnelDetailResponse {
  data: {
    data: Personnel
  }
  isLoading: boolean
}

const PersonnelDetailManager: React.FC = () => {
  const navigate = useNavigate()
  const { id } = useParams()

  const { data, isLoading } =
    useGetPersonnelDetailQuery<PersonnelDetailResponse>(id as string)
  const [updatePersonnel] = useUpdateAccountPersonnelMutation()

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      const payload = {
        ...values,
        dateOfBirth: values.dateOfBirth
          ? values.dateOfBirth.format('YYYY-MM-DD')
          : null,
      }
      delete payload.role;

      const dataUpdate = (await updatePersonnel({
        id,
        data: payload,
      }).unwrap()) as { message: string }
      message.success(dataUpdate.message)
    } catch (error: any) {
      message.error(error.message)
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
    return <div>Personnel not found</div>
  }

  const initialValues = {
    name: data.data.name,
    dateOfBirth: data.data.dateOfBirth ? moment(data.data.dateOfBirth) : null,
    email: data.data.email,
    gender: data.data.gender,
    role: data.data.role,
    facilityName: data.data.facility?.name,
    facilityAddress: data.data.facility?.address,
    isResettingPassword: false
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thông tin Nhân viên</Title>
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
          rules={[{ required: true, message: 'Vui lòng nhập tên nhân viên' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Ngày sinh'
          name='dateOfBirth'
          rules={[{ required: true, message: 'Vui lòng nhập ngày sinh' }]}
        >
          <DatePicker style={{ width: '100%' }} format='DD/MM/YYYY' />
        </Form.Item>

        <Form.Item
          label='Email'
          name='email'
          rules={[{ required: true, message: 'Vui lòng nhập email' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Giới tính'
          name='gender'
          rules={[{ required: true, message: 'Vui lòng chọn giới tính' }]}
        >
          <Select placeholder='Chọn giới tính'>
            <Option value={true}>Nam</Option>
            <Option value={false}>Nữ</Option>
          </Select>
        </Form.Item>

        <Form.Item label={`Chức vụ: ${initialValues.role}`} />

        <Form.Item label={`Tên cơ sở: ${initialValues.facilityName}`} />

        <Form.Item label={`Địa chỉ cơ sở: ${initialValues.facilityAddress}`} />

        <Form.Item
          label='Đặt lại mật khẩu'
          name='isResettingPassword'
          rules={[{ required: true, message: 'Vui lòng chọn tùy chọn' }]}
        >
          <Select placeholder='Chọn tùy chọn'>
            <Option value={true}>Có</Option>
            <Option value={false}>Không</Option>
          </Select>
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Lưu
            </Button>
            <Button onClick={() => navigate('/manager/personnel')}>
              Trở lại
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default PersonnelDetailManager
