import { apiSlice } from '../../apis/apiSlice'

export const vaccineApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getVaccineList: builder.query({
      query: ({
        pageNumber,
        pageSize,
        categoryName,
        manufacturerCountry,
        name,
      }) => ({
        url: '/vaccines',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          categoryName,
          manufacturerCountry,
          name,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccines'],
    }),
    getVaccineListMiniMal: builder.query({
      query: ({
        pageNumber,
        pageSize,
        categoryName,
        manufacturerCountry,
        name,
      }) => ({
        url: '/vaccines/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
          categoryName,
          manufacturerCountry,
          name,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccines'],
    }),
    createVaccine: builder.mutation({
      query: (data) => ({
        url: '/vaccines',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccines'],
    }),
    getVaccineDetail: builder.query({
      query: (id) => ({
        url: `/vaccines/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccines'],
    }),
    updateVaccine: builder.mutation({
      query: ({ data, id }) => ({
        url: `/vaccines/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccines'],
    }),
    deleteVaccine: builder.mutation({
      query: (id) => ({
        url: `/vaccines/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['vaccines'],
    }),
  }),
})

export const {
  useGetVaccineListQuery,
  useGetVaccineListMiniMalQuery,
  useCreateVaccineMutation,
  useGetVaccineDetailQuery,
  useUpdateVaccineMutation,
  useDeleteVaccineMutation,
} = vaccineApi
