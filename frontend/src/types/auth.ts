export interface UserToken {
  token: string
}

export interface UserData {
  Email: string
  Id: string
  Address: string
  Role: string
  Name: string
  PhoneNumber: string
  exp: number
  Facility: string
}

export interface AuthState {
  userData: UserData | null
  userToken: UserToken | null
  isAuthenticated: boolean
  isLoading: boolean
}
