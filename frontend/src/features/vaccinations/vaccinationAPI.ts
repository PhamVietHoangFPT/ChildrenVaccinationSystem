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
  }),
})

export const { useCreateRegisterVaccinationMutation } = vaccinationsApi
