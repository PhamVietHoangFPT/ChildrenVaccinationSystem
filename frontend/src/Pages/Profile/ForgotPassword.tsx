import {
  Button,
  Card,
  Col,
  Layout,
  Row,
  Typography,
  Form,
  Input,
  message,
} from 'antd'
const { Title } = Typography
import {
  useForgetPassowrdMutation,
  useResetPasswordMutation,
} from '../../features/auth/authApi'
import { Content } from 'antd/es/layout/layout'
import { useSearchParams } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'
import Logo from '../../assets/Logo.png'

export default function ForgotPassword() {
  const [form] = Form.useForm()
  const [searchParams] = useSearchParams()
  const [forgetPassword, { isLoading }] = useForgetPassowrdMutation()
  const [resetPassword, { isLoading: isResetPasswordLoading }] =
    useResetPasswordMutation()
  const navigate = useNavigate()

  const handleSubmit = async (values: { email: string }) => {
    try {
      // Gửi yêu cầu quên mật khẩu đến API
      const response = await forgetPassword({ email: values.email })
      message.success(response.data.message)
      let countdown = 5
      const interval = setInterval(() => {
        message.info(`Chuyển hướng sau ${countdown} giây`, 0.5)
        countdown -= 1
        if (countdown < 0) {
          clearInterval(interval)
          navigate('/')
        }
      }, 1000)
      // Xử lý phản hồi từ API nếu cần thiết
    } catch (error: any) {
      console.error(error.error.message)
    }
  }

  const handleSubmitPassword = async (values: {
    password: string
    confirmPassword: string
  }) => {
    try {
      // Gửi yêu cầu quên mật khẩu đến API
      const response = await resetPassword({
        newPassword: values.password,
        token: token as string,
      })
      message.success(response.data.message)
      let countdown = 5
      const interval = setInterval(() => {
        message.info(`Chuyển hướng sau ${countdown} giây`, 0.5)
        countdown -= 1
        if (countdown < 0) {
          clearInterval(interval)
          navigate('/login')
        }
      }, 1000)
      // Xử lý phản hồi từ API nếu cần thiết
    } catch (error: any) {
      console.error(error.error.message)
    }
  }
  const token = searchParams.get('token')
  if (token) {
    if (token.length > 0) {
      return (
        <Layout
          style={{
            minHeight: 'calc(100vh - 124px)',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
        >
          <Content
            style={{ width: '80%', maxWidth: '1200px', display: 'flex' }}
          >
            <Row gutter={[32, 32]} align='middle'>
              {/* Hình ảnh minh họa */}
              <Col xs={24} md={12} style={{ textAlign: 'center' }}>
                <img
                  src={Logo}
                  alt='Login'
                  style={{
                    maxWidth: '100%',
                    height: 'auto',
                    borderRadius: '12px',
                  }}
                />
              </Col>

              {/* Form đăng nhập */}
              <Col xs={24} md={12}>
                <Card
                  bordered={false}
                  style={{
                    boxShadow: '0 4px 10px rgba(0, 0, 0, 0.1)',
                    borderRadius: '12px',
                    padding: '24px',
                    maxWidth: '100%',
                    height: 'auto',
                  }}
                >
                  <Title
                    level={2}
                    style={{ textAlign: 'center', marginBottom: '24px' }}
                  >
                    Quên mật khẩu
                  </Title>

                  <div>
                    <Form
                      form={form}
                      layout='vertical'
                      onFinish={handleSubmitPassword}
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

                      {/* Trường mật khẩu */}
                      <Form.Item
                        name='password'
                        rules={[
                          {
                            required: true,
                            message: 'Vui lòng nhập mật khẩu mới',
                          },
                          {
                            min: 6,
                            message: 'Mật khẩu phải có ít nhất 6 ký tự',
                          },
                        ]}
                      >
                        <Input.Password placeholder='Nhập mật khẩu mới' />
                      </Form.Item>

                      <Form.Item
                        name='confirmPassword'
                        dependencies={['password']}
                        rules={[
                          {
                            required: true,
                            message: 'Vui lòng xác nhận mật khẩu mới',
                          },
                          ({ getFieldValue }) => ({
                            validator(_, value) {
                              if (
                                !value ||
                                getFieldValue('password') === value
                              ) {
                                return Promise.resolve()
                              }
                              return Promise.reject(
                                new Error('Mật khẩu xác nhận không khớp')
                              )
                            },
                          }),
                        ]}
                      >
                        <Input.Password placeholder='Xác nhận mật khẩu mới' />
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
                            <Button
                              type='primary'
                              htmlType='submit'
                              loading={isResetPasswordLoading}
                            >
                              Gửi yêu cầu
                            </Button>
                          </div>
                        </div>
                      </Form.Item>
                    </Form>
                  </div>
                  <div
                    style={{
                      textAlign: 'center',
                      display: 'flex',
                      gap: '8px',
                      justifyContent: 'space-between',
                      marginTop: '16px',
                    }}
                  >
                    <Button
                      type='link'
                      onClick={() => navigate('/')}
                      style={{ padding: 0, margin: 0 }}
                    >
                      Về lại trang chủ
                    </Button>
                  </div>
                </Card>
              </Col>
            </Row>
          </Content>
        </Layout>
      )
    }
  }
  return (
    <Layout
      style={{
        minHeight: 'calc(100vh - 124px)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      <Content style={{ width: '80%', maxWidth: '1200px', display: 'flex' }}>
        <Row gutter={[32, 32]} align='middle'>
          {/* Hình ảnh minh họa */}
          <Col xs={24} md={12} style={{ textAlign: 'center' }}>
            <img
              src={Logo}
              alt='Login'
              style={{
                maxWidth: '100%',
                height: 'auto',
                borderRadius: '12px',
              }}
            />
          </Col>

          {/* Form đăng nhập */}
          <Col xs={24} md={12}>
            <Card
              bordered={false}
              style={{
                boxShadow: '0 4px 10px rgba(0, 0, 0, 0.1)',
                borderRadius: '12px',
                padding: '24px',
                maxWidth: '100%',
                height: 'auto',
              }}
            >
              <Title
                level={2}
                style={{ textAlign: 'center', marginBottom: '24px' }}
              >
                Quên mật khẩu
              </Title>

              <div>
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
                  <Form.Item
                    name='email'
                    rules={[
                      { required: true, message: 'Vui lòng nhập mật khẩu' },
                      // { min: 6, message: 'Mật khẩu phải có ít nhất 6 ký tự' },
                    ]}
                  >
                    <Input placeholder='Nhập email' />
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
                        <Button
                          type='primary'
                          htmlType='submit'
                          loading={isLoading}
                        >
                          Gửi yêu cầu
                        </Button>
                      </div>
                    </div>
                  </Form.Item>
                </Form>
              </div>
              <div
                style={{
                  textAlign: 'center',
                  display: 'flex',
                  gap: '8px',
                  justifyContent: 'space-between',
                  marginTop: '16px',
                }}
              >
                <Button
                  type='link'
                  onClick={() => navigate('/')}
                  style={{ padding: 0, margin: 0 }}
                >
                  Về lại trang chủ
                </Button>
              </div>
            </Card>
          </Col>
        </Row>
      </Content>
    </Layout>
  )
}
