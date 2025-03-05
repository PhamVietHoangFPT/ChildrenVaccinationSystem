import { useLoginMutation } from '../../features/auth/authApi'
import type { FormProps } from 'antd'
import { Button, Form, Input } from 'antd'
import { useNavigate } from 'react-router-dom'

export function LoginForm() {
  const [login] = useLoginMutation()
  const navigate = useNavigate()
  interface FieldType {
    username: string
    password: string
  }

  const onFinish: FormProps<FieldType>['onFinish'] = async (values) => {
    try {
      await login({
        email: values.username,
        password: values.password,
      }).unwrap()
      alert('Đăng nhập thành công')
      navigate('/')
    } catch (error: any) {
      // Kiểm tra nếu error có response từ server
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
    alert(errorInfo)
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
        label='Username'
        name='username'
        rules={[{ required: true, message: 'Please input your username!' }]}
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
