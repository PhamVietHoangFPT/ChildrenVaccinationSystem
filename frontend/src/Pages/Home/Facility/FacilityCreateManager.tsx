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

      message.success('Facility created successfully')

      navigate('/manager/facility')
    } catch (error: any) {
      message.error(error.message)
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Create New Facility</Title>

      <Form
        layout='vertical'
        onFinish={onFinish}
        style={{ maxWidth: '600px', margin: 'auto' }}
      >
        <Form.Item
          label='Facility Name'
          name='name'
          rules={[
            { required: true, message: 'Please enter the facility name' },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Address'
          name='address'
          rules={[{ required: true, message: 'Please enter the address' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item>
          <Button type='primary' htmlType='submit' loading={isLoading}>
            {isLoading ? 'Creating...' : 'Create Facility'}
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
