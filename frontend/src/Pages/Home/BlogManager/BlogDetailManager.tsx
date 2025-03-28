import { useParams, useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message, Modal, Spin } from 'antd'
import {
  useGetBlogsDetailQuery,
  useUpdateBlogsMutation,
  useDeleteBlogsMutation,
} from '../../../features/blogs/blogsAPI'
import { Blogs } from '../../../types/blog'
import { useRef, useState } from 'react'
import ReactQuill from 'react-quill'
import 'react-quill/dist/quill.snow.css'

const { Title } = Typography

interface BlogDetailResponse {
  data: {
    data: Blogs[]
  }
  isLoading: boolean
}

const BlogDetail: React.FC = () => {
  const navigate = useNavigate()
  const { id } = useParams()
  const [content, setContent] = useState('')
  const reactQuillRef = useRef<ReactQuill>(null)

  const { data, isLoading } = useGetBlogsDetailQuery<BlogDetailResponse>(
    id as string
  )
  const [updateBlog] = useUpdateBlogsMutation()
  const [deleteBlog] = useDeleteBlogsMutation()

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      const payload = {
        title: values.title,
        content: values.content || '',
      }

      const dataUpdate = (await updateBlog({ id, data: payload }).unwrap()) as {
        message: string
      }
      message.success(dataUpdate.message)
    } catch (error: any) {
      message.error(error.message)
    }
  }

  const handleDelete = () => {
    Modal.confirm({
      title: 'Bạn có chắc chắn muốn xóa bài viết blog này không?',
      content: 'Hành động này không thể hoàn tác',
      okText: 'Xóa',
      okType: 'danger',
      cancelText: 'Hủy',
      onOk: async () => {
        try {
          const dataDelete = (await deleteBlog(id).unwrap()) as {
            message: string
          }
          message.success(dataDelete.message)
          navigate('/manager/blog')
        } catch (error: any) {
          message.error('Error deleting blog post: ' + error.message)
        }
      },
    })
  }

  if (isLoading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size='large' />
      </div>
    )
  }

  if (!data) {
    return <div>Không tìm thấy Blog</div>
  }

  const initialValues = {
    ...data.data,
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thông tin Blog</Title>
      <Form
        form={form}
        layout='vertical'
        onFinish={handleSave}
        initialValues={initialValues}
      >
        <Form.Item name='id' hidden>
          <Input />
        </Form.Item>

        <Form.Item
          label='Tiêu đề'
          name='title'
          rules={[{ required: true, message: 'Vui lòng nhập tiêu đề' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label='Nội dung'
          name='content'
          rules={[{ required: true, message: 'Vui lòng nhập nội dung' }]}
        >
          <ReactQuill
            ref={reactQuillRef}
            theme='snow'
            placeholder='Bắt đầu viết nội dung.....'
            modules={{
              toolbar: {
                container: [
                  [{ header: '1' }, { header: '2' }, { font: [] }],
                  [{ size: [] }],
                  ['bold', 'italic', 'underline', 'strike', 'blockquote'],
                  [
                    { list: 'ordered' },
                    { list: 'bullet' },
                    { indent: '-1' },
                    { indent: '+1' },
                  ],
                  ['link', 'image', 'video'],
                  ['code-block'],
                  ['clean'],
                ],
              },
              clipboard: {
                matchVisual: false,
              },
            }}
            formats={[
              'header',
              'font',
              'size',
              'bold',
              'italic',
              'underline',
              'strike',
              'blockquote',
              'list',
              'bullet',
              'indent',
              'link',
              'image',
              'video',
              'code-block',
            ]}
            value={content}
            onChange={setContent}
          />
        </Form.Item>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type='primary' htmlType='submit'>
              Lưu
            </Button>
            <Button danger onClick={handleDelete}>
              Xóa
            </Button>
            <Button onClick={() => navigate('/manager/blog')}>Trở lại</Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default BlogDetail
