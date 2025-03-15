import { apiSlice } from '../../apis/apiSlice'

export const testApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getVaccineList: builder.query({
      query: ({
        name,
        categoryName,
        manufacturerCountry,
        pageNumber,
        pageSize,
      }) => ({
        url: '/vaccines',
        method: 'GET',
        params: {
          name,
          categoryName,
          manufacturerCountry,
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccines'],
    }),
    getVaccineListMiniMal: builder.query({
      query: ({
        name,
        categoryName,
        manufacturerCountry,
        pageNumber,
        pageSize,
      }) => ({
        url: '/vaccines/minimal',
        method: 'GET',
        params: {
          name,
          categoryName,
          manufacturerCountry,
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['vaccines'],
    }),
    createVaccine: builder.mutation({
      query: ({ data }) => {
        const formData = new FormData()

        // Thêm từng trường vào FormData
        Object.keys(data).forEach((key) => {
          formData.append(key, data[key])
        })

        return {
          url: `/vaccines`,
          method: 'POST',
          body: formData,
        }
      },
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
      query: ({ data, id }) => {
        const formData = new FormData()

        // Thêm từng trường vào FormData
        Object.keys(data).forEach((key) => {
          formData.append(key, data[key])
        })

        return {
          url: `/vaccines/${id}`,
          method: 'PUT',
          body: formData,
        }
      },
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
} = testApi
