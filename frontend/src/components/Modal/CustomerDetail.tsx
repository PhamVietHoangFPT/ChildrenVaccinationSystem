// src/components/CustomerDetailModal.tsx
import React from 'react';
import { Modal, Button } from 'antd';
import { LoadingOutlined } from '@ant-design/icons';
import { Customer } from '../../types/customer';
import { useGetCustomerDetailQuery } from '../../features/customer/customerAPI';

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

const CustomerDetailModal: React.FC<CustomerDetailModalProps> = ({
    visible,
    customerId,
    onClose,
}) => {
    const {
        data: customerDetailData,
        isLoading: customerDetailLoading,
        isFetching: customerDetailFetching,
    } = useGetCustomerDetailQuery<CustomerDetailResponse>(customerId, {
        skip: !customerId, // Skip query if no customerId
    });

    const customerDetail = customerDetailData?.data ?? null;

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
                <div>
                    <p><strong>ID:</strong> {customerDetail.id}</p>
                    <p><strong>Name:</strong> {customerDetail.name}</p>
                    <p><strong>Phone Number:</strong> {customerDetail.phoneNumber}</p>
                    <p><strong>Email:</strong> {customerDetail.email}</p>
                    <p><strong>Gender:</strong> {customerDetail.gender ? 'Male' : 'Female'}</p>
                </div>
            ) : (
                <p>No customer data available</p>
            )}
        </Modal>
    );
};

export default CustomerDetailModal;