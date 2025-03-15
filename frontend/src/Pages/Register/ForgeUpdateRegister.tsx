import {
  Form,
  Input,
  Button,
  DatePicker,
  Radio,
  message,
  Card,
  Row,
  Col,
} from 'antd'
import { Formik, Form as FormikForm, Field, ErrorMessage } from 'formik'
import * as Yup from 'yup'
import { useForceUpdateAccountMutation } from '../../features/account/accountAPI'
import Cookies from 'js-cookie'
import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import './errorMessage.css'

const validationSchema = Yup.object().shape({
  account: Yup.object().shape({
    dateOfBirth: Yup.date()
      .nullable()
      .required('Vui lòng chọn ngày sinh')
      .max(new Date(), 'Ngày sinh không được lớn hơn ngày hiện tại'),

    phoneNumber: Yup.string()
      .matches(
        /^(0[3-9][0-9]{8}|84[3-9][0-9]{8})$/,
        'Số điện thoại không hợp lệ'
      )
      .required('Vui lòng nhập số điện thoại'),

    address: Yup.string()
      .min(5, 'Địa chỉ quá ngắn')
      .max(100, 'Địa chỉ không được quá 100 ký tự')
      .required('Vui lòng nhập địa chỉ'),

    gender: Yup.boolean()
      .oneOf([true, false], 'Vui lòng chọn giới tính')
      .required('Vui lòng chọn giới tính'),
  }),

  child: Yup.object().shape({
    name: Yup.string()
      .matches(/^[\p{L} ]+$/u, 'Tên không được chứa số hoặc ký tự đặc biệt')
      .min(2, 'Tên quá ngắn')
      .max(50, 'Tên không được quá 50 ký tự')
      .required('Vui lòng nhập tên'),

    dateOfBirth: Yup.date()
      .nullable()
      .required('Vui lòng chọn ngày sinh')
      .max(new Date(), 'Ngày sinh không được lớn hơn ngày hiện tại')
      .test(
        'child-dateOfBirth',
        'Ngày sinh của con phải sau ngày sinh của cha/mẹ',
        function (value) {
          const parentDateOfBirth = this.options.context
            ? this.options.context.account.dateOfBirth
            : ''
          const childDOB = new Date(value)
          const parentDOB = new Date(parentDateOfBirth)
          return childDOB > parentDOB // Kiểm tra con có sinh sau cha/mẹ không
        }
      ),

    gender: Yup.boolean()
      .oneOf([true, false], 'Vui lòng chọn giới tính')
      .required('Vui lòng chọn giới tính'),

    medicalNote: Yup.string()
      .max(200, 'Ghi chú y tế không được quá 200 ký tự')
      .nullable(),
  }),
})

export default function ForceUpdateAccount() {
  const [forceUpdateAccount, { isLoading }] = useForceUpdateAccountMutation()
  const navigate = useNavigate()
  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null
  useEffect(() => {
    if (userData?.PhoneNumber || userData?.Address) {
      navigate('/')
    }
  }, [userData, navigate])

  const handleSubmit = async (values: any) => {
    try {
      const formattedValues = {
        ...values,
        account: {
          ...values.account,
          dateOfBirth: values.account.dateOfBirth
            ? new Date(values.account.dateOfBirth).toISOString().split('T')[0]
            : null,
        },
        child: {
          ...values.child,
          dateOfBirth: values.account.dateOfBirth
            ? new Date(values.account.dateOfBirth).toISOString().split('T')[0]
            : null,
        },
      }
      const data = await forceUpdateAccount(formattedValues).unwrap()
      message.success(data.message)
      const updatedUserData = {
        ...userData,
        PhoneNumber: formattedValues.account.phoneNumber,
        Address: formattedValues.account.address,
      }
      Cookies.remove('userData')
      Cookies.set('userData', JSON.stringify(updatedUserData))
      navigate('/')
    } catch (error: any) {
      console.log(error)
      message.error('Có lỗi xảy ra')
    }
  }

  return (
    <div style={{ maxWidth: 600, margin: '0 auto' }}>
      <Formik
        initialValues={{
          account: {
            dateOfBirth: null,
            phoneNumber: '',
            address: '',
            gender: true,
          },
          child: {
            name: '',
            dateOfBirth: null,
            height: null,
            weight: null,
            gender: true,
            medicalNote: '',
          },
        }}
        validationSchema={validationSchema} // Không cần lồng thêm một lần nữa
        onSubmit={handleSubmit}
      >
        {({ values, setFieldValue }) => (
          <FormikForm>
            {/* Thông Tin Tài Khoản */}
            <Card title='Thông Tin Tài Khoản' style={{ marginBottom: 20 }}>
              <Row gutter={16}>
                <Col span={12}>
                  <Form.Item>
                    <DatePicker
                      placeholder='Ngày sinh'
                      onChange={(date) =>
                        setFieldValue(
                          'account.dateOfBirth',
                          date ? date.toISOString() : null
                        )
                      }
                      style={{ width: '100%' }}
                    />
                    <ErrorMessage
                      name='account.dateOfBirth'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item>
                    <Radio.Group
                      onChange={(e) =>
                        setFieldValue('account.gender', e.target.value)
                      }
                      value={values.account.gender}
                    >
                      <Radio value={true}>Nam</Radio>
                      <Radio value={false}>Nữ</Radio>
                    </Radio.Group>
                    <ErrorMessage
                      name='account.gender'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
              </Row>

              <Row gutter={16}>
                <Col span={12}>
                  <Form.Item>
                    <Field
                      as={Input}
                      name='account.phoneNumber'
                      placeholder='Số điện thoại'
                    />
                    <ErrorMessage
                      name='account.phoneNumber'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item>
                    <Field
                      as={Input}
                      name='account.address'
                      placeholder='Địa chỉ'
                    />
                    <ErrorMessage
                      name='account.address'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
              </Row>
            </Card>

            {/* Thông Tin Trẻ */}
            <Card title='Thông Tin Trẻ'>
              <Row gutter={16}>
                <Col span={24}>
                  <Form.Item>
                    <Field as={Input} name='child.name' placeholder='Tên trẻ' />
                    <ErrorMessage
                      name='child.name'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
              </Row>

              <Row gutter={16}>
                <Col span={12}>
                  <Form.Item>
                    <DatePicker
                      placeholder='Ngày sinh'
                      onChange={(date) =>
                        setFieldValue(
                          'child.dateOfBirth',
                          date ? date.toISOString() : null
                        )
                      }
                      style={{ width: '100%' }}
                    />
                    <ErrorMessage
                      name='child.dateOfBirth'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item>
                    <Radio.Group
                      onChange={(e) =>
                        setFieldValue('child.gender', e.target.value)
                      }
                      value={values.child.gender}
                    >
                      <Radio value={true}>Nam</Radio>
                      <Radio value={false}>Nữ</Radio>
                    </Radio.Group>
                    <ErrorMessage
                      name='child.gender'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
              </Row>

              <Row>
                <Col span={24}>
                  <Form.Item>
                    <Field
                      as={Input.TextArea}
                      name='child.medicalNote'
                      placeholder='Ghi chú y tế'
                    />
                    <ErrorMessage
                      name='child.medicalNote'
                      component='div'
                      className='error-message'
                    />
                  </Form.Item>
                </Col>
              </Row>
            </Card>

            <Button
              type='primary'
              htmlType='submit'
              style={{ marginTop: 20, width: '100%' }}
              loading={isLoading}
            >
              Cập nhật thông tin
            </Button>
          </FormikForm>
        )}
      </Formik>
    </div>
  )
}
