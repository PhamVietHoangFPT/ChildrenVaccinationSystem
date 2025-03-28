import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import SideBarDoctor from './SideBarDoctor/SideBarDoctor'

const { Content } = Layout

function DoctorLayout() {
  return (
    <Layout
      style={{
        minHeight: '100vh',
        overflow: 'hidden',
      }}
    >
      <SideBarDoctor></SideBarDoctor>
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

export default DoctorLayout
