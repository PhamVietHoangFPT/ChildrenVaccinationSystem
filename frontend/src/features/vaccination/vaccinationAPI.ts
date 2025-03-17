import { apiSlice } from '../../apis/apiSlice'

export const vaccinationAPI = apiSlice.injectEndpoints({
    endpoints: (builder) => ({
        getVaccinationList: builder.query({
            query: ({
                pageNumber,
                pageSize,
                childId,
                scheduleFrom,
                scheduleTo,
                status,
            }) => ({
                url: '/vaccinations/minimal',
                method: 'GET',
                params: {
                    pageNumber,
                    pageSize,
                    childId,
                    scheduleFrom,
                    scheduleTo,
                    status
                },
            }),
            transformResponse: (res) => res,
            providesTags: ['vaccination'],
        }),
    }),
})

export const {
    useGetVaccinationListQuery,
} = vaccinationAPI
