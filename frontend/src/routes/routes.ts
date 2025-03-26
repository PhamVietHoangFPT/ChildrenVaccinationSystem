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
<<<<<<< HEAD
=======
import ManagerFacilityList from '../Pages/Home/Facility/FacilityListManager'
import ManagerFacilityDetail from '../Pages/Home/Facility/FacilityDetailManager'
import ManagerFacilityInventory from '../Pages/Home/Facility/FacilityInventoryManager'
import ManagerFacilityCreate from '../Pages/Home/Facility/FacilityCreateManager'
import ManagerFacilityImport from '../Pages/Home/Facility/FacilityImportManager'
import ManagerPersonnelList from '../Pages/Home/PersonnelManager/PersonnelListManager'
>>>>>>> 1c66e09a43ce08d7fc7b66356bba419fb9fb652b
import VaccinationsHistory from '../Pages/Vaccinations/VaccinationsHistory'
import BlogDetails from '../Pages/Blogs/BlogDetails'
import RegiterVaccinationStaff from '../Pages/Staff/RegisterCustomer/registerVaccination'
import RegisterCustomer from '../Pages/Staff/RegisterCustomer/registerCustomer'
import DoctorLayout from '../components/layout/DoctorLayout'
<<<<<<< HEAD
import PersonnelDetailManager from '../Pages/Home/Personnel/PersonnelDetailManager'
import BlogDetail from '../Pages/Home/BlogManager/BlogDetailManager'
import ManagerBlogList from '../Pages/Home/BlogManager/BlogListManager'
import CreateBlog from '../Pages/Home/BlogManager/CreateBlogManager'
import PersonnelListManager from '../Pages/Home/Personnel/PersonnelListManager'
import CreatePersonnelManager from '../Pages/Home/Personnel/PersonnelCreateManager'
=======
import ManagerPackageList from '../Pages/Home/Package/PackageListManager'
import ManagerPackageDetail from '../Pages/Home/Package/PackageDetailManager'
import ManagerPackageCreate from '../Pages/Home/Package/CreatePackageManager'
>>>>>>> 1c66e09a43ce08d7fc7b66356bba419fb9fb652b

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
        path: '/vaccine-registration',
        component: VaccineRegistrationCustomer,
      },
      {
        path: '/force-update',
        component: ForceUpdateAccount,
      },
      {
        path: '/vaccinations-history',
        component: VaccinationsHistory,
      },
      { path: '/blogs/:id', component: BlogDetails },
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
        component: PersonnelListManager,
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
        path: '/manager/personnel/create',
        component: CreatePersonnelManager,
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
<<<<<<< HEAD
        path: '/manager/blog/create',
        component: CreateBlog,
=======
        path: '/manager/package',
        component: ManagerPackageList,
>>>>>>> 1c66e09a43ce08d7fc7b66356bba419fb9fb652b
        exact: true,
        role: ['Manager'],
      },
      {
<<<<<<< HEAD
        path: '/manager/blog',
        component:  ManagerBlogList,
=======
        path: '/manager/package/:id',
        component: ManagerPackageDetail,
>>>>>>> 1c66e09a43ce08d7fc7b66356bba419fb9fb652b
        exact: true,
        role: ['Manager'],
      },
      {
<<<<<<< HEAD
        path: '/manager/blog/:id',
        component: BlogDetail,
=======
        path: '/manager/package/create',
        component: ManagerPackageCreate,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/facility',
        component: ManagerFacilityList,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/facility/:id',
        component: ManagerFacilityDetail,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/facility/inventory/:id',
        component: ManagerFacilityInventory,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/facility/create',
        component: ManagerFacilityCreate,
        exact: true,
        role: ['Manager'],
      },
      {
        path: '/manager/facility/inventory/import/:id',
        component: ManagerFacilityImport,
>>>>>>> 1c66e09a43ce08d7fc7b66356bba419fb9fb652b
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
