import { useNavigate } from 'react-router-dom'
import { Form, Input, Button, Typography, message } from 'antd'
import { useCreateBlogsMutation } from '../../../features/blogs/blogsAPI'
import { useRef, useState } from 'react'
import ReactQuill from 'react-quill'
import 'react-quill/dist/quill.snow.css'

const { Title } = Typography

const CreateBlog: React.FC = () => {
  const navigate = useNavigate()

  const [createBlog] = useCreateBlogsMutation()

  const [content, setContent] = useState('')
  const reactQuillRef = useRef<ReactQuill>(null)

  const [form] = Form.useForm()

  const handleSave = async (values: any) => {
    try {
      const payload = {
        title: values.title,
        content: values.content || '',
      }

      const dataCreate = (await createBlog(payload).unwrap()) as {
        message: string
      }
      message.success(dataCreate.message)
    } catch (error: any) {
      message.error(error.message)
    }
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Tạo Blog</Title>
      <Form form={form} layout='vertical' onFinish={handleSave}>
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
            <Button onClick={() => navigate('/manager/blog')}>Trở lại</Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  )
}

export default CreateBlog
