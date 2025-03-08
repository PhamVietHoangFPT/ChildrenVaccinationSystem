import React, { useState, useMemo, useEffect } from 'react'
import {
  HomeOutlined,
  LoginOutlined,
  UserOutlined,
  LogoutOutlined,
SettingOutlined,
  AppstoreOutlined,
  InfoCircleOutlined,
} from '@ant-design/icons'
import type { MenuProps } from 'antd'
import { Menu } from 'antd'
import { useNavigate, useLocation } from 'react-router-dom'
import Cookies from 'js-cookie'

const Navbar: React.FC = () => {
  const location = useLocation()
  const [current, setCurrent] = useState(() => {
    const path = location.pathname.split('/')[1] || 'home'
    return path
  })

  useEffect(() => {
    setCurrent(location.pathname.split('/')[1] || 'home')
  }, [location.pathname])

  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null
  const navigate = useNavigate()

  // ✅ Thêm menu con trong `items`
  const items = useMemo(() => {
    return [
      {
        key: 'home',
        icon: <HomeOutlined />,
        label: 'Trang chủ',
        url: '/',
      },
      {
        key: 'about',
        icon: <InfoCircleOutlined />,
        label: 'Về chúng tôi',
        children: [
          {
            key: 'about1',
            label: 'About us 1',
            url: '/abouts/abouts2',
          },
          {
            key: 'service2',
            label: 'About us 2',
            url: '/abouts/abouts2',
          },
        ],
      },
      {
        key: 'blogs',
        icon: <AppstoreOutlined />,
        label: 'Cẩm nang',
        children: [
          {
            key: 'service1',
            label: 'Dịch vụ 1',
            url: '/services/service1',
          },
          {
            key: 'service2',
            label: 'Dịch vụ 2',
            url: '/services/service2',
          },
        ],
      },
      {
        key: 'settings',
        icon: <SettingOutlined />,
        label: 'Cài đặt',
        children: [
          {
            key: 'profile',
            label: 'Hồ sơ cá nhân',
            url: '/settings/profile',
          },
          {
            key: 'security',
            label: 'Bảo mật',
            url: '/settings/security',
          },
        ],
      },
      {
        key: userData ? 'profile' : 'login',
        icon: userData ? <UserOutlined /> : <LoginOutlined />,
        label: userData ? 'Hồ sơ' : 'Đăng nhập / Đăng ký',
        url: userData ? '/profile' : '/login',
      },
    ]
  }, [userData])

  const onClick: MenuProps['onClick'] = (e) => {
    setCurrent(e.key)
    const findItem = (items: any[], key: string) => {
      for (let item of items) {
        if (item.key === key) return item
        if (item.children) {
          const found = findItem(item.children, key)
          if (found) return found
        }
      }
      return null
    }

    const item = findItem(items, e.key)
    if (item?.url) {
      navigate(item.url)
    }
  }

  return (
    <Menu
      onClick={onClick}
      selectedKeys={[current]}
      mode='horizontal'
      style={{
        display: 'flex',
        justifyContent: 'center',
        borderBottom: '1px solid #f0f0f0',
      }}
    >
      {items.map((item) =>
        item.children ? (
          <Menu.SubMenu key={item.key} icon={item.icon} title={item.label}>
            {item.children.map((child) => (
              <Menu.Item key={child.key}>{child.label}</Menu.Item>
            ))}
          </Menu.SubMenu>
        ) : (
          <Menu.Item key={item.key} icon={item.icon}>
            {item.label}
          </Menu.Item>
        )
      )}
      {userData && (
        <div style={{ display: 'flex', justifyContent: 'space-between', width: '100%' }}>
          <Menu.Item
            key='welcome'
          >
            Welcome, {userData.Name}
          </Menu.Item>
          <div>
          <Menu.Item key="welcome">Welcome, {userData.Name}</Menu.Item>
          <Menu.Item
              key='logout'
              icon={<LogoutOutlined />}
              onClick={() => {
                Cookies.remove('userData')
                Cookies.remove('userToken')
                navigate('/login')
              }}
            >
              Đăng xuất
            </Menu.Item>
        </div>

        </div>

      )}
    </Menu>
  )
}

export default Navbar
