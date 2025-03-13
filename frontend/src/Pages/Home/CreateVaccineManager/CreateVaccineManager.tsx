import React, { useEffect, useState } from "react";
import { Form, Input, Button, Typography, message, Select } from "antd";
import { useNavigate } from "react-router-dom";
import axios from "axios";

export interface VaccineFormValues {
  name: string;
  price: number;
  startRecommendedAge?: number;
  endRecommendedAge?: number;
  dosage?: number;
  dosageInterval?: number;
  sequence?: number;
  categoryId: string;
  manufacturerId: string;
  description?: string;
}

const { Title } = Typography;
const { Option } = Select;

const CreateVaccine: React.FC = () => {
  const [form] = Form.useForm();
  const navigate = useNavigate();

  // State for dropdown options
  const [categories, setCategories] = useState<{ id: string; name: string }[]>([]);
  const [manufacturers, setManufacturers] = useState<{ id: string; name: string }[]>([]);

  // Fetch categories
  useEffect(() => {
    axios
      .get("https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/categories?pageNumber=-1&pageSize=-1")
      .then((response) => {
        const cats = response.data.data.items;
        setCategories(cats);
      })
      .catch((error) => {
        message.error("Error fetching categories: " + error.message);
      });
  }, []);

  // Fetch manufacturers
  useEffect(() => {
    axios
      .get("https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/manufacturers?pageNumber=-1&pageSize=-1")
      .then((response) => {
        const mans = response.data.data.items;
        setManufacturers(mans);
      })
      .catch((error) => {
        message.error("Error fetching manufacturers: " + error.message);
      });
  }, []);

  const handleFinish = async (values: VaccineFormValues) => {
    try {
      // Build payload: convert numeric values if provided
      const payload = {
        ...values,
        price: Number(values.price),
        startRecommendedAge: values.startRecommendedAge !== undefined ? Number(values.startRecommendedAge) : undefined,
        endRecommendedAge: values.endRecommendedAge !== undefined ? Number(values.endRecommendedAge) : undefined,
        dosage: values.dosage !== undefined ? Number(values.dosage) : undefined,
        dosageInterval: values.dosageInterval !== undefined ? Number(values.dosageInterval) : undefined,
        sequence: values.sequence !== undefined ? Number(values.sequence) : undefined,
        category: { id: values.categoryId },
        manufacturer: { id: values.manufacturerId },
      };

      await axios.post(
        "https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines",
        payload
      );
      message.success("Vaccine created successfully!");
      navigate("/manager/vaccine");
    } catch (error: any) {
      message.error("Error creating vaccine: " + error.message);
    }
  };

  return (
    <div style={{ padding: 24 }}>
      <Title level={2} style={{ textAlign: "center" }}>
        Create Vaccine
      </Title>
      <Form
        form={form}
        layout="vertical"
        onFinish={handleFinish}
        style={{ maxWidth: 600, margin: "0 auto" }}
      >
        <Form.Item
          label="Name"
          name="name"
          rules={[{ required: true, message: "Please enter the vaccine name" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="Price"
          name="price"
          rules={[{ required: true, message: "Please enter the price" }]}
        >
          <Input type="number" />
        </Form.Item>
        <Form.Item label="Start Recommended Age" name="startRecommendedAge">
          <Input type="number" />
        </Form.Item>
        <Form.Item
          label="End Recommended Age"
          name="endRecommendedAge"
          rules={[
            ({ getFieldValue }) => ({
              validator(_, value) {
                const start = getFieldValue("startRecommendedAge");
                // Only validate if both values are provided
                if (value === undefined || start === undefined || value > start) {
                  return Promise.resolve();
                }
                return Promise.reject(
                  new Error("End Recommended Age must be greater than Start Recommended Age")
                );
              },
            }),
          ]}
        >
          <Input type="number" />
        </Form.Item>
        <Form.Item label="Dosage" name="dosage">
          <Input type="number" />
        </Form.Item>
        <Form.Item label="Dosage Interval" name="dosageInterval">
          <Input type="number" />
        </Form.Item>
        <Form.Item label="Sequence" name="sequence">
          <Input type="number" />
        </Form.Item>
        <Form.Item
          label="Category"
          name="categoryId"
          rules={[{ required: true, message: "Please select the category" }]}
        >
          <Select placeholder="Select a category">
            {categories.map((cat) => (
              <Option key={cat.id} value={cat.id}>
                {cat.name}
              </Option>
            ))}
          </Select>
        </Form.Item>
        <Form.Item
          label="Manufacturer"
          name="manufacturerId"
          rules={[{ required: true, message: "Please select the manufacturer" }]}
        >
          <Select placeholder="Select a manufacturer">
            {manufacturers.map((man) => (
              <Option key={man.id} value={man.id}>
                {man.name}
              </Option>
            ))}
          </Select>
        </Form.Item>
        <Form.Item label="Description" name="description">
          <Input.TextArea rows={3} />
        </Form.Item>
        <Form.Item>
          <Button type="primary" htmlType="submit">
            Create Vaccine
          </Button>
          <Button style={{ marginLeft: 16 }} onClick={() => navigate("/manager/vaccine")}>
            Cancel
          </Button>
        </Form.Item>
      </Form>
    </div>
  );
};

export default CreateVaccine;
