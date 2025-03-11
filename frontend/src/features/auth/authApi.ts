import { apiSlice } from '../../apis/apiSlice'
import { login, logout } from './authSlice'
export const authAPI = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    login: builder.mutation<
      { data: string },
      { email: string; password: string; phoneNumber: string }
    >({
      query: (credentials) => ({
        url: '/accounts/login',
        method: 'POST',
        body: credentials,
      }),
      async onQueryStarted(_, { dispatch, queryFulfilled }) {
        try {
          const { data } = await queryFulfilled
          dispatch(login({ token: data.data }))
        } catch (error) {
          console.log(error)
        }
      },
    }),
    logout: builder.mutation<void, void>({
      queryFn: async () => ({ data: undefined }),
      async onQueryStarted(_, { dispatch }) {
        try {
          dispatch(logout())
        } catch (error) {
          console.log(error)
        }
      },
    }),
    register: builder.mutation<
      { token: string },
      {
        email: string
        password: string
        name: string
      }
    >({
      query: (credentials) => ({
        url: '/accounts/register',
        method: 'POST',
        body: credentials,
      }),
    }),
  }),
})

export const { useLoginMutation, useLogoutMutation, useRegisterMutation } =
  authAPI
