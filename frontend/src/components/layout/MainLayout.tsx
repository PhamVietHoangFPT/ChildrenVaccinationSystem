import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'

const { Content } = Layout

function MainLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
      <Content style={{ margin: '24px', overflow: 'initial' }}>
        <Outlet />
      </Content>
    </Layout>
  )
}

export default MainLayout
