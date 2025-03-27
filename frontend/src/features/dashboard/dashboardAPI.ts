import { apiSlice } from '../../apis/apiSlice'

const dashboardAPI = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getVaccinationsAdministered: builder.query({
      query: ({ start, end, facilityId }) => ({
        url: '/dashboard/vaccinations-administered',
        method: 'GET',
        params: {
          start,
          end,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getVaccinantionsStatus: builder.query({
      query: ({ start, end, facilityId }) => ({
        url: '/dashboard/vaccinations-status',
        method: 'GET',
        params: {
          start,
          end,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getCompletionRate: builder.query({
      query: ({ start, end, facilityId }) => ({
        url: '/dashboard/completion-rate',
        method: 'GET',
        params: {
          start,
          end,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getStockData: builder.query({
      query: ({ start, end, facilityId }) => ({
        url: '/dashboard/stock-data',
        method: 'GET',
        params: {
          start,
          end,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getRegistrations: builder.query({
      query: ({ start, end }) => ({
        url: '/dashboard/registrations',
        method: 'GET',
        params: {
          start,
          end,
        },
      }),
      providesTags: ['dashboard'],
    }),
    getRevenue: builder.query({
      query: ({ start, end, facilityId }) => ({
        url: '/dashboard/revenue',
        method: 'GET',
        params: {
          start,
          end,
          facilityId,
        },
      }),
      providesTags: ['dashboard'],
    }),
  }),
})

export const {
  useGetVaccinationsAdministeredQuery,
  useGetVaccinantionsStatusQuery,
  useGetCompletionRateQuery,
  useGetStockDataQuery,
  useGetRegistrationsQuery,
  useGetRevenueQuery,
} = dashboardAPI
