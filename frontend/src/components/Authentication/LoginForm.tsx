import { Form, Input, Button, notification } from 'antd'
import { useState } from 'react'
import { useLoginMutation } from '../../features/auth/authApi'

import { useNavigate } from 'react-router-dom'

export const LoginForm = () => {
  const [form] = Form.useForm()
  const [login, { isLoading }] = useLoginMutation()

  const [, setInputType] = useState<'email' | 'phoneNumber' | null>(null)
  const navigate = useNavigate()

  // set data email hoac so dien thoai
  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value.trim()
    if (/^\d{10}$/.test(value)) {
      // Kiem tra so dien thoai
      setInputType('phoneNumber')
      form.setFieldsValue({ phoneNumber: value, email: '' })
    } else if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
      // kiem tra email
      setInputType('email')
      form.setFieldsValue({ email: value, phoneNumber: '' })
    } else {
      // Không hợp lệ
      setInputType(null)
      form.setFieldsValue({ email: '', phoneNumber: '' })
    }
  }

  // Kiem tra du lieu nhap vao
  const validateInput = (value: string) => {
    if (!value) return Promise.reject('Vui lòng nhập email hoặc số điện thoại!')
    if (/^\d{10}$/.test(value)) return Promise.resolve() // Hợp lệ (số điện thoại)
    if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) return Promise.resolve() // Hợp lệ (email)
    return Promise.reject('Email hoặc số điện thoại không hợp lệ!')
  }

  const handleSubmit = async (values: any) => {
    const response = await login(values)

    if ('data' in response) {
      navigate('/')
    } else if ('error' in response && response.error) {
      const errorData = response.error as any
      if (
        typeof errorData === 'object' &&
        'data' in errorData &&
        typeof errorData.data === 'object' &&
        errorData.data !== null &&
        'message' in errorData.data
      ) {
        notification.error({
          message: 'Đăng nhập thất bại',
          description: errorData.data.message,
        })
      }
    }
  }

  return (
    <>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSubmit}
        name='basic'
        initialValues={{ remember: true }}
        autoComplete='on'
        style={{
          padding: 24,
          background: '#fff',
          borderRadius: 8,
          boxShadow: '0px 4px 10px rgba(0,0,0,0.1)',
        }}
      >
        {/* Ô nhập email hoặc số điện thoại */}
        <Form.Item
          name='contact' // Luôn giữ cố định là "contact"
          rules={[{ validator: (_, value) => validateInput(value) }]}
        >
          <Input
            placeholder='Nhập email hoặc số điện thoại'
            onChange={handleInputChange}
          />
        </Form.Item>

        {/* Trường email (ẩn) */}
        <Form.Item name='email' hidden>
          <Input />
        </Form.Item>

        {/* Trường số điện thoại (ẩn) */}
        <Form.Item name='phoneNumber' hidden>
          <Input />
        </Form.Item>

        {/* Trường mật khẩu */}
        <Form.Item
          name='password'
          rules={[
            { required: true, message: 'Vui lòng nhập mật khẩu' },
            // { min: 6, message: 'Mật khẩu phải có ít nhất 6 ký tự' },
          ]}
        >
          <Input.Password placeholder='Nhập mật khẩu' />
        </Form.Item>

        <Form.Item>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
            }}
          >
            <div>
              <Button type='link' onClick={() => navigate('/register')}>
                Chưa có tài khoản? Đăng ký ngay
              </Button>
            </div>
            <div>
              <Button type='primary' htmlType='submit' loading={isLoading}>
                Đăng nhập
              </Button>
            </div>
          </div>
        </Form.Item>
      </Form>
    </>
  )
}
