// src/components/AddChildrenModal.tsx
import React, { useState } from 'react'
import {
  AutoComplete,
  Button,
  DatePicker,
  Form,
  Input,
  InputNumber,
  message,
  Modal,
  Switch,
} from 'antd'
import { useGetCustomerListQuery } from '../../features/customer/customerAPI'
import { Customer } from '../../types/customer'
import { useCreateChildrenMutation } from '../../features/children/childrenAPI'
import { LoadingOutlined } from '@ant-design/icons'
import dayjs from 'dayjs'
interface CustomerListResponse {
  data: {
    data: {
      items: Customer[]
      totalItems: number
    }
  }
  isLoading: boolean
  isFetching: boolean
}

interface AddChildrenModalProps {
  visible: boolean
  onClose: () => void
}

const AddChildrenModal: React.FC<AddChildrenModalProps> = ({
  visible,
  onClose,
}) => {
  const [form] = Form.useForm()
  const [parentId, setParentId] = useState<string | null>(null)
  const [searchValue, setSearchValue] = useState<string>('')

  const {
    data: customers,
    isFetching: customerFetching,
    isLoading: customerLoading,
  } = useGetCustomerListQuery<CustomerListResponse>({
    phoneNumber: undefined,
    pageNumber: 1,
    pageSize: 1000,
  })

  const [createChildren, { isLoading: isCreating }] =
    useCreateChildrenMutation()

  const parentOptions = (customers?.data.items || [])
    .filter((parent) => parent.phoneNumber)
    .map((parent) => ({
      value: parent.phoneNumber,
      label: `${parent.phoneNumber} ${parent.name ? `- ${parent.name}` : ''}`,
      parentId: parent.id,
    }))

  const handleSelectParent = (value: string, option: { parentId: string }) => {
    setParentId(option.parentId)
    setSearchValue(value)
  }

  const handleSearch = (value: string) => {
    setSearchValue(value)
    if (!value) setParentId(null)
  }

  const handleAddChildren = async (values: any) => {
    if (!parentId) {
      message.error('Vui lòng chọn phụ huynh trước khi thêm trẻ!')
      return
    }

    const childData = {
      name: values.name,
      dateOfBirth: values.dateOfBirth
        ? values.dateOfBirth.format('YYYY-MM-DD')
        : null,
      height: Number(values.height),
      weight: Number(values.weight),
      medicalNote: values.medicalNote || '',
      gender: values.gender ?? false,
    }

    console.log('Dữ liệu gửi đi:', { parentId, data: childData })

    try {
      await createChildren({ parentId, data: childData }).unwrap()
      message.success('Thêm trẻ thành công!')
      onClose()
    } catch (err: any) {
      console.error('Chi tiết lỗi từ API:', err.data)
      message.error(
        err.data?.title || err.data?.message || 'Không thể thêm trẻ'
      )
    }
  }

  return (
    <Modal
      title='Thêm trẻ mới'
      visible={visible}
      onCancel={onClose}
      footer={null}
    >
      {customerLoading ? (
        <div
          style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '200px',
          }}
        >
          <LoadingOutlined style={{ fontSize: '50px' }} />
        </div>
      ) : (
        <Form
          form={form}
          layout='vertical'
          onFinish={handleAddChildren}
          initialValues={{ gender: false }}
        >
          <Form.Item
            label='Chọn phụ huynh (số điện thoại)'
            name='parentPhone'
            rules={[{ required: true, message: 'Vui lòng chọn phụ huynh!' }]}
          >
            <AutoComplete
              options={parentOptions}
              placeholder='Nhập số điện thoại phụ huynh (ví dụ: 0909)'
              value={searchValue}
              onSearch={handleSearch}
              onSelect={handleSelectParent}
              filterOption={(inputValue, option) =>
                (option?.value?.toUpperCase() || '').indexOf(
                  inputValue.toUpperCase()
                ) !== -1 ||
                (option?.label?.toString().toUpperCase() || '').indexOf(
                  inputValue.toUpperCase()
                ) !== -1
              }
              disabled={customerFetching}
            />
          </Form.Item>

          <Form.Item
            label='Tên trẻ em'
            name='name'
            rules={[{ required: true, message: 'Please enter child name!' }]}
          >
            <Input placeholder='Nhập tên trẻ' />
          </Form.Item>

          <Form.Item
            label='Ngày sinh'
            name='dateOfBirth'
            rules={[{ required: true, message: 'Please enter date of birth' }]}
          >
            <DatePicker
              style={{ width: '100%' }}
              format='YYYY-MM-DD'
              placeholder='Select date of birth'
              disabledDate={(current) => current && current > dayjs()} // Prevent future dates
            />
          </Form.Item>

          <Form.Item
            label='Chiều cao (cm)'
            name='height'
            rules={[
              { required: true, message: 'Vui lòng nhập chiều cao!' },
              {
                type: 'number',
                min: 1,
                max: 60,
                message: 'Chiều cao không hợp lệ!',
              },
            ]}
          >
            <InputNumber
              style={{ width: '100%' }}
              min={1}
              placeholder='Nhập chiều cao'
            />
          </Form.Item>

          <Form.Item
            label='Cân nặng (kg)'
            name='weight'
            rules={[
              { required: true, message: 'Vui lòng nhập cân nặng!' },
              {
                type: 'number',
                min: 1,
                max: 6,
                message: 'Cân nặng không hợp lệ!',
              },
            ]}
          >
            <InputNumber
              style={{ width: '100%' }}
              min={1}
              placeholder='Nhập cân nặng'
            />
          </Form.Item>

          <Form.Item label='Ghi chú y tế' name='medicalNote'>
            <Input placeholder='Nhập ghi chú y tế (nếu có)' />
          </Form.Item>

          <Form.Item
            label='Giới tính (Nam: Bật, Nữ: Tắt)'
            name='gender'
            valuePropName='checked'
          >
            <Switch />
          </Form.Item>

          <Form.Item>
            <Button type='primary' htmlType='submit' loading={isCreating}>
              Thêm trẻ
            </Button>
            <Button style={{ marginLeft: 8 }} onClick={onClose}>
              Hủy
            </Button>
          </Form.Item>
        </Form>
      )}
    </Modal>
  )
}

export default AddChildrenModal
