import { apiSlice } from '../../apis/apiSlice'

const countryApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getCountryList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/country',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['country'],
    }),
    createCountry: builder.mutation({
      query: (data) => ({
        url: '/country',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['country'],
    }),
    getCountryDetail: builder.query({
      query: (id) => ({
        url: `/country/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['country'],
    }),
    updateCountry: builder.mutation({
      query: ({ data, id }) => ({
        url: `/country/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['country'],
    }),
    deleteCountry: builder.mutation({
      query: (id) => ({
        url: `/country/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['country'],
    }),
  }),
})

export const {
  useGetCountryListQuery,
  useCreateCountryMutation,
  useGetCountryDetailQuery,
  useUpdateCountryMutation,
  useDeleteCountryMutation,
} = countryApi
