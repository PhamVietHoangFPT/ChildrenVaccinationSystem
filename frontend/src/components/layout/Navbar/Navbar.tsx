import Logout from '../../Authentication/Logout'

import { selectAuthUser } from '../../../features/auth/authSlice'
import { useSelector } from 'react-redux'
export default function Navbar() {
  const userData = useSelector(selectAuthUser).userToken
  return (
    <>
      <div>{userData != null ? <Logout /> : <>Hello</>}</div>
    </>
  )
}
