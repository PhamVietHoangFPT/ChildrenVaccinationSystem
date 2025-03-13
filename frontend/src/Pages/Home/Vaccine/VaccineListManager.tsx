import React, { useState, useEffect } from "react";
import { Table, Button, Input, message } from "antd";
import type { ColumnsType } from "antd/es/table";
import { EyeOutlined, SearchOutlined } from "@ant-design/icons";
import axios from "axios";
import { useNavigate } from "react-router-dom";

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

const ManagerVaccineList: React.FC = () => {
  const [vaccines, setVaccines] = useState<Vaccine[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [searchText, setSearchText] = useState<string>("");
  const navigate = useNavigate();

  const fetchVaccines = async () => {
    try {
      const response = await axios.get(
        "https://childrenvaccinationswd2025-hwdzb7evepg7d4bv.eastasia-01.azurewebsites.net/api/vaccines/minimal?pageNumber=-1&pageSize=-1"
      );
      const vaccinesData: Vaccine[] = response.data.data.items;
      setVaccines(vaccinesData);
      setLoading(false);
    } catch (error: any) {
      message.error("Error fetching vaccines: " + error.message);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchVaccines();
  }, []);

  const filteredVaccines = vaccines.filter((vaccine) =>
    vaccine.name.toLowerCase().includes(searchText.toLowerCase())
  );

  const columns: ColumnsType<Vaccine> = [
    {
      title: "Name",
      dataIndex: "name",
      key: "name",
      sorter: (a, b) => a.name.localeCompare(b.name),
    },
    {
      title: "Category",
      dataIndex: ["category", "name"],
      key: "category",
    },
    {
      title: "Manufacturer",
      dataIndex: ["manufacturer", "name"],
      key: "manufacturer",
    },
    {
      title: "Price",
      dataIndex: "price",
      key: "price",
      render: (price) => (price ? `$${price}` : "N/A"),
      sorter: (a, b) => a.price - b.price,
    },
    {
      title: "Recommended Age",
      key: "recommendedAge",
      render: (_, record) =>
        `${record.startRecommendedAge} - ${record.endRecommendedAge} years`,
    },
    {
      title: "Dosage",
      dataIndex: "dosage",
      key: "dosage",
    },
    {
      title: "Actions",
      key: "actions",
      render: (_, record) => (
        <Button
          type="primary"
          icon={<EyeOutlined />}
          onClick={() => navigate(`/manager/vaccine/${record.id}`)}
        >
          Details
        </Button>
      ),
    },
  ];

  return (
    <div style={{ padding: 24 }}>
      <h2>Vaccine List</h2>

      <div style={{ marginBottom: 16, display: "flex", gap: 8 }}>
        <Input
          placeholder="Search by vaccine name"
          prefix={<SearchOutlined />}
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
          style={{ width: 300 }}
        />

      </div>
      <Table
        dataSource={filteredVaccines}
        columns={columns}
        rowKey="id"
        loading={loading}
      />
    </div>
  );
};

export default ManagerVaccineList;
