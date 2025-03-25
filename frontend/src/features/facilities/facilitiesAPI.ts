import { apiSlice } from '../../apis/apiSlice'

const facilitiesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getFacilitiesList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/api/facilities',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['facilities'],
    }),
    createFacilities: builder.mutation({
      query: (data) => ({
        url: '/api/facilities',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['facilities'],
    }),
    getFacilitiesDetail: builder.query({
      query: (id) => ({
        url: `/api/facilities/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['facilities'],
    }),
    updateFacilities: builder.mutation({
      query: ({ data, id }) => ({
        url: `/api/facilities/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['facilities'],
    }),
    deleteFacilities: builder.mutation({
      query: (id) => ({
        url: `/api/facilities/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['facilities'],
    }),
    getFacilitiesInventory: builder.query({
      query: (id) => ({
        url: `/api/facilities/inventory/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['facilities'],
    }),
    getFacilitiesBatches: builder.query({
      query: (id) => ({
        url: `/api/facilities/batches/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['facilities'],
    }),
    importFacilities: builder.mutation({
      query: (data) => ({
        url: '/api/facilities/import',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['facilities'],
    }),
  }),
})

export const {
  useGetFacilitiesListQuery,
  useCreateFacilitiesMutation,
  useGetFacilitiesDetailQuery,
  useUpdateFacilitiesMutation,
  useDeleteFacilitiesMutation,
  useGetFacilitiesInventoryQuery,
  useGetFacilitiesBatchesQuery,
  useImportFacilitiesMutation,
} = facilitiesApi
