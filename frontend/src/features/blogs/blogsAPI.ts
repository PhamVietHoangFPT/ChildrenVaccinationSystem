import { apiSlice } from '../../apis/apiSlice'

const blogsApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getBlogsList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/blogs',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['blogs'],
    }),
    getBlogsMinimalList: builder.query({
      query: ({ pageNumber, pageSize }) => ({
        url: '/blogs/minimal',
        method: 'GET',
        params: {
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['blogs'],
    }),
    createBlogs: builder.mutation({
      query: (data) => ({
        url: '/blogs',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['blogs'],
    }),
    getBlogsDetail: builder.query({
      query: (id) => ({
        url: `/blogs/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['blogs'],
    }),
    updateBlogs: builder.mutation({
      query: ({ data, id }) => ({
        url: `/blogs/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['blogs'],
    }),
    deleteBlogs: builder.mutation({
      query: (id) => ({
        url: `/blogs/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['blogs'],
    }),
  }),
})

export const {
  useGetBlogsListQuery,
  useGetBlogsMinimalListQuery,
  useCreateBlogsMutation,
  useGetBlogsDetailQuery,
  useUpdateBlogsMutation,
  useDeleteBlogsMutation,
} = blogsApi
