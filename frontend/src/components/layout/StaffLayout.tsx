import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import SideBarStaff from './SiderBarStaff/SideBarStaff'

const { Content } = Layout

function StaffLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
      <SideBarStaff></SideBarStaff>
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

export default StaffLayout
