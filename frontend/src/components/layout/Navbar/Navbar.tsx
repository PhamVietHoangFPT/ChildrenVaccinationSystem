import React, { useState, useMemo, useEffect } from 'react'
import {
  HomeOutlined,
  LoginOutlined,
  UserOutlined,
  LogoutOutlined,

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

  // ✅ Luôn tạo một danh sách mới, tránh push vào biến `items` cũ
  const items = useMemo(() => {
    return [
      {
        key: 'home',
        icon: <HomeOutlined />,
        label: 'Trang chủ',
        url: '/',
      },
      {
        key: userData ? 'profile' : 'login',
        icon: userData ? <UserOutlined /> : <LoginOutlined />,
        label: userData ? 'Hồ sơ' : 'Đăng nhập / Đăng ký',
        url: userData ? '/profile' : '/login',
      },
    ]
  }, [userData]) // items chỉ thay đổi khi userData thay đổi

  const onClick: MenuProps['onClick'] = (e) => {
    setCurrent(e.key)
    const item = items.find((item) => item.key === e.key)
    if (item) {
      navigate(item.url)
    }
  }

  return (
    <Menu onClick={onClick} selectedKeys={[current]} mode='horizontal'>
      {items.map((item) => (
        <Menu.Item key={item.key} icon={item.icon}>
          {item.label}
        </Menu.Item>
      ))}
      {userData && (
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

      )}
    </Menu>
  )
}

export default Navbar
