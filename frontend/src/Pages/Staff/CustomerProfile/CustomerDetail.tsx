import React from 'react'
import { useParams } from 'react-router-dom'
import { useGetCustomerDetailQuery } from '../../../features/customer/customerAPI'
import { Customer } from '../../../types/customer'
import { LoadingOutlined } from '@ant-design/icons'
interface CustomerDetailResponse {
    data: {
        data: Customer
    }
    error: any;
    isLoading: boolean;
    isFetching: boolean;
}

const CustomerDetail: React.FC = () => {
    const { customerId } = useParams()
    const {
        data: customer,
        isLoading: CustomerDetailLoading,
    } = useGetCustomerDetailQuery<CustomerDetailResponse>(customerId) // Simplified parameter passing

    // Add loading state handling
    if (CustomerDetailLoading) {
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
        )
    }
    // Safely access the customer detail
    const customerDetail = customer?.data ?? null;
    return (
        <div>
            {customerDetail ? (
                <div>
                    {customerDetail.id}
                </div>
            ) : (
                <div>No customer data available</div>
            )}
        </div>
    )
}

export default CustomerDetail;