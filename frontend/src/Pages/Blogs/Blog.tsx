import { useGetBlogsListQuery } from '../../features/blogs/blogsAPI'
import { Blogs } from '../../types/blog'
import { List, Typography } from 'antd'
import { Link } from 'react-router-dom'
import { LoadingOutlined } from '@ant-design/icons'

const { Title } = Typography

interface BlogListResponse {
  data: {
    data: {
      items: Blogs[]
    }
  }
  isLoading: boolean
}

export default function Blog() {
  const { data, isLoading } = useGetBlogsListQuery<BlogListResponse>({
    pageNumber: -1,
    pageSize: -1,
  })

  return (
    <div style={{ padding: '20px', margin: '0 auto' }}>
      <Title level={2} style={{ textAlign: 'center', color: '#1890ff' }}>
        Cẩm nang
      </Title>
      {isLoading ? (
        <LoadingOutlined
          style={{
            fontSize: '50px',
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '30vh',
          }}
        />
      ) : (
        <List
          itemLayout='horizontal'
          dataSource={data?.data.items || []}
          renderItem={(blog) => (
            <List.Item>
              <List.Item.Meta
                title={
                  <Link
                    to={`/blogs/${blog.id}`}
                    style={{
                      fontSize: '18px',
                      fontWeight: 'bold',
                      color: '#1890ff',
                    }}
                  >
                    {blog.title}
                  </Link>
                }
              />
            </List.Item>
          )}
        />
      )}
    </div>
  )
}
