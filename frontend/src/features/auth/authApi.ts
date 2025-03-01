import { apiSlice } from '../../apis/apiSlice'
import { login, logout } from './authSlice'

export const authApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    login: builder.mutation<
      { token: string },
      { email: string; password: string }
    >({
      query: (credentials) => ({
        url: '/authentication/login',
        method: 'POST',
        body: credentials,
      }),
      async onQueryStarted(_, { dispatch, queryFulfilled }) {
        try {
          const { data } = await queryFulfilled
          dispatch(login({ token: data.token }))
        } catch (error) {
          console.error('Login failed', error)
        }
      },
    }),
    logout: builder.mutation<void, void>({
      query: () => ({}),
      async onQueryStarted(_, { dispatch }) {
        try {
          dispatch(logout())
        } catch (error) {
          console.error('Logout failed', error)
        }
      },
    }),
  }),
})

export const { useLoginMutation, useLogoutMutation } = authApi
