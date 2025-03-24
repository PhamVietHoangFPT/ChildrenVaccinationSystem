import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
const { Content } = Layout

function PaymentLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
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

export default PaymentLayout
