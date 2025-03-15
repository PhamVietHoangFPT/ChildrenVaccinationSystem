import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import Navbar from './Navbar/Navbar'
import AppHeader from './Header/Header'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
const { Content } = Layout
import { useEffect } from 'react'

function MainLayout() {
  const navigate = useNavigate()

  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null

  useEffect(() => {
    if (userData) {
      if (userData.Role === 'Customer') {
        if (!userData?.PhoneNumber || !userData?.Address) {
          navigate('/forceUpdate')
        }
      }
    }
  }, [userData, navigate])

  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
      <AppHeader />
      <Navbar />
      <Content
        style={{
          padding: '50px',
          paddingTop: '30px',
          overflow: 'initial',
          width: '100vw',
        }}
      >
        <Outlet />
      </Content>
    </Layout>
  )
}

export default MainLayout
