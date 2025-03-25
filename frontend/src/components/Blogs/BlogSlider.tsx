import { Typography, Carousel, Card } from 'antd'
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
    <Carousel
      autoplay
      dots={false}
      infinite
      slidesToShow={4} // Hiển thị 4 items trên màn hình lớn
      slidesToScroll={1}
      responsive={[
        { breakpoint: 1024, settings: { slidesToShow: 2 } }, // Tablet
        { breakpoint: 768, settings: { slidesToShow: 1 } }, // Mobile
      ]}
    >
      {blogs.map((blog) => (
        <div key={blog.id}>
          <Card
            hoverable
            onClick={() => {
              navigate(`/blogs/${blog.id}`)
            }}
            style={{
              borderRadius: '12px',
              boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
              margin: '8px',
              minHeight: '400px', // Giữ chiều cao đồng đều
              display: 'flex',
              flexDirection: 'column',
            }}
          >
            <div
              style={{ flexGrow: 1, display: 'flex', flexDirection: 'column' }}
            >
              <Title level={4}>{blog.title}</Title>
            </div>
          </Card>
        </div>
      ))}
    </Carousel>
  )
}
