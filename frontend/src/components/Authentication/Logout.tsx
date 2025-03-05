import { useLogoutMutation } from '../../features/auth/authApi'
import { Button } from 'antd'
import { useNavigate } from 'react-router-dom'

export default function Logout() {
  const [logout] = useLogoutMutation()
  const navigate = useNavigate()
  const logoutAcount = async () => {
    await navigate('/login')
    logout()
  }

  return (
    <div>
      <Button type='primary' onClick={logoutAcount}>
        Logout
      </Button>
    </div>
  )
}
