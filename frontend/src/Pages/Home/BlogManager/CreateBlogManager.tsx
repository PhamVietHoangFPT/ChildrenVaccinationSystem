import { useNavigate } from 'react-router-dom';
import {
  Form,
  Input,
  Button,
  Typography,
  message,
} from 'antd';
import { useCreateBlogsMutation } from '../../../features/blogs/blogsAPI';
import { useState } from 'react';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css';

const { Title } = Typography;

const CreateBlog: React.FC = () => {
  const navigate = useNavigate();

  const [createBlog] = useCreateBlogsMutation();
   const [content, setContent] = useState('');

  const [form] = Form.useForm();

  const handleSave = async (values: any) => {
    try {

      const payload = {
            title: values.title,
            content: values.content || '',
          };

      const dataCreate = (await createBlog(payload).unwrap()) as { message: string };
      message.success(dataCreate.message);

    } catch (error: any) {
      message.error(error.message);
    }
  };

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Blog Details</Title>
      <Form
        form={form}
        layout="vertical"
        onFinish={handleSave}
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
          name="content"
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
            <Button onClick={() => navigate('/manager/blog')}>
              Back
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  );
};

export default CreateBlog;
