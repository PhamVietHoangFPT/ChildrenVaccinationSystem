import { Outlet, useNavigate, Link } from 'react-router-dom'
import { Avatar, Dropdown, Layout, Menu, Typography } from 'antd'
import {
  LogoutOutlined,
  UserOutlined,
} from '@ant-design/icons'
import { SideBarVaccinator } from './SideBarVaccinator/SideBarVaccinator'
import Cookies from 'js-cookie'
import { useEffect } from 'react'

const { Header, Content, Footer } = Layout
const { Title, Text } = Typography

export const VaccinatorLayout = () => {
  const navigate = useNavigate()

  useEffect(() => {
    // Get userData from cookies and parse it
    const userDataString = Cookies.get('userData')

    if (!userDataString) {
      navigate('/')
      return
    }

    let userData
    try {
      userData = JSON.parse(userDataString)
    } catch (error) {
      console.error('Failed to parse userData from cookies:', error)
      navigate('/')
      return
    }

    if (userData.Role !== 'Vaccinator') {
      navigate('/')
    }
  }, [navigate])

  const userMenu = (
    <Menu>
      <Menu.Item
        key='logout'
        icon={<LogoutOutlined />}
        onClick={() => {
          Cookies.remove('userData')
          Cookies.remove('userToken')
          navigate('/')
        }}
      >
        Logout
      </Menu.Item>
    </Menu>
  )

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <SideBarVaccinator />
      <Layout>
        <Header
          style={{
            background: '#fff',
            padding: '0 24px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            boxShadow: '0 1px 3px rgba(0,0,0,0.05)',
            zIndex: 1,
          }}
        >
          <Title level={4} style={{ margin: 0 }}>
            Vaccination Vaccinator 
          </Title>

          <div
            style={{
              display: 'flex',
              justifyContent: 'flex-end',
              alignItems: 'center',
              gap: '24px',
            }}
          >
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '16px',
                marginRight: '16px',
              }}
            >
              <Link
                to='/vaccinator/dashboard' 
                style={{
                  color: '#333',
                  textDecoration: 'none',
                  fontSize: '16px',
                  fontWeight: '500',
                  padding: '8px 10px',
                  borderRadius: '4px',
                  transition: 'all 0.3s',
                }}
              >
                Dashboard
              </Link>
              <Link
                to='/vaccinator/appointments' 
                style={{
                  color: '#333',
                  textDecoration: 'none',
                  fontSize: '16px',
                  fontWeight: '500',
                  padding: '8px 10px',
                  borderRadius: '4px',
                  transition: 'all 0.3s',
                }}
              >
                Appointments
              </Link>
              <Link
                to='/vaccinator/vaccines' 
                style={{
                  color: '#333',
                  textDecoration: 'none',
                  fontSize: '16px',
                  fontWeight: '500',
                  padding: '8px 10px',
                  borderRadius: '4px',
                  transition: 'all 0.3s',
                }}
              >
                Vaccines
              </Link>
            </div>

            <Dropdown overlay={userMenu} placement='bottomRight'>
              <Avatar
                size='large'
                icon={<UserOutlined />}
                style={{ cursor: 'pointer', backgroundColor: '#87d068' }}
              />
            </Dropdown>
          </div>
        </Header>

        <Content style={{ margin: '24px' }}>
          <div
            style={{
              padding: 24,
              background: '#fff',
              borderRadius: 6,
              minHeight: 280,
            }}
          >
            <Outlet />
          </div>
        </Content>

        <Footer style={{ textAlign: 'center', padding: '12px 50px' }}>
          <Text type='secondary'>
            © 2025 VacciTrack Vaccinator Portal. All rights reserved.
          </Text>
        </Footer>
      </Layout>
    </Layout>
  )
}
