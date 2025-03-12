// import { useState } from "react"
import { Outlet } from 'react-router-dom'
// import { Layout, Typography, Space, Badge, Avatar, Dropdown, Button, Menu } from "antd"
import { Layout, Typography } from 'antd'
import {} from // BellOutlined,
// QuestionCircleOutlined,
// UserOutlined,
// SettingOutlined,
// LogoutOutlined,
// DownOutlined,
// WarningOutlined,
// InfoCircleOutlined,
'@ant-design/icons'
import { SideBar } from './SideBar/SideBarManager'

const { Header, Content, Footer } = Layout
const { Title, Text } = Typography

export const ManagerLayout = () => {
  // const [notifications] = useState([
  //   {
  //     id: 1,
  //     title: "Vaccine stock running low",
  //     time: "10 minutes ago",
  //     type: "warning",
  //     icon: <WarningOutlined style={{ color: "#faad14" }} />,
  //   },
  //   {
  //     id: 2,
  //     title: "New appointment scheduled",
  //     time: "1 hour ago",
  //     type: "info",
  //     icon: <InfoCircleOutlined style={{ color: "#1890ff" }} />,
  //   },
  // ])

  // User dropdown menu
  // const userMenu = (
  //   <Menu
  //     items={[
  //       {
  //         key: "1",
  //         label: "Profile",
  //         icon: <UserOutlined />,
  //       },
  //       {
  //         key: "2",
  //         label: "Settings",
  //         icon: <SettingOutlined />,
  //       },
  //       {
  //         type: "divider",
  //       },
  //       {
  //         key: "3",
  //         label: "Logout",
  //         icon: <LogoutOutlined />,
  //         danger: true,
  //       },
  //     ]}
  //   />
  // )

  // Notifications dropdown menu
  // const notificationsMenu = (
  //   <Menu
  //     style={{ width: 320 }}
  //     items={[
  //       {
  //         key: "header",
  //         label: <Text strong>Notifications</Text>,
  //         disabled: true,
  //       },
  //       {
  //         type: "divider",
  //         style: { margin: "0" },
  //       },
  //       ...notifications.map((notification) => ({
  //         key: notification.id,
  //         label: (
  //           <div>
  //             <div style={{ display: "flex", alignItems: "flex-start" }}>
  //               <span style={{ marginRight: 8, marginTop: 2 }}>{notification.icon}</span>
  //               <div>
  //                 <Text>{notification.title}</Text>
  //                 <div>
  //                   <Text type="secondary" style={{ fontSize: 12 }}>
  //                     {notification.time}
  //                   </Text>
  //                 </div>
  //               </div>
  //             </div>
  //           </div>
  //         ),
  //       })),
  //       {
  //         type: "divider",
  //         style: { margin: "0" },
  //       },
  //       {
  //         key: "view-all",
  //         label: (
  //           <Text style={{ textAlign: "center", display: "block", color: "#1890ff" }}>View all notifications</Text>
  //         ),
  //       },
  //     ]}
  //   />
  // )

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <SideBar />
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
            Vaccination Manager
          </Title>

          {/* <Space size="large">
            <Dropdown overlay={notificationsMenu} trigger={["click"]} placement="bottomRight" arrow>
              <Badge count={notifications.length} size="small">
                <Button type="text" icon={<BellOutlined style={{ fontSize: 18 }} />} />
              </Badge>
            </Dropdown>

            <Button type="text" icon={<QuestionCircleOutlined style={{ fontSize: 18 }} />} /> */}

          {/* <Dropdown overlay={userMenu} trigger={["click"]} placement="bottomRight" arrow>
              <Space style={{ cursor: "pointer" }}>
                <Avatar icon={<UserOutlined />} />
                <DownOutlined style={{ fontSize: 12 }} />
              </Space>
            </Dropdown> */}
          {/* </Space> */}
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
            © 2025 VacciTrack Admin Portal. All rights reserved.
          </Text>
        </Footer>
      </Layout>
    </Layout>
  )
}
