import LoginRegisterLayout from '../components/layout/LoginRegisterLayout'
import MainLayout from '../components/layout/MainLayout'
import { ManagerLayout } from '../components/layout/ManagerLayout'
import StaffLayout from '../components/layout/StaffLayout'
import ManagerCustomerList from '../Pages/Home/Customer/CustomerListManager'
import Homepage from '../Pages/Home/Home'
import ManagerVaccineList from '../Pages/Home/VaccineManager/VaccineListManager'
import Login from '../Pages/Login/Login'
import ManagerHomePage from '../Pages/Manager/ManagerHomePage'
import ProfilePage from '../Pages/Profile/ProfilePage'
import Register from '../Pages/Register/Register'
import StaffHomePage from '../Pages/Staff/StaffDefault/StaffHomePage'
import { LayoutRoute } from '../types/routes'
import AllVaccinesCustomer from '../Pages/Vaccines/AllVaccinesCustomer'
import VaccineDetail from '../Pages/Home/VaccineManager/VaccineDetailManager'
import CreateVaccine from '../Pages/Home/VaccineManager/CreateVaccineManager'
import DoctorHomePage from '../Pages/Doctor/DoctorHomePage'
import VaccineDetailsCustomer from '../Pages/Vaccines/VaccineDetailsCustomer'
import VaccineRegistrationCustomer from '../Pages/Vaccines/VaccineRegistrationCustomer'
import ForceUpdateAccount from '../Pages/Register/ForgeUpdateRegister'
import ChildrenPage from '../Pages/Staff/ChildrenProfile/Children'
import CustomerDetail from '../Pages/Staff/CustomerProfile/CustomerDetail'
import VaccinatorHomePage from '../Pages/Vaccinator/VaccinatorHomePage'
import StaffVaccination from '../Pages/Staff/Vaccination/StaffVaccination'
import PaymentLayout from '../components/layout/PaymentLayout'
import PaymentSuccess from '../Pages/Payment/PaymentSuccess'
import PaymentFail from '../Pages/Payment/PaymentFail'
import ManagerPersonnelList from '../Pages/Home/PersonnelManager/PersonnelListManager'
import VaccinationsHistory from '../Pages/Vaccinations/VaccinationsHistory'
import RegiterVaccinationStaff from '../Pages/Staff/RegisterCustomer/registerVaccination'
import RegisterCustomer from '../Pages/Staff/RegisterCustomer/registerCustomer'
import DoctorLayout from '../components/layout/DoctorLayout'
import PersonnelDetailManager from '../Pages/Home/Personnel/PersonnelDetailManager'
import BlogDetail from '../Pages/Home/BlogManager/BlogDetailManager'
import ManagerBlogList from '../Pages/Home/BlogManager/BlogListManager'
import CreateBlog from '../Pages/Home/BlogManager/CreateBlogManager'

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
      {
        path: '/vaccinations-history',
        component: VaccinationsHistory,
      },
    ],
  },
  {
    layout: StaffLayout,
    data: [
      {
        path: '/staff/customer-account',
        component: StaffHomePage,
        exact: true,
        role: ['Staff'],
      },
      {
        path: '/staff/child-profile',
        component: ChildrenPage,
        exact: true,
        role: ['Staff'],
      },
      {
        path: '/staff/customer-account/:customerId',
        component: CustomerDetail,
        exact: true,
        role: ['Staff'],
      },
      {
        path: '/staff/customer-account/register',
        component: RegisterCustomer,
        exact: true,
        role: ['Staff'],
      },
      {
        path: '/staff/vaccination/vaccination-record',
        component: StaffVaccination,
        exact: true,
        role: ['Staff'],
      },
      {
        path: '/staff/vaccination/register-vaccination',
        component: RegiterVaccinationStaff,
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
        path: '/manager/personnel',
        component: ManagerPersonnelList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/personnel/:id',
        component: PersonnelDetailManager,
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
      {
        path: '/manager/blog/create',
        component: CreateBlog,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/blog',
        component:  ManagerBlogList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/blog/:id',
        component: BlogDetail,
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
    ],
  },
  {
    layout: DoctorLayout,
    data: [
      {
        path: '/vaccinator',
        component: VaccinatorHomePage,
        exact: true,
        role: ['Vaccinator'],
      },
    ],
  },
  {
    layout: PaymentLayout,
    data: [
      {
        path: '/payment-success',
        component: PaymentSuccess,
      },
      {
        path: '/payment-fail',
        component: PaymentFail,
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
