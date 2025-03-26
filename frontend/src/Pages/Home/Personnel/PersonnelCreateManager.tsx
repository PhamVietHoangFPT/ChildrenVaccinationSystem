import { useNavigate } from 'react-router-dom'
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
  useCreateACcountPersonnelMutation,
} from '../../../features/account/accountAPI'
import { Facilities } from '../../../types/facilities'
import { useGetFacilitiesListQuery } from '../../../features/facilities/facilitiesAPI'

const { Option } = Select
const { Title } = Typography

interface FacilityListResponse {
  data: {
    data: {
      items: Facilities[]
    }
  }
  isLoading: boolean
}

const CreatePersonnelManager: React.FC = () => {
  const navigate = useNavigate()
    
  const [createPersonnel] = useCreateACcountPersonnelMutation()

  const { data: facility, isLoading: facilityLoading } =
    useGetFacilitiesListQuery<FacilityListResponse>({
      pageNumber: -1,
      pageSize: -1,
    })

  const [form] = Form.useForm()

  const handleSave = async () => {
    try {
      const values = await form.validateFields(); 
      console.log('Validated Values:', values);
  
      const payload = {
        name: values.name,
        dateOfBirth: values.dateOfBirth ? values.dateOfBirth.format('YYYY-MM-DD') : null,
        gender: values.gender,
        email: values.email,
        role: values.role,
        facilityId: values.facilityId,
      };
  
      const createData = (await createPersonnel({
        data: payload,
      }).unwrap()) as { message: string };
  
      message.success(createData.message);
    } catch (error: any) {
      console.error('Validation or API Error:', error);
      message.error(error.data.message);
    }
  };
  


  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thêm Nhân viên</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
      >

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

        <Form.Item
          label='Chức vụ'
          name='role'
          rules={[{ required: true, message: 'Vui lòng chọn chức vụ' }]}
        >
          <Select placeholder='Chọn chức vụ'>
            <Option value={1}>Nhân viên</Option>
            <Option value={2}>Bác sĩ</Option>
            <Option value={3}>Người tiêm</Option>
          </Select>
        </Form.Item>

        {facilityLoading ? (
          <Spin />
        ) : (
          facility && (
            <Form.Item
              label='Cơ sở'
              name='facilityId'
              rules={[{ required: true, message: 'Vui lòng chọn cơ sở' }]}
            >
              <Select placeholder='Chọn nhà cơ sở'>
                {facility.data.items.map((fac) => (
                  <Option key={fac.id} value={fac.id}>
                    {fac.name}
                  </Option>
                ))}
              </Select>
            </Form.Item>
          )
        )}


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

export default CreatePersonnelManager
