import { apiSlice } from '../../apis/apiSlice'

const manufacturersApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getManufacturesList: builder.query({
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
    createManufactures: builder.mutation({
      query: (data) => ({
        url: '/manufacturers',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufacturers'],
    }),
    getManufacturesDetail: builder.query({
      query: (id) => ({
        url: `/manufacturers/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['manufacturers'],
    }),
    updateManufactures: builder.mutation({
      query: ({ data, id }) => ({
        url: `/manufacturers/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufacturers'],
    }),
    deleteManufactures: builder.mutation({
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
  useGetManufacturesListQuery,
  useCreateManufacturesMutation,
  useGetManufacturesDetailQuery,
  useUpdateManufacturesMutation,
  useDeleteManufacturesMutation,
} = manufacturersApi
