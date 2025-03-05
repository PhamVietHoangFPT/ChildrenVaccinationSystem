import { useRegisterMutation } from '../../features/auth/authApi'
import type { FormProps } from 'antd'
import { Button, Form, Input } from 'antd'
import { useNavigate } from 'react-router-dom'

export function RegisterForm() {
  const [register] = useRegisterMutation()
  const navigate = useNavigate()
  interface FieldType {
    name: string
    password: string
    email: string
  }

  const onFinish: FormProps<FieldType>['onFinish'] = async (values) => {
    try {
      await register({
        email: values.email,
        password: values.password,
        name: values.name,
      }).unwrap()
      alert('Đăng ký thành công')
      navigate('/login')
    } catch (error: any) {
      if (error?.status === 400) {
        alert(error.data.message)
      } else {
        alert('Lỗi hệ thống, thử lại sau!')
      }
    }
  }

  const onFinishFailed: FormProps<FieldType>['onFinishFailed'] = (
    errorInfo
  ) => {
    console.log('Failed:', errorInfo)
  }
  return (
    <Form
      name='basic'
      labelCol={{ span: 8 }}
      wrapperCol={{ span: 16 }}
      style={{ maxWidth: 600 }}
      initialValues={{ remember: true }}
      onFinish={onFinish}
      onFinishFailed={onFinishFailed}
      autoComplete='off'
    >
      <Form.Item<FieldType>
        label='Email'
        name='email'
        rules={[{ required: true, message: 'Please input your email!' }]}
      >
        <Input />
      </Form.Item>

      <Form.Item<FieldType>
        label='name'
        name='name'
        rules={[{ required: true, message: 'Please input your name!' }]}
      >
        <Input />
      </Form.Item>

      <Form.Item<FieldType>
        label='Password'
        name='password'
        rules={[{ required: true, message: 'Please input your password!' }]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item label={null}>
        <Button type='primary' htmlType='submit'>
          Submit
        </Button>
      </Form.Item>
    </Form>
  )
}
