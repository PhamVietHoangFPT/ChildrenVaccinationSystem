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
        childCode,
        scheduleFrom,
        scheduleTo,
        status,
      }) => ({
        url: '/vaccinations/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          childCode,
          scheduleFrom,
          scheduleTo,
          status,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccinations'],
    }),
    getVaccinationListDoctor: build.query({
      query: ({
        pageNumber,
        pageSize,
      }) => ({
        url: '/vaccinations/doctor',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccinations'],
    }),
    getVaccinationListVaccinator: build.query({
      query: ({
        pageNumber,
        pageSize,
        childCode,
      }) => ({
        url: '/vaccinations/vaccinator',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          childCode,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccinations'],
    }),
    getVaccinationDetail: build.query({
      query: (id) => ({
        url: `/vaccinations/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccinations'],
    }),
    updateVaccination: build.mutation({
      query: ({ data, id }) => ({
        url: `/vaccinations/${id}/staff`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccinations'],
    }),
    updateVaccinationStatus: build.mutation({
      query: ({ id, status }) => ({
        url: `/vaccinations/${id}/${status}`,
        method: 'PUT',
        params: {
          id,
          status,
        },
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccinations'],
    }),
    getVaccinationsHistory: build.query({
      query: ({ childId, isUpcoming }) => ({
        url: `/vaccinations/history/${childId}`,
        method: 'GET',
        params: {
          isUpcoming,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccinations'],
    }),
    paymentVaccination: build.mutation({
      query: ({ data }) => ({
        url: '/vaccinations/payment/',
        method: 'PATCH',
        body: data
      }),
      invalidatesTags:['vaccinations']
    })
  }),
})

export const {
  useCreateRegisterVaccinationMutation,
  useGetVaccinationListQuery,
  useGetVaccinationDetailQuery,
  useUpdateVaccinationMutation,
  useUpdateVaccinationStatusMutation,
  useGetVaccinationsHistoryQuery,
  useGetVaccinationListDoctorQuery,
  useGetVaccinationListVaccinatorQuery,
  usePaymentVaccinationMutation
} = vaccinationsApi
