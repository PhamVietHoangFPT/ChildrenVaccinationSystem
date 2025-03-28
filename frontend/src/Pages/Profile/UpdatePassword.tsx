import { Button, Form, Input, message } from 'antd'
import { useUpdatePasswordMutation } from '../../features/auth/authApi'
import { useNavigate } from 'react-router-dom'

export default function UpdatePassword() {
  const [form] = Form.useForm()
  const navigate = useNavigate()
  const [updatePassword, { isLoading }] = useUpdatePasswordMutation()

  const onFinish = async (values: any) => {
    if (values.newPassword !== values.confirmPassword) {
      message.error('Mật khẩu xác nhận không khớp!')
      return
    }
    try {
      const dataResponse = await updatePassword({
        password: values.oldPassword,
        newPassword: values.newPassword,
      }).unwrap()
      message.success(dataResponse.message)
      form.resetFields()
      navigate('/profile')
    } catch (error: any) {
      message.error(error?.data?.message || 'Cập nhật thất bại!')
    }
  }

  return (
    <div style={{ maxWidth: 400, margin: 'auto', padding: 20 }}>
      <h2 style={{ textAlign: 'center' }}>Cập nhật mật khẩu</h2>
      <Form form={form} layout='vertical' onFinish={onFinish}>
        <Form.Item
          label='Mật khẩu cũ'
          name='oldPassword'
          rules={[{ required: true, message: 'Vui lòng nhập mật khẩu cũ!' }]}
        >
          <Input.Password placeholder='Nhập mật khẩu cũ' />
        </Form.Item>

        <Form.Item
          label='Mật khẩu mới'
          name='newPassword'
          rules={[
            { required: true, message: 'Vui lòng nhập mật khẩu mới!' },
            { min: 6, message: 'Mật khẩu phải ít nhất 6 ký tự!' },
          ]}
        >
          <Input.Password placeholder='Nhập mật khẩu mới' />
        </Form.Item>

        <Form.Item
          label='Xác nhận mật khẩu mới'
          name='confirmPassword'
          dependencies={['newPassword']}
          rules={[
            { required: true, message: 'Vui lòng xác nhận mật khẩu mới!' },
            ({ getFieldValue }) => ({
              validator(_, value) {
                if (!value || getFieldValue('newPassword') === value) {
                  return Promise.resolve()
                }
                return Promise.reject(
                  new Error('Mật khẩu xác nhận không khớp!')
                )
              },
            }),
          ]}
        >
          <Input.Password placeholder='Xác nhận mật khẩu mới' />
        </Form.Item>

        <Form.Item>
          <Button type='primary' htmlType='submit' block loading={isLoading}>
            Xác nhận
          </Button>
        </Form.Item>
      </Form>
    </div>
  )
}
