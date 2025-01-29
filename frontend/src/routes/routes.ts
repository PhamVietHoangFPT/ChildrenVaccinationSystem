import React from 'react'
import MainLayout from '../components/layout/MainLayout'
import Homepage from '../components/Home/Homepage'

interface Route {
  path: string
  component: React.ComponentType
  exact?: boolean
  role?: string[]
}

interface LayoutRoute {
  layout: React.ComponentType
  data: Route[]
}

const routes: LayoutRoute[] = [
  {
    layout: MainLayout,
    data: [
      {
        path: '/',
        component: Homepage,
        exact: true,
      },
      // {
      //   path: '/company',
      //   component: Company,
      // },
    ],
  },
  // {
  //   layout: SimpleLayout,
  //   data: [
  //     {
  //       path: '/login',
  //       component: LoginPage,
  //     },
  //     {
  //       path: '/register',
  //       component: RegisterPage,
  //     },
  //   ],
  // },
  // {
  //   layout: AdminLayout,
  //   data: [
  //     {
  //       path: '/admin',
  //       component: Admin,
  //       role: ['admin'],
  //     },

  //   ],
  // },
]

export default routes
