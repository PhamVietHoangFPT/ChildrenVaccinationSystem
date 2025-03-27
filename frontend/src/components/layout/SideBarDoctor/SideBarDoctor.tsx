import React, { useState, useMemo, useEffect } from 'react'
import {
  LogoutOutlined,
  SmileOutlined,
} from '@ant-design/icons'
import { MenuProps, Layout } from 'antd'
import { Menu } from 'antd'
import { useNavigate, useLocation } from 'react-router-dom'
import Cookies from 'js-cookie'

const { Sider } = Layout

type MenuItem = Required<MenuProps>['items'][number]

// Define the shape of your custom menu items
interface CustomMenuItem {
  key: string
  label: string
  icon?: React.ReactNode
  url?: string
  children?: CustomMenuItem[]
  danger?: boolean
}

const SideBarDoctor: React.FC = () => {
  const navigate = useNavigate()
  const location = useLocation()

  const [current, setCurrent] = useState(() => {
    const path = location.pathname.split('/')[1] || 'sub1'
    return path
  })

  useEffect(() => {
    const path = location.pathname.split('/')[1] || 'sub1'
    setCurrent(path)
  }, [location.pathname])

  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null

  // Define menu items with useMemo for performance
  const items = useMemo((): CustomMenuItem[] => {
    return [
      {
        key: 'sub0',
        label: `Xin chào, ${userData?.Name}`,
        icon: <SmileOutlined />,
      },
      {
        key: 'sub5',
        label: 'Đăng xuất',
        icon: <LogoutOutlined />,
        url: '/logout',
        danger: true,
      },
    ]
  }, [])

  // Handle menu clicks
  const onClick: MenuProps['onClick'] = (e) => {
    setCurrent(e.key)
    const flattenItems = (items: CustomMenuItem[]): CustomMenuItem[] => {
      return items.reduce((acc, item) => {
        acc.push(item)
        if (item.children) {
          acc.push(...flattenItems(item.children))
        }
        return acc
      }, [] as CustomMenuItem[])
    }
    const allItems = flattenItems(items)
    const item = allItems.find((i) => i.key === e.key)
    if (item?.url) {
      if (item.url === '/logout') {
        Cookies.remove('userData')
        Cookies.remove('userToken')
        navigate('/login')
      } else {
        navigate(item.url)
      }
    }
  }

  return (
    <Sider
      width={256}
      style={{
        height: '100vh',
        left: 0,
        top: 0,
        overflowY: 'auto',
        background: '#001529',
      }}
    >
      <Menu
        onClick={onClick}
        style={{
          width: '100%',
          height: '100%',
          borderRight: 0,
          maxHeight: '100vh',
          overflowY: 'auto', // Allow scrolling if content overflows
        }}
        selectedKeys={[current]}
        defaultOpenKeys={['sub1']}
        mode='inline'
        items={items as MenuItem[]}
      ></Menu>
    </Sider>
  )
}

export default SideBarDoctor
