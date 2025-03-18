import React, { useEffect, useState } from 'react';
import { Table, Button, Input, Typography, Spin } from 'antd';
import type { ColumnsType } from 'antd/es/table';
import { EyeOutlined, SearchOutlined, PlusOutlined } from '@ant-design/icons';
import { useNavigate } from 'react-router-dom';
import { useGetBlogsListQuery } from '../../../features/blogs/blogsAPI';
import { Blogs } from '../../../types/blog';

const { Title } = Typography;

interface BlogsListResponse {
  data: {
    data: {
      items: Blogs[];
    totalItems: number;
    } 
  };
  isLoading: boolean,
  isFetching: boolean
}

const ManagerBlogList: React.FC = () => {
  const navigate = useNavigate();
  const [searchText, setSearchText] = useState<string>('');
  const [currentPage, setCurrentPage] = useState<number>(1);
  const pageSize = 7
  const [filteredData, setFilteredData] = useState<Blogs[]>([]);


  const { data, isLoading, isFetching } = useGetBlogsListQuery<BlogsListResponse>({
    pageNumber: currentPage,
    pageSize: pageSize,
  });

  useEffect(() => {
    if (data?.data?.items) {
      // Filter thanh search
      const filtered = data.data.items.filter((blog) =>
        blog.title.toLowerCase().includes(searchText.toLowerCase())
      );
      setFilteredData(filtered);
    }
  }, [data, searchText]);

  console.log('data:', data);
 
  const totalItems = data?.data?.totalItems || 0;

  const columns: ColumnsType<Blogs> = [
    {
      title: 'No.',
      dataIndex: 'index',
      key: 'index',
      render: (_, __, index) => (currentPage - 1) * pageSize + index + 1,
    },
    {
      title: 'Title',
      dataIndex: 'title',
      key: 'title',
      sorter: (a, b) => a.title.localeCompare(b.title),
    },
    {
      title: 'Content',
      dataIndex: 'content',
      key: 'content',
      render: (text) => (
        <div style={{ maxWidth: 300, whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>
          {text}
        </div>
      ),
    },
  
    {
      title: 'Actions',
      key: 'actions',
      render: (_, record) => (
        <Button
          type='primary'
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/blog/${record.id}`)}
        >
          Details
        </Button>
      ),
    },
  ];

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Blog List</Title>

      <div
        style={{
          marginBottom: 16,
          display: 'flex',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Input
          placeholder='Search by blog title'
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

        <Button
          type='primary'
          icon={<PlusOutlined />}
          onClick={() => navigate('/manager/blog/create')}
        >
          Create Blog
        </Button>
      </div>

      {isLoading ? (
        <Spin />
      ) : (
        <Table
          columns={columns}
          dataSource={filteredData.map((item, index) => ({
            ...item,
            key: item.id,
            index: (currentPage - 1) * pageSize + index + 1,
          }))}
          loading={isFetching}
          bordered
          pagination={{
            current: currentPage,
            pageSize: pageSize,
            total: totalItems,
            onChange: (page) => {
              setCurrentPage(page);
            },
          }}
        />
      )}
    </div>
  );
};

export default ManagerBlogList;
