import { Form, Input, Button, Select, message, Spin, Typography } from 'antd'
import { useImportFacilitiesMutation } from '../../../features/facilities/facilitiesAPI'
import { useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI'
import { useParams, useNavigate } from 'react-router-dom'
import { Vaccines } from '../../../types/vaccine'
const { Title } = Typography

interface VaccineDataResponse {
  data: {
    data: {
      items: Vaccines[]
    }
  }
  isLoading: boolean
}

const ManagerFacilityImport: React.FC = () => {
  const { id } = useParams()
  const navigate = useNavigate()

  // Hook để lấy danh sách vaccine
  const { data: vaccineData, isLoading: vaccineLoading } =
    useGetVaccineListMiniMalQuery<VaccineDataResponse>({
      pageNumber: 1,
      pageSize: 100,
    })

  const [importFacilities, { isLoading }] = useImportFacilitiesMutation()
  const [form] = Form.useForm()

  // Xử lý khi submit form
  const handleSubmit = async (values: any) => {
    try {
      // Chuẩn bị dữ liệu để import
      const importData = {
        facilityId: id,
        vaccineImports: values.vaccineImports.map((vaccine: any) => ({
          vaccineId: vaccine.vaccineId,
          stock: vaccine.stock,
        })),
      }

      const dataResponse = (await importFacilities(importData).unwrap()) as {
        message: string
      }

      message.success(dataResponse.message)
      navigate(`/manager/facility/inventory/${id}`)
    } catch (error: any) {
      message.error(error.data.error)
    }
  }

  const handleSelectChange = (selectedValues: string[]) => {
    const selectedVaccines = selectedValues.map((vaccineId) => ({
      vaccineId,
      stock: '',
    }))
    form.setFieldsValue({ vaccineImports: selectedVaccines })
  }

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Nhập Vaccine vào Cơ Sở</Title>

      {vaccineLoading || isLoading ? (
        <div style={{ textAlign: 'center', marginTop: '50px' }}>
          <Spin size='large' />
        </div>
      ) : (
        <Form
          form={form}
          layout='vertical'
          onFinish={handleSubmit}
          style={{ maxWidth: '600px', margin: 'auto' }}
        >
          {/* Chọn danh sách vaccine */}
          <Form.Item
            label='Chọn Vaccine'
            name='selectedVaccines'
            rules={[
              { required: true, message: 'Vui lòng chọn ít nhất một vaccine' },
            ]}
          >
            <Select
              mode='multiple'
              placeholder='Chọn vaccine'
              onChange={handleSelectChange}
              allowClear
            >
              {vaccineData?.data.items.map((vaccine) => (
                <Select.Option key={vaccine.id} value={vaccine.id}>
                  {vaccine.name}
                </Select.Option>
              ))}
            </Select>
          </Form.Item>

          {/* Danh sách vaccine đã chọn */}
          <Form.List name='vaccineImports'>
            {(fields, { remove }) => (
              <>
                {fields.map(({ key, name, ...restField }) => {
                  const vaccineId = form.getFieldValue([
                    'vaccineImports',
                    name,
                    'vaccineId',
                  ])
                  const vaccine = vaccineData?.data.items.find(
                    (v) => v.id === vaccineId
                  )

                  return (
                    <div
                      key={key}
                      style={{
                        marginBottom: '12px',
                        borderBottom: '1px solid #ddd',
                        paddingBottom: '8px',
                      }}
                    >
                      {/* Hiển thị tên vaccine */}
                      <Form.Item
                        {...restField}
                        name={[name, 'vaccineId']}
                        hidden
                      >
                        <Input />
                      </Form.Item>

                      <Form.Item label='Vaccine'>
                        <Input value={vaccine?.name} disabled />
                      </Form.Item>

                      {/* Nhập số lượng stock */}
                      <Form.Item
                        {...restField}
                        name={[name, 'stock']}
                        label='Số Lượng'
                        rules={[
                          { required: true, message: 'Vui lòng nhập số lượng' },
                        ]}
                      >
                        <Input type='number' min={1} />
                      </Form.Item>

                      <Button
                        type='link'
                        onClick={() => {
                          remove(name)
                          const updatedVaccineImports =
                            form.getFieldValue('vaccineImports') || []
                          const updatedSelectedVaccines =
                            updatedVaccineImports.map((v: any) => v.vaccineId)
                          form.setFieldsValue({
                            selectedVaccines: updatedSelectedVaccines,
                          })
                        }}
                      >
                        Xóa Vaccine
                      </Button>
                    </div>
                  )
                })}
              </>
            )}
          </Form.List>

          <Form.Item>
            <Button type='primary' htmlType='submit' loading={isLoading}>
              {isLoading ? 'Đang Nhập...' : 'Nhập Vaccine'}
            </Button>
          </Form.Item>
        </Form>
      )}
    </div>
  )
}

export default ManagerFacilityImport
