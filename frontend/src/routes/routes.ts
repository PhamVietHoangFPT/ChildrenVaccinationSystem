import MainLayout from '../components/layout/MainLayout'
import StaffLayout from '../components/layout/StaffLayout'
import Homepage from '../Pages/Home/Home'
import Login from '../Pages/Login/Login'
import Register from '../Pages/Register/Register'
import StaffHomePage from '../Pages/Staff/StaffDefault/StaffHomePage'
import { LayoutRoute } from '../types/routes'

const routes: LayoutRoute[] = [
  {
    layout: MainLayout,
    data: [
      {
        path: '/',
        component: Homepage,
        exact: true,
      },
      {
        path: '/login',
        component: Login,
      },
      {
        path: '/register',
        component: Register,
      },
    ],

  },
  {
    layout: StaffLayout,
    data: [
      {
        path: '/staff',
        component: StaffHomePage,
        exact: true,
        role: ['Staff']
      },
      {
        path: '/login',
        component: Login,
      },
      {
        path: '/register',
        component: Register,
      },
    ]
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
