import { apiSlice } from '../../apis/apiSlice'

const countryApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getCountryList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/countries',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['countries'],
    }),
    getCountryManufacturerList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/countries/manufacturer',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['countries'],
    }),
  }),
})

export const { useGetCountryListQuery, useGetCountryManufacturerListQuery } =
  countryApi
