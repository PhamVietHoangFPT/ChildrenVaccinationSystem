import { apiSlice } from '../../apis/apiSlice'

export const vaccinationsApi = apiSlice.injectEndpoints({
  endpoints: (build) => ({
    createRegisterVaccination: build.mutation({
      query: (data) => ({
        url: '/vaccinations/register',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccinations'],
    }),
    getVaccinationList: build.query({
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
      providesTags: ['vaccinations'],
    }),
  }),
})

export const {
  useCreateRegisterVaccinationMutation,
  useGetVaccinationListQuery
} = vaccinationsApi
