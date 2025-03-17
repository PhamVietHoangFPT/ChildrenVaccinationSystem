import { useRegisterMutation } from '../../features/auth/authApi'
import { Formik, Field } from 'formik'
import * as Yup from 'yup'
import { Input, Button, Form as AntdForm, notification } from 'antd'
import { useNavigate } from 'react-router-dom'
export function RegisterForm() {
  const [register, { isLoading }] = useRegisterMutation()
  const navigate = useNavigate()

  interface FieldType {
    name: string
    password: string
    email: string
    retypePassword: string
  }

  const initialValues: FieldType = {
    email: '',
    name: '',
    password: '',
    retypePassword: '',
  }

  const validationSchema = Yup.object({
    email: Yup.string()
      .email('Email không hợp lệ')
      .required('Vui lòng nhập email!'),
    name: Yup.string().required('Vui lòng nhập tên người dùng!'),
    password: Yup.string()
      .min(6, 'Mật khẩu ít nhất 6 ký tự')
      .required('Vui lòng nhập mật khẩu!'),
    retypePassword: Yup.string()
      .oneOf([Yup.ref('password'), undefined], 'Mật khẩu không khớp')
      .required('Vui lòng nhập lại mật khẩu!'),
  })

  const onFinish = async (
    values: FieldType,
    { resetForm }: { resetForm: () => void }
  ) => {
    try {
      await register({
        email: values.email,
        password: values.password,
        name: values.name,
      }).unwrap()
      notification.success({
        message: 'Đăng ký thành công',
        description: 'Vui lòng kiểm tra hộp mail để xác thực tài khoản',
      })
      resetForm()
    } catch (error: any) {
      if (error?.status === 400) {
        notification.error({
          message: 'Đăng ký thất bại',
          description: error.data.message,
        })
      } else {
        notification.error({
          message: 'Đăng ký thất bại',
          description: 'Đã có lỗi xảy ra, vui lòng thử lại sau',
        })
      }
    }
  }

  return (
    <Formik
      initialValues={initialValues}
      validationSchema={validationSchema}
      onSubmit={onFinish}
    >
      {({ handleSubmit, errors, touched }) => (
        <AntdForm
          style={{
            width: 'auto',
            padding: 24,
            background: '#fff',
            borderRadius: 8,
            boxShadow: '0px 4px 10px rgba(0,0,0,0.1)',
          }}
          onFinish={handleSubmit}
        >
          {/* Email */}
          <AntdForm.Item
            validateStatus={errors.email && touched.email ? 'error' : ''}
            help={touched.email && errors.email}
            required
          >
            <Field as={Input} name='email' placeholder='Nhập email' />
          </AntdForm.Item>

          {/* Tên người dùng */}
          <AntdForm.Item
            validateStatus={errors.name && touched.name ? 'error' : ''}
            help={touched.name && errors.name}
            required
          >
            <Field as={Input} name='name' placeholder='Nhập tên người dùng' />
          </AntdForm.Item>

          {/* Mật khẩu */}
          <AntdForm.Item
            validateStatus={errors.password && touched.password ? 'error' : ''}
            help={touched.password && errors.password}
            required
          >
            <Field
              as={Input.Password}
              name='password'
              placeholder='Nhập mật khẩu'
            />
          </AntdForm.Item>

          <AntdForm.Item
            validateStatus={
              errors.retypePassword && touched.retypePassword ? 'error' : ''
            }
            help={touched.retypePassword && errors.retypePassword}
            required
          >
            <Field
              as={Input.Password}
              name='retypePassword'
              placeholder='Nhập mật khẩu'
            />
          </AntdForm.Item>

          {/* Button Submit */}
          <AntdForm.Item>
            <AntdForm.Item>
              <div
                style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                }}
              >
                <div>
                  <Button type='link' onClick={() => navigate('/login')}>
                    Đã có tài khoản? Đăng nhập ngay
                  </Button>
                </div>
                <div>
                  <Button type='primary' htmlType='submit' loading={isLoading}>
                    Đăng Ký
                  </Button>
                </div>
              </div>
            </AntdForm.Item>
          </AntdForm.Item>
        </AntdForm>
      )}
    </Formik>
  )
}
