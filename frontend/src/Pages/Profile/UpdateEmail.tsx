import { useState } from 'react'
import { Button, Form, Input, message } from 'antd'
import {
  useUpdateEmailMutation,
  useConfirmUpdateEmailMutation,
} from '../../features/auth/authApi'
import { useNavigate } from 'react-router-dom'
export default function UpdateEmail() {
  const [form] = Form.useForm()
  const [isOtpStep, setIsOtpStep] = useState(false)
  const navigate = useNavigate()

  const [updateEmail, { isLoading: isUpdating }] = useUpdateEmailMutation()
  const [confirmUpdateEmail, { isLoading: isConfirming }] =
    useConfirmUpdateEmailMutation()

  // ✅ Gửi yêu cầu cập nhật email
  const handleUpdateEmail = async ({ email }: { email: string }) => {
    try {
      const updateEmailData = await updateEmail({ email }).unwrap()
      message.success(updateEmailData.message)
      setIsOtpStep(true) // Chuyển sang bước nhập OTP
    } catch (error: any) {
      message.error(error.data.message)
    }
  }

  // ✅ Xác nhận OTP
  const handleConfirmOtp = async (otp: any) => {
    try {
      const confirmUpdateEmaillData = await confirmUpdateEmail(otp).unwrap()
      message.success(confirmUpdateEmaillData.message)
      form.resetFields()
      setIsOtpStep(false)
      navigate('/profile')
    } catch (error: any) {
      console.log(error)
      message.error(error.data.message)
    }
  }

  return (
    <div style={{ maxWidth: 400, margin: 'auto', padding: 20 }}>
      {!isOtpStep && (
        <>
          <h2 style={{ textAlign: 'center' }}>{'Cập nhật Email'}</h2>

          <Form
            form={form}
            layout='vertical'
            onFinish={(values) => {
              handleUpdateEmail(values)
            }}
          >
            <Form.Item
              label='Email mới'
              name='email'
              rules={[
                { required: true, message: 'Vui lòng nhập email mới!' },
                { type: 'email', message: 'Email không hợp lệ!' },
              ]}
            >
              <Input placeholder='Nhập email mới' />
            </Form.Item>

            <Form.Item>
              <Button
                type='primary'
                htmlType='submit'
                block
                loading={isUpdating || isConfirming}
              >
                {'Cập nhật Email'}
              </Button>
            </Form.Item>
          </Form>
        </>
      )}
      {isOtpStep && (
        <>
          <h2 style={{ textAlign: 'center' }}>{'Xác nhận OTP'}</h2>
          <Form
            layout='vertical'
            onFinish={(values) => handleConfirmOtp(values)}
          >
            <Form.Item
              label='Nhập mã OTP'
              name='otp'
              rules={[{ required: true, message: 'Vui lòng nhập mã OTP!' }]}
            >
              <Input placeholder='Nhập mã OTP' maxLength={6} />
            </Form.Item>
            <Form.Item>
              <Button
                type='primary'
                htmlType='submit'
                block
                loading={isUpdating || isConfirming}
              >
                {'Xác nhận OTP'}
              </Button>
            </Form.Item>
          </Form>
        </>
      )}
    </div>
  )
}
