import { Typography, Card, List } from 'antd'
import { FC, useState } from 'react'
import { Blogs } from '../../types/blog'
import { useNavigate } from 'react-router-dom'

const { Title } = Typography

interface BlogSliderProps {
  blogs: Blogs[]
}

export const BlogSlider: FC<BlogSliderProps> = ({ blogs }) => {
  const navigate = useNavigate()
  const [hoveredId, setHoveredId] = useState<string | null>(null) // Lưu trạng thái hover theo blog ID

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
              boxShadow:
                hoveredId === blog.id.toString()
                  ? '0 4px 16px rgba(0,0,0,0.2)'
                  : '0 2px 8px rgba(0,0,0,0.1)',
              transform:
                hoveredId === blog.id.toString() ? 'scale(1.02)' : 'scale(1)',
              transition: 'all 0.3s ease-in-out',
              minHeight: '100px',
              maxWidth: '100%',
            }}
            onMouseEnter={() => setHoveredId(blog.id.toString())}
            onMouseLeave={() => setHoveredId(null)}
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
