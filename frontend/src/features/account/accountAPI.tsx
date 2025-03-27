import { apiSlice } from '../../apis/apiSlice'

export const accountApi = apiSlice.injectEndpoints({
  endpoints: (build) => ({
    forceUpdateAccount: build.mutation({
      query: (body) => ({
        url: '/accounts/force-update',
        method: 'POST',
        body: body,
      }),
      invalidatesTags: ['account'],
    }),

    getProfileUpdateValid: build.query({
      query: () => ({
        url: '/accounts/profile-update-valid',
        method: 'GET',
      }),
      providesTags: ['account'],
    }),

    getEmailResetValid: build.query({
      query: () => ({
        url: '/accounts/email-reset-valid',
        method: 'GET',
      }),
      providesTags: ['account'],
    }),

    getCustomerAccounts: build.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/accounts/customer',
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
        url: '/accounts/customer/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      providesTags: ['account'],
    }),

    getAccountPersonnel: build.query({
      query: ({ pageNumber, pageSize, role, facilityId }) => ({
        url: '/accounts/personnel',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          role,
          facilityId,
        },
      }),
      providesTags: ['account'],
    }),

    getAccountPersonnelMinimal: build.query({
      query: ({ pageNumber, pageSize, role, facilityId }) => ({
        url: '/accounts/personnel/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          role,
          facilityId,
        },
      }),
      providesTags: ['account'],
    }),

    createACcountPersonnel: build.mutation({
      query: ({ data }) => ({
        url: '/accounts/personnel',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['account'],
    }),

    updateAccountPersonnel: build.mutation({
      query: ({ data, id }) => ({
        url: `/accounts/personnel`,
        method: 'PUT',
        params: { id: id },
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['account'],
    }),

    getPersonnelDetail: build.query({
      query: (id) => ({
        url: `/accounts/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['account'],
    }),
    createAccountForCustomer: build.mutation({
      query: ({ data }) => ({
        url: '/accounts/customer',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['account'],
    }),
  }),
})

export const {
  useForceUpdateAccountMutation,
  useGetProfileUpdateValidQuery,
  useGetEmailResetValidQuery,
  useGetCustomerAccountsQuery,
  useGetMinimalCustomerAccountsQuery,
  useCreateAccountForCustomerMutation,
  useGetAccountPersonnelMinimalQuery,
  useCreateACcountPersonnelMutation,
  useGetAccountPersonnelQuery,
  useUpdateAccountPersonnelMutation,
  useGetPersonnelDetailQuery,
} = accountApi
