import { Layout, Card, Typography, Row, Col, Button } from 'antd'
import { LoginForm } from '../../components/Authentication/LoginForm'
import Logo from '../../assets/Logo.png'
import { useNavigate } from 'react-router-dom'
import Cookies from 'js-cookie'
import { useEffect } from 'react'

const { Content } = Layout
const { Title } = Typography

export default function Login() {
  const navigate = useNavigate()
  useEffect(() => {
    const userData = Cookies.get('userData')
      ? JSON.parse(Cookies.get('userData') as string)
      : null
    if (userData) {
      navigate('/')
    }
  }, [navigate])
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
              style={{ maxWidth: '100%', height: 'auto', borderRadius: '12px' }}
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
                Đăng nhập
              </Title>
              <LoginForm />
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
                <Button
                  type='link'
                  onClick={() => navigate('/forgot-password?token=')}
                  style={{ padding: 0, margin: 0 }}
                >
                  Quên mật khẩu?
                </Button>
              </div>
            </Card>
          </Col>
        </Row>
      </Content>
    </Layout>
  )
}
