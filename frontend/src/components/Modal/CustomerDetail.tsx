// src/components/CustomerDetailModal.tsx
import React, { useEffect } from 'react';
import { Modal, Button, Form, message, Typography, Input, Switch } from 'antd';
import { LoadingOutlined } from '@ant-design/icons';
import { Customer } from '../../types/customer';
import { useGetCustomerDetailQuery, useUpdateCustomerMutation } from '../../features/customer/customerAPI';

interface CustomerDetailResponse {
    data: {
        data: Customer;
    };
    isLoading: boolean;
    isFetching: boolean;
    error: any;
}

interface CustomerDetailModalProps {
    visible: boolean;
    customerId: string | null;
    onClose: () => void;
}

const { Text } = Typography

const CustomerDetailModal: React.FC<CustomerDetailModalProps> = ({
    visible,
    customerId,
    onClose,
}) => {
    const {
        data: customerDetailData,
        isLoading: customerDetailLoading,
        isFetching: customerDetailFetching,
        error: customerDetailError,
    } = useGetCustomerDetailQuery<CustomerDetailResponse>(customerId, {
        skip: !customerId, // Skip query if no customerId
    });
    const [updateCustomer, { isLoading: isUpdating }] = useUpdateCustomerMutation()
    const customerDetail = customerDetailData?.data ?? null;
    const [form] = Form.useForm()

    // Set dữ liệu vào form khi có data
    useEffect(() => {
        if (customerDetail) {
            form.setFieldsValue({
                name: customerDetail.name || '',
                dateOfBirth: customerDetail.dateOfBirth || '',
                phoneNumber: customerDetail.phoneNumber || '',
                address: customerDetail.address || '',
                gender: customerDetail.gender ? customerDetail.gender : false,
            })
        }
    }, [customerDetail, form])


    const handleUpdate = async (values: any) => {
        if (!customerId) return;
        const inputValues = {
            name: values.name,
            dateOfBirth: values.dateOfBirth,
            phoneNumber: values.phoneNumber,
            address: values.address,
            gender: values.gender,
        };
        try {
            await updateCustomer({
                id: customerId,
                data: inputValues,
            }).unwrap();
            message.success('Cập nhật thông tin thành công!')
            onClose()
        } catch (err: any) {
            console.error('Lỗi từ API:', err);
            message.error(err.data?.message || 'Không thể cập nhật thông tin');
        }
    };
    if (customerDetailError) {
        const errorMessage = 'status' in customerDetailError ? customerDetailError.status : customerDetailError.message;
        return (
            <Modal
                title="Lỗi"
                open={visible}
                onCancel={onClose}
                footer={<Button onClick={onClose}>Đóng</Button>}
            >
                <Text type="danger">Lỗi: {errorMessage}</Text>
            </Modal>
        );
    }

    return (
        <Modal
            title="Customer Details"
            visible={visible}
            onCancel={onClose}
            footer={[
                <Button key="close" onClick={onClose}>
                    Close
                </Button>
            ]}
        >
            {customerDetailLoading || customerDetailFetching ? (
                <LoadingOutlined
                    style={{
                        fontSize: '50px',
                        display: 'flex',
                        justifyContent: 'center',
                        alignItems: 'center',
                        height: '30vh',
                    }}
                />
            ) : customerDetail ? (
                <Form
                    form={form}
                    layout='vertical'
                    onFinish={handleUpdate}
                    initialValues={{
                        name: customerDetail.name,
                        dateOfBirth: customerDetail.dateOfBirth,
                        phoneNumber: customerDetail.phoneNumber,
                        address: customerDetail.address,
                        gender: customerDetail.gender,
                    }}
                >
                    <Form.Item
                        label='Customer Name'
                        name='name'
                        rules={[{ required: true }]}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label='Date Of Birth'
                        name='dateOfBirth'
                        rules={[
                            { required: true },
                        ]}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label='Phone Number'
                        name='phoneNumber'
                        rules={[{ required: true }]}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label='Address'
                        name='address'
                        rules={[{ required: true }]}
                    >
                        <Input />
                    </Form.Item>
                    <Form.Item
                        label="Gender"
                        name="gender"
                        valuePropName="checked" // Switch dùng "checked" thay vì "value"
                    >
                        <Switch checked={form.getFieldValue('gender') ?? false} />
                    </Form.Item>
                    <Button type='primary' htmlType='submit' loading={isUpdating}>
                        Update
                    </Button>
                </Form>
            ) : (
                <p>No customer data available</p>
            )}
        </Modal>
    );
};

export default CustomerDetailModal;