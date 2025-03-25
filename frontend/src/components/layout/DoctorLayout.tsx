import { Outlet, useNavigate } from 'react-router-dom'
import { Layout, Typography } from 'antd'
import { } from '@ant-design/icons'
import Cookies from 'js-cookie'
import { useEffect } from 'react'
import SideBarDoctor from './SideBarDoctor/SideBarDoctor'
  
const { Header, Content, Footer } = Layout
const { Text } = Typography

export const DoctorLayout = () => {
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

    if (userData.Role !== 'Doctor') {
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
      <SideBarDoctor />
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
            © 2025 VacciTrack Doctor Portal. All rights reserved.
          </Text>
        </Footer>
      </Layout>
    </Layout>
  )
}
