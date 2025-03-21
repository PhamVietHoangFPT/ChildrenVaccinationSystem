import React, { useEffect } from 'react'
import {
    Modal,
    Button,
    Form,
    Typography,
    message,
    Input,
    DatePicker,
} from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
import dayjs from 'dayjs'
import { Vaccination } from '../../../types/vaccination'
import { useGetVaccinationDetailQuery, useUpdateVaccinationMutation } from '../../../features/vaccinations/vaccinationAPI'

interface VaccinationDetailResponse {
    data: {
        data: Vaccination
    }
    isLoading: boolean
    isFetching: boolean
    error: any
}

interface VaccinationUpdateModalProps {
    visible: boolean
    id: string | null
    onClose: () => void
}

const { Text } = Typography

const VaccinationUpdateModal: React.FC<VaccinationUpdateModalProps> = ({
    visible,
    id,
    onClose,
}) => {
    const {
        data: vaccinationDetailData,
        isLoading: vaccinationDetailLoading,
        isFetching: vaccinationDetailFetching,
        error: vaccinationDetailError,
    } = useGetVaccinationDetailQuery<VaccinationDetailResponse>(id, {
        skip: !id,
    })

    const [updateVaccination, { isLoading: isUpdating }] =
        useUpdateVaccinationMutation()

    const vaccinationDetail = vaccinationDetailData?.data ?? null
    const [form] = Form.useForm()

    useEffect(() => {
        if (vaccinationDetail) {
            form.setFieldsValue({
                price: vaccinationDetail.price || 0,
                schedule: vaccinationDetail.schedule ? dayjs(vaccinationDetail.schedule) : null,
                note: vaccinationDetail.note || '',
                childName: vaccinationDetail.child?.name || '',
                vaccineName: vaccinationDetail.vaccine?.name || '',
                doctorName: vaccinationDetail.doctor?.name || '',
                vaccinatorName: vaccinationDetail.vaccinator?.name || '',
            })
        }
    }, [vaccinationDetail, form])

    const handleUpdate = async (values: any) => {
        if (!id) return
        const inputValues = {
            price: Number(values.price),
            schedule: values.schedule ? dayjs(values.schedule).format('YYYY-MM-DD') : null,
            note: values.note,
            doctor: {
                name: values.doctorName
            },
            vaccinator: {
                name: values.vaccinatorName
            },
        }

        try {
            await updateVaccination({
                id,
                data: inputValues,
            }).unwrap()
            message.success('Vaccination updated successfully!')
            onClose()
        } catch (err: any) {
            console.error('API Error:', err)
            message.error(err.data?.message || 'Failed to update vaccination')
        }
    }

    if (vaccinationDetailError) {
        const errorMessage =
            'status' in vaccinationDetailError
                ? vaccinationDetailError.status
                : vaccinationDetailError.message
        return (
            <Modal
                title='Error'
                visible={visible}
                onCancel={onClose}
                footer={<Button onClick={onClose}>Close</Button>}
            >
                <Text type='danger'>Error: {errorMessage}</Text>
            </Modal>
        )
    }
    return (
        <Modal
            title='Update Vaccination Details'
            visible={visible}
            onCancel={onClose}
            footer={[
                <Button key='close' onClick={onClose}>
                    Cancel
                </Button>,
            ]}
        >
            {vaccinationDetailLoading || vaccinationDetailFetching ? (
                <LoadingOutlined
                    style={{
                        fontSize: '50px',
                        display: 'flex',
                        justifyContent: 'center',
                        alignItems: 'center',
                        height: '30vh',
                    }}
                />
            ) : vaccinationDetail ? (
                <Form
                    form={form}
                    layout='vertical'
                    onFinish={handleUpdate}
                    initialValues={{
                        price: vaccinationDetail.price,
                        schedule: vaccinationDetail.schedule
                            ? dayjs(vaccinationDetail.schedule)
                            : null,
                        note: vaccinationDetail.note,
                        childName: vaccinationDetail.child?.name,
                        vaccineName: vaccinationDetail.vaccine?.name,
                        doctorName: vaccinationDetail.doctor?.name,
                        vaccinatorName: vaccinationDetail.vaccinator?.name,
                    }}
                >
                    <Form.Item
                        label='Child Name'
                        name='childName'
                    >
                        <Input disabled />
                    </Form.Item>

                    <Form.Item
                        label='Vaccine Name'
                        name='vaccineName'
                    >
                        <Input disabled />
                    </Form.Item>

                    <Form.Item
                        label='Price'
                        name='price'
                    >
                        <Input disabled />
                    </Form.Item>

                    <Form.Item
                        label='Schedule Date'
                        name='schedule'
                        rules={[{ required: true, message: 'Please select a schedule date' }]}
                    >
                        <DatePicker
                            disabledDate={(current) => current && current < dayjs().startOf('day')}
                            style={{ width: '100%' }}
                            format='YYYY-MM-DD'
                        />
                    </Form.Item>

                    <Form.Item
                        label='Doctor'
                        name='doctorName'
                    >
                        <Input placeholder='Enter doctor name' />
                    </Form.Item>

                    <Form.Item
                        label='Vaccinator Name'
                        name='vaccinatorName'
                    >
                        <Input placeholder='Enter vaccinator name' />
                    </Form.Item>

                    <Form.Item
                        label='Note'
                        name='note'
                    >
                        <Input.TextArea rows={3} />
                    </Form.Item>

                    <Button
                        type='primary'
                        htmlType='submit'
                        loading={isUpdating}
                    >
                        Update Vaccination
                    </Button>
                </Form>
            ) : (
                <p>No vaccination data available</p>
            )}
        </Modal>
    )
}

export default VaccinationUpdateModal