import { apiSlice } from '../../apis/apiSlice'

const manufacturesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getManufacturesList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/manufactures',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['manufactures'],
    }),
    createManufactures: builder.mutation({
      query: (data) => ({
        url: '/manufactures',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufactures'],
    }),
    getManufacturesDetail: builder.query({
      query: (id) => ({
        url: `/manufactures/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['manufactures'],
    }),
    updateManufactures: builder.mutation({
      query: ({ data, id }) => ({
        url: `/manufactures/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufactures'],
    }),
    deleteManufactures: builder.mutation({
      query: (id) => ({
        url: `/manufactures/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['manufactures'],
    }),
  }),
})

export const {
  useGetManufacturesListQuery,
  useCreateManufacturesMutation,
  useGetManufacturesDetailQuery,
  useUpdateManufacturesMutation,
  useDeleteManufacturesMutation,
} = manufacturesApi
