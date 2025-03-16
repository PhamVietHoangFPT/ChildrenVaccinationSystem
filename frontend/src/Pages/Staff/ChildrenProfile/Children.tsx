import React, { useEffect, useState } from 'react'
import { Children } from '../../../types/children';
import { useSearchParams } from 'react-router-dom';
import { useGetChildrenListQuery } from '../../../features/children/childrenAPI';
import { EditOutlined, LoadingOutlined, PlusOutlined } from '@ant-design/icons';
import { Button, Input, Table } from 'antd';
import ChildrenDetailModal from '../../../components/Modal/ChildrenDetail';
import AddChildrenModal from '../../../components/Modal/AddChildren';
interface ChildrenListResponse {
    data: {
        data: {
            items: Children[];
            totalItems: number;
        };
    };
    isLoading: boolean;
    isFetching: boolean;
}

const ChildrenPage: React.FC = () => {
    const [searchParams, setSearchParams] = useSearchParams();


    // Pagination and search states
    const initialPage = parseInt(searchParams.get('page') || '1', 10);
    const [searchPhoneTerm, setSearchPhoneTerm] = useState('');
    const [searchNameTerm, setSearchNameTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(initialPage);
    const pageSize = 7;
    // Modal state
    const [isDetailModalVisible, setIsDetailModalVisible] = useState(false);
    const [isAddModalVisible, setIsAddModalVisible] = useState(false);
    const [selectedChildId, setSelectedChildId] = useState<string | null>(null);

    // Fetch customer list
    const {
        data: children,
        isFetching: childrenFetching,
        isLoading: chilrenLoading,
    } = useGetChildrenListQuery<ChildrenListResponse>({
        parentPhoneNumber: searchPhoneTerm || undefined,
        name: searchNameTerm || undefined,
        pageNumber: currentPage,
        pageSize: pageSize,
    });

    const dataChildren = children?.data.items ?? [];
    const totalChildren = children?.data.totalItems ?? 0;

    // Update URL search params
    useEffect(() => {
        setSearchParams({
            page: currentPage.toString(),
            parentPhoneNumber: searchPhoneTerm,
            name: searchNameTerm
        });
    }, [currentPage, searchPhoneTerm, searchNameTerm, setSearchParams]);


    if (chilrenLoading) {
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
        );
    }

    // Table columns
    const columns = [
        {
            title: 'No.',
            dataIndex: 'index',
            key: 'index',
            render: (_: any, __: any, index: number) => (currentPage - 1) * pageSize + index + 1,
        },
        {
            title: 'Child Name',
            dataIndex: 'name',
            key: 'name',
        },
        {
            title: 'Date Of Birth',
            dataIndex: 'dateOfBirth',
            key: 'dateOfBirth',
        },
        {
            title: 'Medical Note',
            dataIndex: 'medicalNote',
            key: 'medicalNote',
        },
        {
            title: 'Gender',
            dataIndex: 'gender',
            key: 'gender',
            render: (gender: boolean) => (gender ? 'Male' : 'Female'),
        },
        {
            title: 'Update',
            key: 'update',
            render: (_: any, record: Children) => (
                <Button
                    type="primary"
                    icon={<EditOutlined />}
                    onClick={() => {
                        setSelectedChildId(record.id); // Set the selected customer ID
                        setIsDetailModalVisible(true); // Show the modal
                    }}
                />
            ),
        },
    ];



    // Handle modal close
    const handleDetailModalClose = () => {
        setIsDetailModalVisible(false);
        setSelectedChildId(null);
    };

    const handleAddModalClose = () => {
        setIsAddModalVisible(false);
    };
    return (
        <div style={{ padding: 20, background: '#fff', borderRadius: 8 }}>
            <Input.Search
                placeholder="Search by phone number"
                allowClear
                onSearch={(value) => setSearchPhoneTerm(value)}
                style={{ marginBottom: 16, width: 300 }}
            />
            <Input.Search
                placeholder="Search by chidren name"
                allowClear
                onSearch={(value) => setSearchNameTerm(value)}
                style={{ marginBottom: 16, width: 300 }}
            />
            <Button
                    type="primary"
                    icon={<PlusOutlined />}
                    onClick={() => setIsAddModalVisible(true)}
                >
                    Thêm trẻ
                </Button>
            <Table
                columns={columns}
                dataSource={dataChildren.map((item, index) => ({
                    ...item,
                    key: item.id,
                    index: (currentPage - 1) * pageSize + index + 1,
                    children: undefined,
                }))}
                loading={childrenFetching}
                bordered
                pagination={{
                    current: currentPage,
                    pageSize: pageSize,
                    total: totalChildren,
                    onChange: (page) => {
                        setCurrentPage(page);
                    },
                }}
            />
            <ChildrenDetailModal
                visible={isDetailModalVisible}
                id={selectedChildId}
                onClose={handleDetailModalClose}
            />
            <AddChildrenModal
                visible={isAddModalVisible}
                onClose={handleAddModalClose}
            />
        </div>
    )
}
export default ChildrenPage
