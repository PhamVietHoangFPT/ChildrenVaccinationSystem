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
  }),

})
export const {
  useGetCustomerListQuery,
  useGetCustomerDetailQuery,
} = customerAPI
