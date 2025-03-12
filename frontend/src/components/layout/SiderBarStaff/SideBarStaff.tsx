import React, { useState, useMemo, useEffect } from 'react'
import {
  MailOutlined,
  LogoutOutlined,
  CheckCircleOutlined,
  CloseCircleOutlined,
  FormOutlined,
  CalendarOutlined,
  SearchOutlined,
  TeamOutlined,
  UserAddOutlined,
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
}

const SideBarStaff: React.FC = () => {
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

  // Define menu items with useMemo for performance
  const items = useMemo((): CustomMenuItem[] => {
    return [
      {
        key: 'sub1',
        label: 'Manage Record',
        icon: <MailOutlined />,
        children: [
          {
            key: '1',
            label: 'Confirm Registration',
            icon: <CheckCircleOutlined />,
            url: '/staff',
          },
          {
            key: '2',
            label: 'Cancel Registration',
            icon: <CloseCircleOutlined />,
            url: '/option6',
          },
          {
            key: '3',
            label: 'Register Vaccination ',
            icon: <FormOutlined />,
            url: '/staff',
          },
        ],
      },
      {
        key: 'sub2',
        label: 'Customer`s Profile',
        icon: <TeamOutlined />,
        children: [
          {
            key: '4',
            label: 'Update Customer Profile',
            icon: <FormOutlined />,
            url: '/option5',
          },
          {
            key: 'sub3',
            label: 'Children`s Profile',
            icon: <SmileOutlined />,
            children: [
              {
                key: '5',
                label: 'Update Children',
                icon: <FormOutlined />,
                url: '',
              },
              {
                key: '6',
                label: 'Add Children',
                icon: <UserAddOutlined />,
                url: '',
              },
            ],
          },
        ],
      },
      {
        key: 'sub4',
        label: 'Vaccination Schedule',
        icon: <CalendarOutlined />,
        children: [
          {
            key: '7',
            label: 'View Schedules',
            icon: <SearchOutlined />,
            url: '/option5',
          },
          {
            key: '8',
            label: 'Cancel Schedules',
            icon: <CloseCircleOutlined />,
            url: '/option5',
          },
        ],
      },
      {
        key: 'sub5',
        label: 'Log Out',
        icon: <LogoutOutlined />,
        url: '/logout',
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

export default SideBarStaff
