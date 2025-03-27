import { useNavigate } from 'react-router-dom'
import { Form, Input, Button, message, Typography, Spin } from 'antd'
import { useCreateFacilitiesMutation } from '../../../features/facilities/facilitiesAPI'

const { Title } = Typography

const ManagerFacilityCreate: React.FC = () => {
  const [createFacility, { isLoading }] = useCreateFacilitiesMutation()
  const navigate = useNavigate()

  const onFinish = async (values: { name: string; address: string }) => {
    try {
      const { name, address } = values

      await createFacility({ name, address }).unwrap()

      message.success('Tạo cơ sở thành công')

      navigate('/manager/facility')
    } catch (error: any) {
      message.error(error.message)
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Tạo Cơ Sở Mới</Title>

      <Form
        layout='vertical'
        onFinish={onFinish}
        style={{ maxWidth: '600px', margin: 'auto' }}
      >
        <Form.Item
          label='Tên Cơ Sở'
          name='name'
          rules={[
            { required: true, message: 'Vui lòng nhập tên cơ sở' },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Địa Chỉ'
          name='address'
          rules={[{ required: true, message: 'Vui lòng nhập địa chỉ' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item>
          <Button type='primary' htmlType='submit' loading={isLoading}>
            {isLoading ? 'Đang Tạo...' : 'Tạo Cơ Sở'}
          </Button>
        </Form.Item>
      </Form>

      {isLoading && (
        <div style={{ textAlign: 'center', marginTop: '50px' }}>
          <Spin size='large' />
        </div>
      )}
    </div>
  )
}

export default ManagerFacilityCreate
