import { apiSlice } from '../../apis/apiSlice'

export const childrenApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getChildrenList: builder.query({
      query: ({ pageNumber, pageSize, parentPhoneNumber, name }) => ({
        url: '/children/minimal',
        method: 'GET',
        params: {
          parentPhoneNumber,
          name,
          pageNumber,
          pageSize,
        },
      }),
      transformResponse: (res) => res,
      providesTags: ['children'],
    }),
    getChildrenDetail: builder.query({
      query: (id) => ({
        url: `/children/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['children'],
    }),
    updateChildren: builder.mutation({
      query: ({ data, id }) => ({
        url: `/children/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['children'],
    }),
    // createChildren: build.mutation({
    //   query: (data) => ({
    //     url: '/children',
    //     method: 'POST',
    //     body: data,
    //   }),
    //   transformResponse: (res) => res,
    //   invalidatesTags: ['children'],
    // }),
    // getChildrenDetail: build.query({
    //   query: (id) => ({
    //     url: `/children/${id}`,
    //     method: 'GET',
    //   }),
    //   transformResponse: (res) => res,
    //   providesTags: ['children'],
    // }),

    // deleteChildren: build.mutation({
    //   query: (id) => ({
    //     url: `/children/${id}`,
    //     method: 'DELETE',
    //   }),
    //   transformResponse: (res) => res,
    //   invalidatesTags: ['children'],
    // }),
  }),
})

export const {
  useGetChildrenListQuery,
  useGetChildrenDetailQuery,
  useUpdateChildrenMutation
  // useCreateChildrenMutation,
  // useGetChildrenDetailQuery,
  // useUpdateChildrenMutation,
  // useDeleteChildrenMutation,
} = childrenApi
