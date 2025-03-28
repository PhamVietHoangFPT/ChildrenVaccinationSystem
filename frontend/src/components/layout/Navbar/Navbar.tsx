import React, { useState, useMemo, useEffect } from 'react'
import {
  HomeOutlined,
  LoginOutlined,
  UserOutlined,
  LogoutOutlined,
  CalendarOutlined,
} from '@ant-design/icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faSyringe, faBlog } from '@fortawesome/free-solid-svg-icons'
import type { MenuProps } from 'antd'
import { Menu, Layout } from 'antd'
const { Header } = Layout
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
        key: 'vaccines',
        icon: <FontAwesomeIcon icon={faSyringe} />,
        label: 'Vắc xin',
        url: '/vaccines?pageNumber=1',
      },
      {
        key: 'appointments',
        icon: <CalendarOutlined />,
        label: 'Lịch hẹn',
        url: '/vaccine-registration',
      },
      {
        key: 'blogs',
        icon: <FontAwesomeIcon icon={faBlog} />,
        label: 'Cẩm nang',
        url: '/blogs',
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
      for (const item of items) {
        if (item.key === key) return item
        if (item.children) {
          const found: any = findItem(item.children, key)
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
    <Header style={{ background: '#fff' }}>
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
        {items.map((item) => (
          <Menu.Item key={item.key} icon={item.icon}>
            {item.label}
          </Menu.Item>
        ))}
        {userData && (
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
        )}
      </Menu>
    </Header>
  )
}

export default Navbar
