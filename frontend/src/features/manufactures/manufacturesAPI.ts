import { apiSlice } from '../../apis/apiSlice'

const manufacturesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getManufacturersList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/manufacturers',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['manufacturers'],
    }),
    createManufacturers: builder.mutation({
      query: (data) => ({
        url: '/manufacturers',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufacturers'],
    }),
    getManufacturersDetail: builder.query({
      query: (id) => ({
        url: `/manufacturers/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['manufacturers'],
    }),
    updateManufacturers: builder.mutation({
      query: ({ data, id }) => ({
        url: `/manufacturers/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufacturers'],
    }),
    deleteManufacturers: builder.mutation({
      query: (id) => ({
        url: `/manufacturers/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufacturers'],
    }),
  }),
})

export const {
  useGetManufacturersListQuery,
  useCreateManufacturersMutation,
  useGetManufacturersDetailQuery,
  useUpdateManufacturersMutation,
  useDeleteManufacturersMutation,
} = manufacturesApi
