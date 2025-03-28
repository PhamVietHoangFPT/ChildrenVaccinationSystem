import { useGetBlogsDetailQuery } from '../../features/blogs/blogsAPI'
import { useParams } from 'react-router-dom'
import { Card, Typography } from 'antd'
import { Blogs } from '../../types/blog'
const { Title, Paragraph } = Typography
import { LoadingOutlined } from '@ant-design/icons'

interface BlogDetailResponse {
  data: {
    data: Blogs
  }
  isLoading: boolean
}

export default function BlogDetails() {
  const { id } = useParams()
  const { data, isLoading } = useGetBlogsDetailQuery<BlogDetailResponse>(id)
  console.log(data)
  if (isLoading) {
    return (
      <LoadingOutlined
        style={{
          fontSize: '50px',
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          height: '30vh',
        }}
      />
    )
  }
  return (
    <div style={{ margin: 'auto', padding: '20px' }}>
      <Card
        style={{
          background: '#fff',
          borderRadius: 10,
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
        }}
      >
        <Title level={2} style={{ color: '#1890ff' }}>
          {data.data.title}
        </Title>
        <Paragraph
          style={{ textAlign: 'justify', fontSize: 16, lineHeight: 1.8 }}
        >
          <Paragraph
            style={{ textAlign: 'justify', fontSize: 16, lineHeight: 1.8 }}
          >
            <div
              dangerouslySetInnerHTML={{ __html: data.data.content }}
              style={{ lineHeight: '1.6', fontSize: '16px' }}
            />
          </Paragraph>
        </Paragraph>
      </Card>
    </div>
  )
}
