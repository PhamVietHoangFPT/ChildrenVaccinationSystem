import LoginRegisterLayout from '../components/layout/LoginRegisterLayout'
import MainLayout from '../components/layout/MainLayout'
import { ManagerLayout } from '../components/layout/ManagerLayout'
import StaffLayout from '../components/layout/StaffLayout'
import ManagerCustomerList from '../Pages/Home/Customer/CustomerListManager'
import Homepage from '../Pages/Home/Home'
import ManagerStaffList from '../Pages/Home/Staff/StaffListManager'
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
import { DoctorLayout } from '../components/layout/DoctorLayout'
import DoctorHomePage from '../Pages/Doctor/DoctorHomePage'
import CustomerListDoctor from '../Pages/Home/Doctor/CustomerListDoctor'
import VaccineDetailsCustomer from '../Pages/Vaccines/VaccineDetailsCustomer'
import VaccineRegistrationCustomer from '../Pages/Vaccines/VaccineRegistrationCustomer'
import ForceUpdateAccount from '../Pages/Register/ForgeUpdateRegister'
import ChildrenPage from '../Pages/Staff/ChildrenProfile/Children'
import CustomerDetail from '../Pages/Staff/CustomerProfile/CustomerDetail'
import { VaccinatorLayout } from '../components/layout/VaccinatorLayout'
import VaccinatorHomePage from '../Pages/Vaccinator/VaccinatorHomePage'
import CustomerListVaccinator from '../Pages/Home/Vaccinator/CustomerListVaccinator'
import RegisterCustomer from '../Pages/Staff/RegisterCustomer/registerCustomer'
import StaffVaccination from '../Pages/Staff/Vaccination/StaffVaccination'
import ManagerPackageList from '../Pages/Home/Package/PackageListManager'
import ManagerPackageDetail from '../Pages/Home/Package/PackageDetailManager'

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
        path: '/staff/vaccination-record',
        component: StaffVaccination,
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
      {
        path: '/manager/package',
        component: ManagerPackageList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/package/:id',
        component: ManagerPackageDetail,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/package/create',
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
  {
    layout: VaccinatorLayout,
    data: [
      {
        path: '/vaccinator',
        component: VaccinatorHomePage,
        exact: true,
        role: ['Vaccinator'],
      },
      {
        path: '/vaccinator/view',
        component: CustomerListVaccinator,
        exact: true,
        role: ['Vaccinator'],
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
