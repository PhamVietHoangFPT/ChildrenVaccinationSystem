import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import {jwtDecode} from 'jwt-decode'
import Cookies from 'js-cookie'
import { UserData, AuthState } from '../../types/auth'

// Lấy userData từ Cookies
const userData: UserData | null = Cookies.get('userData')
  ? JSON.parse(Cookies.get('userData') as string)
  : null

const initialState: AuthState = {
  userData,
  userToken: null, // Không lưu token vào localStorage nữa
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
      const {token}  = action.payload

      const decodedToken: any = jwtDecode(token)

      state.userData = {
        Email: decodedToken.Email,
        Id: decodedToken.Id,
        Role: decodedToken.Role,
        Name: decodedToken.Name,
        PhoneNumber: decodedToken.PhoneNumber,
        Address: decodedToken.Address,
        exp: decodedToken.exp,
      }

      state.userToken = { token: token, refreshToken: '' } // Chỉ lưu Access Token tạm thời
      state.isAuthenticated = true

      // ✅ Lưu userData vào Cookies thay vì localStorage
      const expirationDate = new Date(state.userData.exp * 1000);
      Cookies.set('userData', JSON.stringify(state.userData), { expires: expirationDate })
    },
    logout: (state) => {
      state.userData = null
      state.userToken = null
      state.isAuthenticated = false

      // ✅ Xóa userData trong Cookies
      Cookies.remove('userData')
    },
    refreshToken: (state, action: PayloadAction<string>) => {
      state.userToken = {
        token: action.payload,
        refreshToken: state.userToken?.refreshToken || '',
      }
    },
  },
})

export const { login, logout, refreshToken, setLoading } = authSlice.actions
export default authSlice.reducer
export const selectAuthUser = (state: { authSlice: AuthState }) => state.authSlice
