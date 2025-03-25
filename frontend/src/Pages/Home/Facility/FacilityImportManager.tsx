import { Form, Input, Button, Select, message, Spin, Typography } from 'antd';
import { useImportFacilitiesMutation } from '../../../features/facilities/facilitiesAPI';
import {   useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI';
import { useParams, useNavigate } from 'react-router-dom';

const { Title } = Typography;

const ManagerFacilityImport: React.FC = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  // Hook to fetch vaccine list
  const { data: vaccineData, isLoading: vaccineLoading } = useGetVaccineListMiniMalQuery({ pageNumber: 1, pageSize: 100 });

  const [, { isLoading }] = useImportFacilitiesMutation();
  const [form] = Form.useForm();

  // Handle form submission
  const handleSubmit = async (values: any) => {
    try {
      // Prepare the data for import
      const importData = {
        facilityId: id, 
        vaccineImports: values.vaccineImports.map((vaccine: any) => ({
          vaccineId: vaccine.vaccineId,
          stock: vaccine.stock,
        }))
      };

      await useImportFacilitiesMutation(importData); 

      message.success('Vaccines imported successfully');
      navigate(`/manager/facility/${id}`);
    } catch (error: any) {
      message.error('Error importing vaccines: ' + (error.message || 'Unknown error'));
    }
  };

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Import Vaccine to Facility</Title>

      {vaccineLoading || isLoading ? (
        <div style={{ textAlign: 'center', marginTop: '50px' }}>
          <Spin size="large" />
        </div>
      ) : (
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
          style={{ maxWidth: '600px', margin: 'auto' }}
        >
          {/* Dynamic Vaccine Select */}
          <Form.Item
            label="Select Vaccines"
            name="vaccineImports"
            rules={[{ required: true, message: 'Please select at least one vaccine' }]}
          >
            <Select
              mode="multiple"
              placeholder="Select vaccines"
              optionLabelProp="label"
              allowClear
            >
              {vaccineData?.data.items.map((vaccine: any) => (
                <Select.Option key={vaccine.id} value={vaccine.id} label={vaccine.name}>
                  {vaccine.name}
                </Select.Option>
              ))}
            </Select>
          </Form.Item>

          <Form.List
            name="vaccineImports"
            initialValue={[]}
            rules={[
              {
                validator: async(_, names) => {
                  if (!names || names.length < 1) {
                    return Promise.reject(new Error('At least one vaccine import is required'));
                  }
                },
              },
            ]}
          >
            {(fields, { add, remove }) => (
              <>
                {fields.map(({ key, fieldKey, name, fieldNames, ...restField }) => (
                  <div key={key} style={{ marginBottom: '8px' }}>
                    <Form.Item
                      {...restField}
                      name={[name, 'vaccineId']}
                      fieldKey={[fieldKey, 'vaccineId']}
                      label="Vaccine"
                      rules={[{ required: true, message: 'Please select a vaccine' }]}
                    >
                      <Select
                        placeholder="Select vaccine"
                        style={{ width: '100%' }}
                      >
                        {vaccineData?.data.items.map((vaccine: any) => (
                          <Select.Option key={vaccine.id} value={vaccine.id}>
                            {vaccine.name}
                          </Select.Option>
                        ))}
                      </Select>
                    </Form.Item>

                    <Form.Item
                      {...restField}
                      name={[name, 'stock']}
                      fieldKey={[fieldKey, 'stock']}
                      label="Stock"
                      rules={[{ required: true, message: 'Please enter stock' }]}
                    >
                      <Input type="number" min={1} />
                    </Form.Item>

                    <Button type="link" onClick={() => remove(name)}>
                      Remove Vaccine
                    </Button>
                  </div>
                ))}
                <Form.Item>
                  <Button type="dashed" onClick={() => add()} block>
                    + Add Vaccine
                  </Button>
                </Form.Item>
              </>
            )}
          </Form.List>

          <Form.Item>
            <Button type="primary" htmlType="submit" loading={isLoading}>
              {isLoading ? 'Importing...' : 'Import Vaccines'}
            </Button>
          </Form.Item>
        </Form>
      )}
    </div>
  );
};

export default ManagerFacilityImport;
