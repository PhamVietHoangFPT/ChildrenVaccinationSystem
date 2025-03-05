import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import Navbar from './Navbar/Navbar'

const { Content } = Layout

function MainLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
      <Navbar />
      <Content
        style={{
          margin: '24px',
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
