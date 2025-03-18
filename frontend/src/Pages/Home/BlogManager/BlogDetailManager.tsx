import { useParams, useNavigate } from 'react-router-dom';
import {
  Form,
  Input,
  Button,
  Typography,
  message,
  Modal,
  Spin,
} from 'antd';
import { useGetBlogsDetailQuery, useUpdateBlogsMutation, useDeleteBlogsMutation } from '../../../features/blogs/blogsAPI';
import { Blogs } from '../../../types/blog';
import { useState } from 'react';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css';

const { Title } = Typography;

interface BlogDetailResponse {
  data: {
    data: Blogs[];
  };
  isLoading: boolean;
}

const BlogDetail: React.FC = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const [content, setContent] = useState('');

  const { data, isLoading } = useGetBlogsDetailQuery<BlogDetailResponse>(id as string);
  const [updateBlog] = useUpdateBlogsMutation();
  const [deleteBlog] = useDeleteBlogsMutation();

  const [form] = Form.useForm();

  const handleSave = async (values: any) => {
    try {
      const payload = {
            title: values.title,
            content: values.content || '',
          };

      const dataUpdate = await (updateBlog({ id, data: payload }).unwrap()) as { message: string };
      message.success(dataUpdate.message);

    } catch (error: any) {
      message.error(error.message);
    }
  };

  const handleDelete = () => {
    Modal.confirm({
      title: 'Are you sure you want to delete this blog post?',
      content: 'This action cannot be undone',
      okText: 'Delete',
      okType: 'danger',
      cancelText: 'Cancel',
      onOk: async () => {
        try {
          const dataDelete = await deleteBlog(id).unwrap() as { message: string };
          message.success(dataDelete.message);
          navigate('/manager/blog');
        } catch (error: any) {
          message.error('Error deleting blog post: ' + error.message);
        }
      },
    });
  };

  if (isLoading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size="large" />
      </div>
    );
  }

  if (!data) {
    return <div>Blog post not found</div>;
  }

  const initialValues = {
    ...data.data,
  };

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Blog Details</Title>
      <Form
        form={form}
        layout="vertical"
        onFinish={handleSave}
        initialValues={initialValues}
      >
        <Form.Item name="id" hidden>
          <Input />
        </Form.Item>

        <Form.Item
          label="Title"
          name="title"
          rules={[{ required: true, message: 'Please enter the blog title' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Content"
          name='content'
          rules={[{ required: true, message: 'Please enter the blog content' }]}
        >
          {/* <Input.TextArea rows={6} /> */}
          <ReactQuill value={content} onChange={setContent} />
        </Form.Item>



        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type="primary" htmlType="submit">
              Save
            </Button>
            <Button danger onClick={handleDelete}>
              Delete
            </Button>
            <Button onClick={() => navigate('/manager/blog')}>
              Back
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  );
};

export default BlogDetail;
