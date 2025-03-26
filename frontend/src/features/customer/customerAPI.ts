import { apiSlice } from '../../apis/apiSlice'

export const customerAPI = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getCustomerList: builder.query({
      query: ({ pageNumber, pageSize, phoneNumber }) => ({
        url: '/accounts/customer/minimal',
        method: 'GET',
        params: {
          phoneNumber,
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['customers'],
    }),
    getCustomerDetail: builder.query({
      query: (id) => ({
        url: `/accounts/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['customers'],
    }),
    updateCustomer: builder.mutation({
      query: ({ data, id }) => ({
        url: `/accounts/customer/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['customers'],
    }),
  
  }),
})
export const {
  useGetCustomerListQuery,
  useGetCustomerDetailQuery,
  useUpdateCustomerMutation,
} = customerAPI
