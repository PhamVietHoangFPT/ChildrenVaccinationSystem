import { apiSlice } from '../../apis/apiSlice'

export const packagesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPackageList: builder.query({
      query: ({
        pageNumber,
        pageSize,
        name,
      }) => ({
        url: '/packages',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          name,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['packages'],
    }),
    getPackageListMiniMal: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/packages/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['packages'],
    }),
    createPackage: builder.mutation({
      query: (data) => ({
        url: '/packages',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['packages'],
    }),
    getPackageDetail: builder.query({
      query: (id) => ({
        url: `/packages/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['packages'],
    }),
    updatePackage: builder.mutation({
      query: ({ data, id }) => ({
        url: `/packages/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['packages'],
    }),
    deletePackage: builder.mutation({
      query: (id) => ({
        url: `/packages/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['packages'],
    }),
  }),
})

export const {
  useGetPackageListQuery,
  useGetPackageListMiniMalQuery,
  useCreatePackageMutation,
  useGetPackageDetailQuery,
  useUpdatePackageMutation,
  useDeletePackageMutation,
} = packagesApi
