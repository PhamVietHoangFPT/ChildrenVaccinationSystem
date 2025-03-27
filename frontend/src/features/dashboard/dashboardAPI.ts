import { apiSlice } from '../../apis/apiSlice'

const dashboardAPI = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getVaccinationsAdministered: builder.query({
      query: ({ startMonth, startYear, endMonth, endYear, facilityId }) => ({
        url: `/dashboard/vaccinations-administered?startMonth=${startMonth}&startYear=${startYear}&endMonth=${endMonth}&endYear=${endYear}&facilityId=${facilityId}`,
        method: 'GET',
      }),
      providesTags: ['dashboard'],
    }),
    getVaccinantionsStatus: builder.query({
      query: ({ startMonth, startYear, endMonth, endYear, facilityId }) => ({
        url: '/dashboard/vaccinations-status',
        method: 'GET',
        params: {
          startMonth,
          startYear,
          endMonth,
          endYear,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getRegistrations: builder.query({
      query: ({ startMonth, startYear, endMonth, endYear }) => ({
        url: '/dashboard/registrations',
        method: 'GET',
        params: {
          startMonth,
          startYear,
          endMonth,
          endYear,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getRevenue: builder.query({
      query: ({ startMonth, startYear, endMonth, endYear, facilityId }) => ({
        url: '/dashboard/revenue',
        method: 'GET',
        params: {
          startMonth,
          startYear,
          endMonth,
          endYear,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getTopVaccine: builder.query({
      query: ({ topN, facilityId }) => ({
        url: '/dashboard/top-vaccines',
        method: 'GET',
        params: {
          topN,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getTopFacilities: builder.query({
      query: ({ topN }) => ({
        url: '/dashboard/top-facilities',
        method: 'GET',
        params: {
          topN,
        },
      }),
      providesTags: ['dashboard'],
    }),
  }),
})

export const {
  useGetVaccinationsAdministeredQuery,
  useGetVaccinantionsStatusQuery,
  useGetRegistrationsQuery,
  useGetRevenueQuery,
  useGetTopVaccineQuery,
  useGetTopFacilitiesQuery,
} = dashboardAPI
