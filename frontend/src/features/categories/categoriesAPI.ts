import { apiSlice } from '../../apis/apiSlice'

export const categoriesApi = apiSlice.injectEndpoints({
  endpoints: (build) => ({
    getCategoriesList: build.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/categories',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['categories'],
    }),
    createCategories: build.mutation({
      query: (data) => ({
        url: '/categories',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['categories'],
    }),
    getCategoriesDetail: build.query({
      query: (id) => ({
        url: `/categories/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['categories'],
    }),
    updateCategories: build.mutation({
      query: ({ data, id }) => ({
        url: `/categories/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['categories'],
    }),
    deleteCategories: build.mutation({
      query: (id) => ({
        url: `/categories/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['categories'],
    }),
  }),
})

export const {
  useGetCategoriesListQuery,
  useCreateCategoriesMutation,
  useGetCategoriesDetailQuery,
  useUpdateCategoriesMutation,
  useDeleteCategoriesMutation,
} = categoriesApi
