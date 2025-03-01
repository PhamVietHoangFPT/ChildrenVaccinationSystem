import MainLayout from '../components/layout/MainLayout'
import Homepage from '../Pages/Home/Home'
import Login from '../Pages/Login/Login'
import TestPage from '../Pages/TestPage/TestPage'
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
        path: '/testPage',
        component: TestPage,
        role: ['Staff'],
      }
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
