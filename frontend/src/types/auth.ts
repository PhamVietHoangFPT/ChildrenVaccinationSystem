export interface UserToken {
  token: string
  refreshToken: string
}

export interface UserData {
  Email: string
  Id: string
  Address: string
  Role: string
  Name: string
  PhoneNumber: string
  exp: number
}

export interface AuthState {
  userData: UserData | null
  userToken: UserToken | null
  isAuthenticated: boolean
  isLoading: boolean
}
