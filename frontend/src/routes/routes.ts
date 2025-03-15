import LoginRegisterLayout from '../components/layout/LoginRegisterLayout'
import MainLayout from '../components/layout/MainLayout'
import { ManagerLayout } from '../components/layout/ManagerLayout'
import StaffLayout from '../components/layout/StaffLayout'
import ManagerCustomerList from '../Pages/Home/Customer/CustomerListManager'
import Homepage from '../Pages/Home/Home'
import ManagerStaffList from '../Pages/Home/Staff/StaffListManager'
import ManagerVaccineList from '../Pages/Home/Vaccine/VaccineListManager'
import Login from '../Pages/Login/Login'
import ManagerHomePage from '../Pages/Manager/ManagerHomePage'
import ProfilePage from '../Pages/Profile/ProfilePage'
import Register from '../Pages/Register/Register'
import StaffHomePage from '../Pages/Staff/StaffDefault/StaffHomePage'
import { LayoutRoute } from '../types/routes'
import AllVaccinesCustomer from '../Pages/Vaccines/AllVaccinesCustomer'
import VaccineDetail from '../Pages/Home/VaccineDetailManager/VaccineDetailManager'
import CreateVaccine from '../Pages/Home/CreateVaccineManager/CreateVaccineManager'
import { DoctorLayout } from '../components/layout/DoctorLayout'
import DoctorHomePage from '../Pages/Doctor/DoctorHomePage'
import CustomerListDoctor from '../Pages/Home/CustomerListDoctor/CustomerListDoctor'

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
        path: '/profile',
        component: ProfilePage,
      },
      {
        path: '/vaccines',
        component: AllVaccinesCustomer,
      },
      {
        path: '/vaccines/:vaccineID',
        component: VaccineDetailsCustomer,
      },
      {
        path: '/vaccineRegistration',
        component: VaccineRegistrationCustomer,
      },
      {
        path: '/forceUpdate',
        component: ForceUpdateAccount,
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
        role: ['Staff'],
      },
    ],
  },
  {
    layout: LoginRegisterLayout,
    data: [
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
    layout: ManagerLayout,
    data: [
      {
        path: '/manager',
        component: ManagerHomePage,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/staff',
        component: ManagerStaffList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/view',
        component: ManagerCustomerList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/vaccine',
        component: ManagerVaccineList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/vaccine/:id',
        component: VaccineDetail,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/vaccine/create',
        component: CreateVaccine,
        exact: true,
        role: ['Manager'],
      },
    ],
  },
    {
      layout: DoctorLayout,
      data: [
        {
          path: '/doctor',
          component: DoctorHomePage,
          exact: true,
          role: ['Doctor'],
        },
        {
          path: '/doctor/view',
          component: CustomerListDoctor,
          exact: true,
          role: ['Doctor'],
        },
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
