import { useDispatch, useSelector } from 'react-redux'
import { useEffect } from 'react'
import { logout } from '../features/auth/authSlice'
import { selectAuthUser } from '../features/auth/authSlice'

export const useAutoLogout = () => {
  const dispatch = useDispatch()
  const userExpireTime = useSelector(selectAuthUser).userData?.exp

  useEffect(() => {
    if (userExpireTime) {
      const currentTime = Math.floor(Date.now() / 1000) // Thời gian hiện tại (seconds)
      const timeLeft = userExpireTime - currentTime // Thời gian còn lại (seconds)
      if (timeLeft > 0) {
        const timer = setTimeout(() => {
          dispatch(logout()) // Hết hạn thì logout
        }, timeLeft * 1000)

        return () => clearTimeout(timer) // Xóa timer nếu component unmount
      } else {
        dispatch(logout()) // Nếu hết hạn rồi thì logout ngay
      }
    }
  }, [userExpireTime, dispatch])
}
