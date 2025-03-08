import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'

const { Content } = Layout

function LoginRegisterLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
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

export default LoginRegisterLayout
