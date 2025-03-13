import { apiSlice } from '../../apis/apiSlice'

export const childrenApi = apiSlice.injectEndpoints({
  endpoints: (build) => ({
    getChildrenList: build.query({
      query: (params) => ({
        url: '/children',
        method: 'GET',
        params,
      }),
      transformResponse: (res) => res,
      providesTags: ['children'],
    }),
    createChildren: build.mutation({
      query: (data) => ({
        url: '/children',
        method: 'POST',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['children'],
    }),
    getChildrenDetail: build.query({
      query: (id) => ({
        url: `/children/${id}`,
        method: 'GET',
      }),
      transformResponse: (res) => res,
      providesTags: ['children'],
    }),
    updateChildren: build.mutation({
      query: ({ data, id }) => ({
        url: `/children/${id}`,
        method: 'PUT',
        body: data,
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['children'],
    }),
    deleteChildren: build.mutation({
      query: (id) => ({
        url: `/children/${id}`,
        method: 'DELETE',
      }),
      transformResponse: (res) => res,
      invalidatesTags: ['children'],
    }),
  }),
})

export const {
  useGetChildrenListQuery,
  useCreateChildrenMutation,
  useGetChildrenDetailQuery,
  useUpdateChildrenMutation,
  useDeleteChildrenMutation,
} = childrenApi
