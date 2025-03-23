import { apiSlice } from '../../apis/apiSlice'

export const staffAPI = apiSlice.injectEndpoints({
    endpoints: (builder) => ({
        getStaffList: builder.query({
            query: ({ pageNumber, pageSize, facilityId, role }) => ({
                url: '/accounts/personnel',
                method: 'GET',
                params: {
                    facilityId,
                    role,
                    pageNumber,
                    pageSize,
                },
            }),
            transformResponse: (res) => res,
            providesTags: ['staff'],
        }),
    }),
})
export const {
    useGetStaffListQuery,
} = staffAPI

