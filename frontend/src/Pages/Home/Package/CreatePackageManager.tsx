import { useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message, Spin } from 'antd'
import { useCreatePackageMutation } from '../../../features/package/packageAPI'

const { Title } = Typography

const ManagerPackageCreate: React.FC = () => {
  const navigate = useNavigate()
  const [form] = Form.useForm()

  const [createPackage, { isLoading }] = useCreatePackageMutation()

  const handleSave = async (values: any) => {
    try {
      const packageData = {
        name: values.name,
        price: Number(values.price),
      }

      const createResponse = await createPackage(packageData).unwrap()

      message.success((createResponse as { message: string }).message)

      navigate('/manager/package')
    } catch (error: any) {
      message.error(
        'Error creating package: ' + (error.message || 'Unknown error')
      )
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Create Package</Title>
      {isLoading ? (
        <div style={{ textAlign: 'center', marginTop: '50px' }}>
          <Spin size='large' />
        </div>
      ) : (
        <Form form={form} layout='vertical' onFinish={handleSave}>
          <Form.Item
            label='Package Name'
            name='name'
            rules={[
              { required: true, message: 'Please enter the package name' },
            ]}
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
                  if (num < 0) {
                    return Promise.reject(
                      new Error('Price must be greater than or equal to 0')
                    )
                  }
                  return Promise.resolve()
                },
              },
            ]}
          >
            <Input />
          </Form.Item>

          <Form.Item>
            <div style={{ display: 'flex', gap: '16px' }}>
              <Button type='primary' htmlType='submit'>
                Save
              </Button>
              <Button onClick={() => navigate('/manager/package')}>Back</Button>
            </div>
          </Form.Item>
        </Form>
      )}
    </div>
  )
}

export default ManagerPackageCreate
