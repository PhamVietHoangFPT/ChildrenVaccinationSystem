
import React, { useEffect } from 'react';
import { Modal, Button, Form, Typography, message, Input, InputNumber, Switch } from 'antd';
import { LoadingOutlined } from '@ant-design/icons';
import { Children } from '../../types/children';
import { useGetChildrenDetailQuery, useUpdateChildrenMutation } from '../../features/children/childrenAPI';

interface ChildrenDetailResponse {
    data: {
        data: Children;
    };
    isLoading: boolean;
    isFetching: boolean;
    error: any;
}

interface ChilrenDetailModalProps {
    visible: boolean;
    id: string | null;
    onClose: () => void;
}
const { Text } = Typography
const ChildrenDetailModal: React.FC<ChilrenDetailModalProps> = ({
    visible,
    id,
    onClose,
}) => {

    const {
        data: childrenDetailData,
        isLoading: childrenDetailLoading,
        isFetching: chilrenDetailFetching,
        error: childrenDetailError,
    } = useGetChildrenDetailQuery<ChildrenDetailResponse>(id, {
        skip: !id, // Skip query if no id
    });

    const [updateChildren, { isLoading: isUpdating }] = useUpdateChildrenMutation()

    const childrenDetail = childrenDetailData?.data ?? null;

    const [form] = Form.useForm()

    // Set dữ liệu vào form khi có data
    useEffect(() => {
        if (childrenDetail) {
            form.setFieldsValue({
                name: childrenDetail.name || '',
                dateOfBirth: childrenDetail.dateOfBirth || '',
                height: childrenDetail.height ? Number(childrenDetail.height) : 'NaN',
                weight: childrenDetail.weight ? Number(childrenDetail.weight) : 'NaN',
                medicalNote: childrenDetail.medicalNote || '',
                gender: childrenDetail.gender ? childrenDetail.gender : false,
            })
        }
    }, [childrenDetail, form])

    const handleUpdate = async (values: any) => {
        if (!id) return;
        const inputValues = {
            name: values.name,
            dateOfBirth: values.dateOfBirth,
            height: Number(values.height),
            weight: Number(values.weight),
            medicalNote: values.medicalNote,
            gender: values.gender,
        };
        try {
            await updateChildren({
                id,
                data: inputValues,
            }).unwrap();
            message.success('Cập nhật thông tin trẻ thành công!')
            onClose()
        } catch (err: any) {
            console.error('Lỗi từ API:', err); //
            message.error(err.data?.message || 'Không thể cập nhật thông tin trẻ');
        }
    };
    if (childrenDetailError) {
        const errorMessage = 'status' in childrenDetailError ? childrenDetailError.status : childrenDetailError.message;
        return (
            <Modal
                title="Lỗi"
                visible={visible}
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
            {childrenDetailLoading || chilrenDetailFetching ? (
                <LoadingOutlined
                    style={{
                        fontSize: '50px',
                        display: 'flex',
                        justifyContent: 'center',
                        alignItems: 'center',
                        height: '30vh',
                    }}
                />
            ) : childrenDetail ? (
                <Form
                    form={form}
                    layout='vertical'
                    onFinish={handleUpdate}
                    initialValues={{
                        name: childrenDetail.name,
                        dateOfBirth: childrenDetail.dateOfBirth,
                        height: childrenDetail.height,
                        weight: childrenDetail.weight,
                        medicalNote: childrenDetail.medicalNote,
                    }}
                >
                    <Form.Item
                        label='Child Name'
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
                        label='Height (cm)'
                        name='height'
                        rules={[{ required: true, type: 'number' }]}
                    >
                        <InputNumber style={{ width: '100%' }} min={1} />
                    </Form.Item>

                    <Form.Item
                        label='Weight (kg)'
                        name='weight'
                        rules={[{ required: true, type: 'number' }]}
                    >
                        <InputNumber style={{ width: '100%' }} min={1} />
                    </Form.Item>

                    <Form.Item
                        label='Medical Note'
                        name='medicalNote'
                    >
                        <Input />
                    </Form.Item>
                    <Form.Item
                        label="Gender"
                        name="gender"
                        valuePropName="checked" // Switch dùng "checked" thay vì "value"
                    >
                        <Switch />
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

export default ChildrenDetailModal;