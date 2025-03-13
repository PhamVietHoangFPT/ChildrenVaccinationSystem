import { apiSlice } from '../../apis/apiSlice'

export const customerAPI = apiSlice.injectEndpoints({
    endpoints: (builder) => ({
        getCustomerList: builder.query({
            query: ({ pageNumber, pageSize }) => ({
                url: '/accounts/customer',
                method: 'GET',
                params: {
                    pageNumber,
                    pageSize
                },
            }),
            transformResponse: (res) => res,
            providesTags: ['customers'],
        }),
    }),
})
export const {
    useGetCustomerListQuery,
} = customerAPI