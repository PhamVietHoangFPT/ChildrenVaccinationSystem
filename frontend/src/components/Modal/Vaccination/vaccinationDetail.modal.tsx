import React, { useEffect } from 'react'
import {
  Modal,
  Button,
  Form,
  Typography,
  message,
  Input,
  DatePicker,
  Select,
} from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
import dayjs from 'dayjs'
import { Vaccination } from '../../../types/vaccination'
import {
  useGetVaccinationDetailQuery,
  useUpdateVaccinationMutation,
} from '../../../features/vaccinations/vaccinationAPI'
import Cookies from 'js-cookie'
import { Staff } from '../../../types/staff'
import { useGetStaffListQuery } from '../../../features/staff/staffAPI'

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
interface StaffListResponse {
  data: {
    data: {
      items: Staff[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
  error: any
}

const { Text } = Typography
const { Option } = Select

const VaccinationUpdateModal: React.FC<VaccinationUpdateModalProps> = ({
  visible,
  id,
  onClose,
}) => {
  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null
  const facilityId = userData?.Facility || ''

  const {
    data: doctorData,
    isFetching: doctorFetching,
    isLoading: doctorLoading,
    error: doctorError,
  } = useGetStaffListQuery<StaffListResponse>(
    {
      role: 2,
      facilityId: facilityId,
      pageNumber: -1,
      pageSize: -1,
    },
    { skip: !facilityId }
  )
  const dataDoctor = doctorData?.data?.items || []

  const {
    data: vaccinatorData,
    isFetching: vaccinatorFetching,
    isLoading: vaccinatorLoading,
    error: vaccinatorError,
  } = useGetStaffListQuery<StaffListResponse>(
    {
      role: 3,
      facilityId: facilityId,
      pageNumber: -1,
      pageSize: -1,
    },
    { skip: !facilityId }
  )
  const dataVaccinator = vaccinatorData?.data?.items || []

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
      console.log('Vaccination Detail:', vaccinationDetail)
      form.setFieldsValue({
        price: vaccinationDetail.price || 0,
        schedule: vaccinationDetail.schedule
          ? dayjs(vaccinationDetail.schedule)
          : null,
        note: vaccinationDetail.note || '',
        childName: vaccinationDetail.child?.name || '',
        vaccineName: vaccinationDetail.vaccine?.name || '',
        doctorId: vaccinationDetail.doctor?.id || undefined,
        vaccinatorId: vaccinationDetail.vaccinator?.id || undefined,
      })
    }
  }, [vaccinationDetail, form])

  const handleUpdate = async (values: any) => {
    if (!id) {
      message.error('No vaccination ID provided')
      return
    }
    const inputValues = {
      schedule: values.schedule
        ? dayjs(values.schedule).format('YYYY-MM-DD')
        : null,
      note: values.note || '',
      doctorId: values.doctorId,
      vaccinatorId: values.vaccinatorId,
    }
    console.log('Submitting values:', inputValues)

    try {
      await updateVaccination({
        id,
        data: inputValues,
      }).unwrap()
      message.success('Vaccination updated successfully!')
      onClose()
    } catch (err: any) {
      console.error('Update Error:', err)
      message.error(err.data?.message || 'Failed to update vaccination')
    }
  }

  if (vaccinationDetailError || doctorError || vaccinatorError) {
    const errorMessage =
      vaccinationDetailError?.status ||
      doctorError?.status ||
      vaccinatorError?.status ||
      'Unknown error'
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

  // Determine if doctor and vaccinator should be disabled based on status
  const isDoctorDisabled = vaccinationDetail?.status !== 1
  const isVaccinatorDisabled = vaccinationDetail?.status !== 3
  const isScheduleDisabled = vaccinationDetail?.status === 1 || vaccinationDetail?.status === 0
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
            doctorId: vaccinationDetail.doctor?.id,
            vaccinatorId: vaccinationDetail.vaccinator?.id,
          }}
        >
          <Form.Item label='Child Name' name='childName'>
            <Input disabled />
          </Form.Item>

          <Form.Item label='Vaccine Name' name='vaccineName'>
            <Input disabled />
          </Form.Item>

          <Form.Item label='Price' name='price'>
            <Input disabled />
          </Form.Item>

          <Form.Item
            label='Schedule Date'
            name='schedule'
            rules={[
              { required: isScheduleDisabled, message: 'Please select a schedule date' },
            ]}
          >
            <DatePicker
              disabledDate={(current) =>
                current && current < dayjs().startOf('day')
              }
              style={{ width: '100%' }}
              format='YYYY-MM-DD'
              disabled={!isScheduleDisabled}
            />
          </Form.Item>

          <Form.Item
            label='Doctor'
            name='doctorId'
            rules={[
              {
                required: !isDoctorDisabled,
                message: 'Please select a doctor',
              },
            ]}
          >
            <Select
              showSearch
              placeholder='Select a doctor'
              optionFilterProp='children'
              filterOption={(input, option) =>
                (option?.children as unknown as string)
                  ?.toLowerCase()
                  .includes(input.toLowerCase())
              }
              loading={doctorLoading || doctorFetching}
              disabled={isDoctorDisabled}
              notFoundContent={
                doctorLoading ? 'Loading...' : 'No doctors found'
              }
            >
              {dataDoctor.map((doctor) => (
                <Option key={doctor.id} value={doctor.id}>
                  {doctor.name}
                </Option>
              ))}
            </Select>
          </Form.Item>

          <Form.Item label='Vaccinator' name='vaccinatorId'>
            <Select
              showSearch
              placeholder='Select a vaccinator'
              optionFilterProp='children'
              filterOption={(input, option) =>
                (option?.children as unknown as string)
                  ?.toLowerCase()
                  .includes(input.toLowerCase())
              }
              loading={vaccinatorLoading || vaccinatorFetching}
              disabled={isVaccinatorDisabled}
              notFoundContent={
                vaccinatorLoading ? 'Loading...' : 'No vaccinators found'
              }
            >
              {dataVaccinator.map((vaccinator) => (
                <Option key={vaccinator.id} value={vaccinator.id}>
                  {vaccinator.name}
                </Option>
              ))}
            </Select>
          </Form.Item>

          <Form.Item label='Note' name='note'>
            <Input.TextArea rows={3} />
          </Form.Item>

          <Button type='primary' htmlType='submit' loading={isUpdating}>
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
