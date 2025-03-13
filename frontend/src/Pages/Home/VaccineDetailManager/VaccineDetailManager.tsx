import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Form, Input, Button, Typography, message, Modal, Spin } from "antd";
import axios from "axios";

const { Title } = Typography;

export interface Vaccine {
  id: string;
  name: string;
  price: number;
  startRecommendedAge: number;
  endRecommendedAge: number;
  dosage: number;
  category: {
    name: string;
  };
  manufacturer: {
    name: string;
  };
}

const VaccineDetail: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();

  const [vaccine, setVaccine] = useState<Vaccine | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [form] = Form.useForm();

  // Fetch vaccine detail on mount
  useEffect(() => {
    axios
      .get(`https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`)
      .then((response) => {
        setVaccine(response.data.data); // assuming response.data.data contains the vaccine object
        form.setFieldsValue(response.data.data);
        setLoading(false);
      })
      .catch((error) => {
        message.error("Error fetching vaccine details: " + error.message);
        setLoading(false);
      });
  }, [id, form]);

  const handleSave = async (values: any) => {
    try {
      // Call update API (assumed to be PUT)
      await axios.put(
        `https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`,
        values
      );
      message.success("Vaccine updated successfully!");
      navigate("/manager/vaccine");
    } catch (error: any) {
      message.error("Error updating vaccine: " + error.message);
    }
  };

  const handleDelete = () => {
    Modal.confirm({
      title: "Are you sure you want to delete this vaccine?",
      content: `This action cannot be undone.`,
      okText: "Delete",
      okType: "danger",
      cancelText: "Cancel",
      onOk: async () => {
        try {
          await axios.delete(`https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/${id}`);
          message.success("Vaccine deleted successfully!");
          navigate("/manager/vaccine");
        } catch (error: any) {
          message.error("Error deleting vaccine: " + error.message);
        }
      },
    });
  };

  if (loading) {
    return (
      <div style={{ textAlign: "center", marginTop: "50px" }}>
        <Spin size="large" />
      </div>
    );
  }

  if (!vaccine) {
    return <div>No vaccine found.</div>;
  }

  return (
    <div style={{ padding: "24px" }}>
      <Title level={2}>Vaccine Details</Title>
      <Form
        form={form}
        layout="vertical"
        onFinish={handleSave}
        initialValues={vaccine}
      >
        {/* ID Field (Read-only) */}
        <Form.Item label="ID" name="id">
          <Input disabled />
        </Form.Item>
        {/* Name Field */}
        <Form.Item
          label="Name"
          name="name"
          rules={[{ required: true, message: "Please enter the vaccine name" }]}
        >
          <Input />
        </Form.Item>
        {/* Price Field */}
        <Form.Item
          label="Price"
          name="price"
          rules={[{ required: true, message: "Please enter the price" }]}
        >
          <Input type="number" />
        </Form.Item>
        {/* Recommended Age */}
        <Form.Item
          label="Recommended Age"
          style={{ marginBottom: 0 }}
        >
          <Form.Item
            name="startRecommendedAge"
            rules={[{ required: true, message: "Enter start age" }]}
            style={{ display: "inline-block", width: "calc(50% - 8px)" }}
          >
            <Input placeholder="Start Age" type="number" />
          </Form.Item>
          <span style={{ display: "inline-block", width: "16px", textAlign: "center" }}> - </span>
          <Form.Item
            name="endRecommendedAge"
            rules={[{ required: true, message: "Enter end age" }]}
            style={{ display: "inline-block", width: "calc(50% - 8px)" }}
          >
            <Input placeholder="End Age" type="number" />
          </Form.Item>
        </Form.Item>
        {/* Dosage Field */}
        <Form.Item
          label="Dosage"
          name="dosage"
          rules={[{ required: true, message: "Please enter the dosage" }]}
        >
          <Input />
        </Form.Item>
        {/* Category Name Field (Read-only, if desired) */}
        <Form.Item label="Category" name={["category", "name"]}>
          <Input disabled />
        </Form.Item>
        {/* Manufacturer Name Field (Read-only, if desired) */}
        <Form.Item label="Manufacturer" name={["manufacturer", "name"]}>
          <Input disabled />
        </Form.Item>
        {/* Description */}
        {/* <Form.Item
          label="Description"
          name="description"
          rules={[{ required: true, message: "Please enter the description" }]}
        >
          <Input.TextArea rows={3} />
        </Form.Item> */}

        <Form.Item>
          <div style={{ display: "flex", gap: "16px" }}>
            <Button type="primary" htmlType="submit">
              Save
            </Button>
            <Button danger onClick={handleDelete}>
              Delete
            </Button>
            <Button onClick={() => navigate("/manager/vaccine")}>
              Back
            </Button>
          </div>
        </Form.Item>
      </Form>
    </div>
  );
};

export default VaccineDetail;
