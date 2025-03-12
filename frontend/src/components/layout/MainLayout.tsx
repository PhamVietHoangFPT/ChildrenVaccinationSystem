import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import Navbar from './Navbar/Navbar'
import AppHeader from './Header/Header'

const { Content } = Layout

function MainLayout() {
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
