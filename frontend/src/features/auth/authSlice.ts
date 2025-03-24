import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { jwtDecode } from 'jwt-decode'
import Cookies from 'js-cookie'
import { UserData, AuthState } from '../../types/auth'

// Lấy userData từ Cookies
const userData: UserData | null = Cookies.get('userData')
  ? JSON.parse(Cookies.get('userData') as string)
  : null

const userToken = Cookies.get('userToken')

const initialState: AuthState = {
  userData,
  userToken: userToken ? { token: userToken } : null,
  isAuthenticated: !!userData,
  isLoading: false,
}

const authSlice = createSlice({
  name: 'authSlice',
  initialState,
  reducers: {
    setLoading: (state, action: PayloadAction<boolean>) => {
      state.isLoading = action.payload
    },
    login: (state, action: PayloadAction<{ token: string }>) => {
      const { token } = action.payload

      const decodedToken: any = jwtDecode(token)

      state.userData = {
        Email: decodedToken.Email,
        Id: decodedToken.Id,
        Role: decodedToken.Role,
        Name: decodedToken.Name,
        PhoneNumber: decodedToken.PhoneNumber,
        Address: decodedToken.Address,
        exp: decodedToken.exp,
        Facility: decodedToken.FacilityId,
      }

      state.userToken = { token: token }
      state.isAuthenticated = true

      const expirationDate = new Date(state.userData.exp * 1000)
      Cookies.set('userData', JSON.stringify(state.userData), {
        expires: expirationDate,
      })
      Cookies.set('userToken', token, { expires: expirationDate })
      if (state.userData.Role === 'Customer') {
        window.location.href = '/'
      } else if (state.userData.Role === 'Staff') {
        window.location.href = '/staff/customer-account'
      } else {
        window.location.href = `/${state.userData.Role.toLowerCase()}`
      }
    },
    logout: (state) => {
      state.userData = null
      state.userToken = null
      state.isAuthenticated = false

      Cookies.remove('userData')
      Cookies.remove('userToken')
    },
  },
})

export const { login, logout, setLoading } = authSlice.actions
export default authSlice.reducer
export const selectAuthUser = (state: { authSlice: AuthState }) =>
  state.authSlice
