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
} from 'antd';
import { DeleteOutlined, PlusOutlined } from '@ant-design/icons';
import {
  useGetPackageDetailQuery,
  useUpdatePackageMutation,
  useAddVaccineToPackageMutation,
  useDeleteVaccineFromPackageMutation,
} from '../../../features/package/packageAPI';
import { useGetVaccineListMiniMalQuery } from '../../../features/vaccine/vaccineAPI';

import { Packages } from '../../../types/package';
import { Vaccines } from '../../../types/vaccine';

const { Title } = Typography;

interface PackageDetailResponse {
  data: {
    data: Packages;
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
}

const ManagerPackageDetail: React.FC = () => {
  const navigate = useNavigate();
  const { id } = useParams();

  const { data, isLoading, refetch } = useGetPackageDetailQuery<PackageDetailResponse>(
    id as string
  );

  const { data: vaccineData, isLoading: vaccineLoading } =
    useGetVaccineListMiniMalQuery<VaccinesListResponse>({
      pageNumber: -1,
      pageSize: -1,
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

  const handleAddVaccine = () => {
    console.log('Vaccine Data:', vaccineData);
    console.log('Package Vaccines:', data?.data.vaccines);
  
    // Lọc các vaccine chưa có trong package
    const availableVaccines = vaccineData?.data.items.filter(
      (v) => !data?.data.vaccines?.some((pv) => pv.id === v.id)
    );
  
    console.log('Available Vaccines:', availableVaccines);
  
    Modal.info({
      title: 'Thêm Vaccine vào Package',
      content: (
        <div>
          <Table
            dataSource={availableVaccines}
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
                render: (price) => `${new Intl.NumberFormat('en-US').format(price)} `,
              },
              {
                title: 'Hành động',
                key: 'action',
                render: (_, record) => (
                  <Button
                    type="primary"
                    onClick={() => {
                      addVaccineToPackage({
                        id: id as string,
                        vaccineId: record.id,
                      })
                        .then(() => {
                          message.success('Thêm vaccine thành công');
                          Modal.destroyAll();
                          refetch();
                        })
                        .catch((err) => {
                          message.error('Lỗi khi thêm vaccine: ' + err.message);
                        });
                    }}
                  >
                    Thêm
                  </Button>
                ),
              },
            ]}
          />
        </div>
      ),
      width: 800,
    });
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
    if (!data?.data.vaccines || data.data.vaccines.length === 0) {
      return 0;
    }
    
    return data.data.vaccines.reduce((sum, vaccine) => sum + (vaccine.price || 0), 0);
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

        <div style={{ marginBottom: '20px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '10px' }}>
            <Title level={4}>Danh sách Vaccine</Title>
            <Button type="primary" icon={<PlusOutlined />} onClick={handleAddVaccine}>
              Thêm Vaccine
            </Button>
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