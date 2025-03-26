import { Typography, Card, List } from 'antd'
import { FC } from 'react'
import { Blogs } from '../../types/blog'
import { useNavigate } from 'react-router-dom'
const { Title } = Typography

interface BlogSliderProps {
  blogs: Blogs[]
}

export const BlogSlider: FC<BlogSliderProps> = ({ blogs }) => {
  const navigate = useNavigate()
  return (
    <List
      grid={{ gutter: 16, column: 2 }} // Hiển thị 2 cột
      dataSource={blogs}
      renderItem={(blog) => (
        <List.Item>
          <Card
            hoverable
            onClick={() => navigate(`/blogs/${blog.id}`)}
            style={{
              borderRadius: '8px',
              boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
              minHeight: '100px',
              maxWidth: '100%', // Đảm bảo chiếm toàn bộ chiều rộng của cột
            }}
          >
            <Title level={5} style={{ fontSize: '16px' }}>
              {blog.title}
            </Title>
          </Card>
        </List.Item>
      )}
    />
  )
}
