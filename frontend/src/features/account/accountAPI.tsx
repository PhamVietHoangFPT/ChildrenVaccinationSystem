import { apiSlice } from '../../apis/apiSlice'

export const accountApi = apiSlice.injectEndpoints({
  endpoints: (build) => ({
    forceUpdateAccount: build.mutation({
      query: (body) => ({
        url: 'accounts/force-update',
        method: 'POST',
        body: body,
      }),
      invalidatesTags: ['account'],
    }),

    getProfileUpdateValid: build.query({
      query: () => ({
        url: 'accounts/profile-update-valid',
        method: 'GET',
      }),
      providesTags: ['account'],
    }),

    getEmailResetValid: build.query({
      query: () => ({
        url: 'accounts/email-reset-valid',
        method: 'GET',
      }),
      providesTags: ['account'],
    }),

    getCustomerAccounts: build.query({
      query: ({ pageNumber, pageSize }) => ({
        url: 'accounts/customer',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      providesTags: ['account'],
    }),

    getMinimalCustomerAccounts: build.query({
      query: ({ pageNumber, pageSize }) => ({
        url: 'accounts/customer/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      providesTags: ['account'],
    }),
  }),
})

export const {
  useForceUpdateAccountMutation,
  useGetProfileUpdateValidQuery,
  useGetEmailResetValidQuery,
  useGetCustomerAccountsQuery,
  useGetMinimalCustomerAccountsQuery,
} = accountApi
