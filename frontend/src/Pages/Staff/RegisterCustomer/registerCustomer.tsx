import { Button, DatePicker, Form, Input, message, Switch } from 'antd';
import React from 'react';
import dayjs from 'dayjs';
import { useCreateAccountForCustomerMutation } from '../../../features/account/accountAPI';

const RegisterCustomer: React.FC = () => {
    const [form] = Form.useForm();
    const [createAccount, { isLoading: isCreating }] = useCreateAccountForCustomerMutation();

    const handleCreateAccount = async (values: any) => {
        const accountData = {
            name: values.name, // Switch to camelCase
            dateOfBirth: values.dateOfBirth ? dayjs(values.dateOfBirth).format('YYYY-MM-DD') : null,
            phoneNumber: values.phoneNumber,
            address: values.address,
            gender: values.gender ?? true, // Keep boolean as it worked in Swagger
        };
        console.log('Payload sent to API:', accountData);

        try {
            const response = await createAccount({ data: accountData }).unwrap();
            console.log('API response:', response);
            message.success('Account created successfully!');
            form.resetFields();
        } catch (err: any) {
            message.error(
                err.data?.title || err.data?.message || 'Failed to create account'
            );
        }
    };

    return (
        <Form
            form={form}
            layout="vertical"
            onFinish={handleCreateAccount}
            initialValues={{ gender: true }}
        >
            <Form.Item
                label="Name"
                name="name"
                rules={[{ required: true, message: 'Please enter customer name!' }]}
            >
                <Input placeholder="Enter customer name" />
            </Form.Item>

            <Form.Item
                label="Date Of Birth"
                name="dateOfBirth"
                rules={[{ required: true, message: 'Please enter date of birth!' }]}
            >
                <DatePicker
                    disabledDate={(current) =>
                        current && current > dayjs().subtract(18, 'year').endOf('day')
                    }
                    style={{ width: '100%' }}
                    format="YYYY-MM-DD"
                />
            </Form.Item>

            <Form.Item
                label="Phone Number"
                name="phoneNumber"
                rules={[{ required: true, message: 'Please enter phone number!' }]}
            >
                <Input placeholder="Enter phone number" />
            </Form.Item>

            <Form.Item
                label="Address"
                name="address"
                rules={[{ required: true, message: 'Please enter address!' }]}
            >
                <Input placeholder="Enter address" />
            </Form.Item>

            <Form.Item
                label="Gender (Male: On, Female: Off)"
                name="gender"
                valuePropName="checked"
            >
                <Switch />
            </Form.Item>

            <Form.Item>
                <Button type="primary" htmlType="submit" loading={isCreating}>
                    Add Account
                </Button>
            </Form.Item>
        </Form>
    );
};

export default RegisterCustomer;