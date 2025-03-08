import { useState } from "react"
import { useLocation, useNavigate } from "react-router-dom"
import { Layout, Menu, Input, Avatar, Button, Tooltip, Divider } from "antd"
import {
  SearchOutlined,
  UserOutlined,
  LogoutOutlined,
  MenuFoldOutlined,
  MenuUnfoldOutlined,
  HomeOutlined,
  // CalendarOutlined,
  TeamOutlined,
  // ExperimentOutlined,
  MedicineBoxOutlined,
  // FileTextOutlined,
  // BarChartOutlined,
  // SettingOutlined,
} from "@ant-design/icons"

const { Sider } = Layout
const { Search } = Input

export const SideBar = () => {
  const location = useLocation()
  const navigate = useNavigate()
  const [collapsed, setCollapsed] = useState(false)

  // Get the current selected keys based on the pathname
  const getSelectedKeys = () => {
    const pathname = location.pathname
    if (pathname === "/manager") return ["manager"]

    // Check if pathname includes any of these paths
    const paths = ["appointments", "patients", "inventory", "vaccinations", "reports", "documents", "settings"]

    for (const path of paths) {
      if (pathname.includes(path)) {
        // If it's a sub-path, return both parent and child keys
        const segments = pathname.split("/").filter(Boolean)
        if (segments.length > 1) {
          return [path, pathname.substring(1)] // Remove leading slash
        }
        return [path]
      }
    }

    return []
  }

  // Define the menu items
  const items = [
    {
      key: "manager/staff",
      icon: <HomeOutlined />,
      label: "Manage Staff",
      onClick: () => navigate("/manager/staff"),
    },
    {
      key: "manager/view",
      icon: <TeamOutlined />,
      label: "View all customers",
      onClick: () => navigate("/manager/view"),
    },
    {
      key: "manager/vaccine",
      icon: <MedicineBoxOutlined />,
      label: "Manage Vaccines",
      onClick: () => navigate("/manager/vaccine"),
    },
    // {
    //   key: "manager/view",
    //   icon: <CalendarOutlined />,
    //   label: "View all customers",
    //   children: [
    //     {
    //       key: "appointments/schedule",
    //       label: "Schedule",
    //       onClick: () => navigate("/appointments/schedule"),
    //     },
    //     {
    //       key: "appointments/calendar",
    //       label: "Calendar View",
    //       onClick: () => navigate("/appointments/calendar"),
    //     },
    //   ],
    // },
    // {
    //   key: "patients",
    //   icon: <TeamOutlined />,
    //   label: "Patients",
    //   children: [
    //     {
    //       key: "patients/all",
    //       label: "All Patients",
    //       onClick: () => navigate("/patients/all"),
    //     },
    //     {
    //       key: "patients/register",
    //       label: "Registration",
    //       onClick: () => navigate("/patients/register"),
    //     },
    //     {
    //       key: "patients/records",
    //       label: "Vaccination Records",
    //       onClick: () => navigate("/patients/records"),
    //     },
    //   ],
    // },
    // {
    //   key: "inventory",
    //   icon: <ExperimentOutlined />,
    //   label: "Vaccine Inventory",
    //   children: [
    //     {
    //       key: "inventory/stock",
    //       label: "Stock Status",
    //       onClick: () => navigate("/inventory/stock"),
    //     },
    //     {
    //       key: "inventory/orders",
    //       label: "Manage Orders",
    //       onClick: () => navigate("/inventory/orders"),
    //     },
    //   ],
    // },
    // {
    //   key: "vaccinations",
    //   icon: <MedicineBoxOutlined />,
    //   label: "Vaccinations",
    //   children: [
    //     {
    //       key: "vaccinations/administer",
    //       label: "Administer Vaccine",
    //       onClick: () => navigate("/vaccinations/administer"),
    //     },
    //     {
    //       key: "vaccinations/history",
    //       label: "Vaccination History",
    //       onClick: () => navigate("/vaccinations/history"),
    //     },
    //   ],
    // },
    // {
    //   key: "reports",
    //   icon: <BarChartOutlined />,
    //   label: "Reports",
    //   children: [
    //     {
    //       key: "reports/analytics",
    //       label: "Analytics",
    //       onClick: () => navigate("/reports/analytics"),
    //     },
    //     {
    //       key: "reports/daily",
    //       label: "Daily Summary",
    //       onClick: () => navigate("/reports/daily"),
    //     },
    //     {
    //       key: "reports/trends",
    //       label: "Vaccination Trends",
    //       onClick: () => navigate("/reports/trends"),
    //     },
    //   ],
    // },
    // {
    //   key: "documents",
    //   icon: <FileTextOutlined />,
    //   label: "Documents",
    //   onClick: () => navigate("/documents"),
    // },
    // {
    //   key: "settings",
    //   icon: <SettingOutlined />,
    //   label: "Settings",
    //   onClick: () => navigate("/settings"),
    // },
  ]

  return (
    <Sider
      width={250}
      collapsible
      collapsed={collapsed}
      onCollapse={setCollapsed}
      trigger={null}
      theme="light"
      style={{
        boxShadow: "0 1px 3px rgba(0,0,0,0.1)",
        height: "100vh",
        position: "sticky",
        top: 0,
        left: 0,
      }}
    >
      {/* Logo and Title */}
      <div
        style={{
          display: "flex",
          alignItems: "center",
          padding: "16px",
          justifyContent: collapsed ? "center" : "space-between",
          borderBottom: "1px solid #f0f0f0",
        }}
      >
        <div style={{ display: "flex", alignItems: "center" }}>
          <MedicineBoxOutlined style={{ color: "#1890ff", fontSize: 20 }} />
          {!collapsed && <span style={{ marginLeft: 12, fontWeight: 600 }}>VacciTrack</span>}
        </div>
        {!collapsed && (
          <Button type="text" icon={<MenuFoldOutlined />} onClick={() => setCollapsed(true)} size="small" />
        )}
        {collapsed && (
          <Button
            type="text"
            icon={<MenuUnfoldOutlined />}
            onClick={() => setCollapsed(false)}
            size="small"
            style={{ marginTop: 16 }}
          />
        )}
      </div>

      {/* Search */}
      {!collapsed && (
        <div style={{ padding: "12px 16px" }}>
          <Search placeholder="Search..." allowClear size="middle" prefix={<SearchOutlined />} />
        </div>
      )}

      {/* Navigation Menu */}
      <Menu
        mode="inline"
        selectedKeys={getSelectedKeys()}
        defaultOpenKeys={getSelectedKeys().length > 0 ? [getSelectedKeys()[0]] : []}
        style={{ borderRight: 0 }}
        items={items}
      />

      {/* User Profile */}
      <div
        style={{
          position: "absolute",
          bottom: 0,
          width: "100%",
          padding: "16px",
          borderTop: "1px solid #f0f0f0",
          backgroundColor: "#fff",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            marginBottom: collapsed ? 0 : 12,
          }}
        >
          <Avatar icon={<UserOutlined />} />
          {!collapsed && (
            <div style={{ marginLeft: 12 }}>
              <div style={{ fontWeight: 500, fontSize: 14 }}>Admin User</div>
              <div style={{ fontSize: 12, color: "rgba(0, 0, 0, 0.45)" }}>admin@vaccitrack.com</div>
            </div>
          )}
        </div>
        {!collapsed && <Divider style={{ margin: "12px 0" }} />}
        <Tooltip title={collapsed ? "Logout" : ""} placement="right">
          <Button
            type="primary"
            danger
            icon={<LogoutOutlined />}
            style={{ width: collapsed ? "100%" : "100%" }}
            size={collapsed ? "middle" : "middle"}
          >
            {!collapsed && "Logout"}
          </Button>
        </Tooltip>
      </div>
    </Sider>
  )
}

