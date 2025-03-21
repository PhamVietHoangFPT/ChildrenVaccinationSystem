import { useParams, useNavigate } from 'react-router-dom';
import {
  Form,
  Input,
  Button,
  Typography,
  message,
  Modal,
  Spin,
  Table,
  Space,
  Pagination,
} from 'antd';
import { DeleteOutlined } from '@ant-design/icons';
import {
  useGetPackageDetailQuery,
  useUpdatePackageMutation,
  useAddVaccineToPackageMutation,
  useDeleteVaccineFromPackageMutation,
} from '../../../features/package/packageAPI';
import { useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI';

import { Packages } from '../../../types/package';
import { Vaccines } from '../../../types/vaccine';
import {  useState } from 'react';

const { Title } = Typography;

interface PackageDetailResponse {
  data: {
    data: Packages;
    totalItems: number;
  };
  isLoading: boolean;
}


interface VaccinesListResponse {
  data: {
    
    data: {
      items: Vaccines[];
      totalItems: number;
    };
  };
  isLoading: boolean;
  isFetching: boolean;
}

const ManagerPackageDetail: React.FC = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const [loadingAddVaccine, setLoadingAddVaccine] = useState<boolean>(false);

  const { data, isLoading, refetch } = useGetPackageDetailQuery<PackageDetailResponse>(
    id as string
  );

    const [pageNumber, setPageNumber] = useState(1)
    const [pageSize, setPageSize] = useState(7)


  const { data: vaccineData, isLoading: vaccineDataLoading, isFetching: vaccineDataFetching } =
    useGetVaccineListMiniMalQuery<VaccinesListResponse>({
      pageNumber: pageNumber,
      pageSize: pageSize,
    });

  const [updatePackage] = useUpdatePackageMutation();
  const [addVaccineToPackage] = useAddVaccineToPackageMutation();
  const [deleteVaccineFromPackage] = useDeleteVaccineFromPackageMutation();

  const [form] = Form.useForm();

  const handleSave = async (values: any) => {
    try {
      console.log('Form values:', values);

      const packageData = {
        name: values.name,
        price: calculateTotalPrice(), 
        description: values.description || '',
      };

      const dataUpdate = (await updatePackage({
        id,
        data: packageData,
      }).unwrap()) as { message: string };

      message.success(dataUpdate.message);
    } catch (error: any) {
      message.error(error.message);
    }
  };

  const handleAddVaccineToPackage = async (vaccineId : string) => {
    try {
      setLoadingAddVaccine(true);
      await addVaccineToPackage({
        id: id as string,
        vaccineId: vaccineId,
      }).unwrap();
      
      message.success('Thêm vaccine thành công');
      // refetch(); // Refresh the data
    } catch (error : any) {
      message.error('Lỗi khi thêm vaccine: ' + (error.message || 'Unknown error'));
    } finally {
      setLoadingAddVaccine(false)
    }
  };

  const handleDeleteVaccine = (vaccineId: string) => {
    Modal.confirm({
      title: 'Xóa Vaccine khỏi Package',
      content: 'Bạn có chắc chắn muốn xóa vaccine này khỏi package?',
      okText: 'Xóa',
      okType: 'danger',
      cancelText: 'Hủy',
      onOk: async () => {
        try {
          await deleteVaccineFromPackage({
            id: id as string,
            vaccineId: vaccineId,
          }).unwrap();
          
          message.success('Xóa vaccine thành công');
          refetch(); 
        } catch (error: any) {
          message.error('Lỗi khi xóa vaccine: ' + error.message);
        }
      },
    });
  };

  const transformedVaccines = data?.data.packageItems?.map((item) => item.vaccine) || [];
  console.log('Transformed Vaccines:', transformedVaccines);

  const calculateTotalPrice = () => {
    
    return data.data.packageItems.reduce((sum, item) => {
      if (item.vaccine && typeof item.vaccine.price === 'number') {
        return sum + item.vaccine.price;
      }
      return sum;
    }, 0);
  };

  if (isLoading) {
    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <Spin size="large" />
      </div>
    );
  }

  if (!data) {
    return <div>Không tìm thấy Package</div>;
  }

  const initialValues = {
    ...data.data,
  };

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>Thông tin Package</Title>
      <Form
        form={form}
        layout="vertical"
        onFinish={handleSave}
        initialValues={initialValues}
      >
        <Form.Item name="id" hidden>
          <Input />
        </Form.Item>

        <Form.Item
          label="Tên Package"
          name="name"
          rules={[{ required: true, message: 'Vui lòng nhập tên Package' }]}
        >
          <Input />
        </Form.Item>

        <Form.Item label="Giá tự động (dựa trên giá vaccine)">
          <Input value={new Intl.NumberFormat('en-US').format(calculateTotalPrice())} disabled />
        </Form.Item>

        <Form.Item label="Mô tả" name="description">
          <Input.TextArea rows={3} />
        </Form.Item>

        <div>
          <Table
            dataSource={vaccineData?.data.items}
            loading={vaccineDataLoading|| vaccineDataFetching }
            rowKey="id"
            pagination={false}
            columns={[
              {
                title: 'Tên',
                dataIndex: 'name',
                key: 'name',
              },
              {
                title: 'Giá',
                dataIndex: 'price',
                key: 'price',
                render: (price) => `${new Intl.NumberFormat('en-US').format(price || 0)} `,
              },
              {
                title: 'Hành động',
                key: 'action',
                render: (_, record) => (
                  <Space size="middle">
                    <Button
                      type="primary"
                      onClick={() => handleAddVaccineToPackage(record.id)}
                      disabled={transformedVaccines?.some(
                        (transformedVaccine) => transformedVaccine.id === record.id
                      )}
                      loading={loadingAddVaccine}
                    >
                      Thêm
                    </Button>
                  </Space>
                ),
              }
              
            ]}
          />
          {!vaccineDataLoading && (
        <Pagination
          current={pageNumber}
          pageSize={pageSize}
          total={vaccineData?.data.totalItems}
          style={{ textAlign: 'center' }}
          align='center'
          onChange={(page, size) => {
            setPageNumber(page)
            setPageSize(size)
          }}
        />
      )}
        </div>

        <div style={{ marginBottom: '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '10px' }}>
            <Title level={4}>Danh sách Vaccine</Title>
          </div>
          
          <Table
            dataSource={transformedVaccines}
            rowKey="id"

            columns={[
              {
                title: 'Tên',
                dataIndex: 'name',
                key: 'name',
              },
              {
                title: 'Giá',
                dataIndex: 'price',
                key: 'price',
                render: (price) => `${new Intl.NumberFormat('en-US').format(price || 0)} `,
              },
              {
                title: 'Hành động',
                key: 'action',
                render: (_, record) => (
                  <Space size="middle">
                    <Button
                      danger
                      icon={<DeleteOutlined />}
                      onClick={() => handleDeleteVaccine(record.id)}
                    >
                      Xóa
                    </Button>
                  </Space>
                ),
              },
            ]}
          />
        
      
        </div>

        <Form.Item>
          <div style={{ display: 'flex', gap: '16px' }}>
            <Button type="primary" htmlType="submit">
              Lưu
            </Button>
            <Button onClick={() => navigate('/manager/package')}>
              Trở lại
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  );
};

export default ManagerPackageDetail;