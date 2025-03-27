import { useParams } from 'react-router-dom'
import { useGetVaccinationDetailQuery } from '../../features/vaccinations/vaccinationAPI'
import { VaccinationHistoryDetail } from '../../types/vaccination'
import { Card, Col, Row, Spin, Typography } from 'antd'
import { LoadingOutlined } from '@ant-design/icons'
const { Title, Text } = Typography

interface VaccinationHistoryDetailResponse {
  data: {
    data: VaccinationHistoryDetail
  }
  isLoading: boolean
  isFetching: boolean
  message: string
}

export default function VaccinationsHistoryDetail() {
  const { vaccinationHistoryId } = useParams()
  const { data, isLoading } =
    useGetVaccinationDetailQuery<VaccinationHistoryDetailResponse>(
      vaccinationHistoryId as string
    )

  const vaccinationDetail = data?.data

  if (isLoading) {
    return (
      <div style={{ display: 'flex', justifyContent: 'center', marginTop: 50 }}>
        <Spin size='large' />
      </div>
    )
  }

  if (!vaccinationDetail) {
    return <Text type='danger'>Không tìm thấy dữ liệu</Text>
  }

  return isLoading ? (
    <LoadingOutlined
      style={{
        fontSize: '50px',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '30vh',
      }}
    />
  ) : (
    <Card
      title={<Title level={4}>Thông tin mũi tiêm</Title>}
      bordered={false}
      style={{
        maxWidth: 800,
        margin: '20px auto',
        borderRadius: 12,
        boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
      }}
    >
      {/* Nhóm Trẻ được tiêm */}
      <div
        style={{
          marginBottom: 16,
          padding: '12px',
          borderRadius: 8,
          background: '#f5f5f5',
        }}
      >
        <Title level={4} style={{ marginBottom: 8, marginTop: 0 }}>
          Thông tin trẻ
        </Title>
        <Text>
          <b>Tên trẻ:</b> {vaccinationDetail.child?.name}
        </Text>
        <br />
        <Text>
          <b>Mã người tiêm:</b> {vaccinationDetail.child?.childCode}
        </Text>
      </div>

      {/* Nhóm Thông tin ngày tiêm */}
      {vaccinationDetail.status !== 0 &&
        vaccinationDetail.status !== 1 &&
        vaccinationDetail.status !== 2 &&
        vaccinationDetail.status !== 3 &&
        vaccinationDetail.status !== 4 &&
        vaccinationDetail.status !== 5 &&
        vaccinationDetail.status !== 7 &&
        vaccinationDetail.status !== 8 && (
          <div
            style={{
              marginBottom: 16,
              padding: '12px',
              borderRadius: 8,
              background: '#f5f5f5',
            }}
          >
            <Title level={4} style={{ marginBottom: 8, marginTop: 0 }}>
              Thông tin ngày tiêm
            </Title>
            <Text>
              <b>Bác sĩ:</b> {vaccinationDetail.doctor?.name}
            </Text>
            <br />
            <Text>
              <b>Người tiêm:</b> {vaccinationDetail.vaccinator?.name}
            </Text>
            <br />
            {vaccinationDetail.facility?.id && (
              <Text>
                <b>Cơ sở y tế:</b> {vaccinationDetail.facility?.name} -{' '}
                {vaccinationDetail.facility?.address}
              </Text>
            )}
          </div>
        )}

      {/* Nhóm Thông tin vắc xin */}
      <div
        style={{
          marginBottom: 16,
          padding: '12px',
          borderRadius: 8,
          background: '#f5f5f5',
        }}
      >
        <Title level={4} style={{ marginBottom: 8, marginTop: 0 }}>
          Thông tin vắc xin
        </Title>
        <Text>
          <b>Vắc xin:</b> {vaccinationDetail.vaccine?.name}
        </Text>
        <br />
        <Text>
          <b>Loại:</b> {vaccinationDetail.vaccine?.category?.name}
        </Text>
      </div>

      {/* Nhóm Thông tin khác */}
      <Row gutter={[16, 16]}>
        <Col span={12}>
          <Text>
            <b>Ngày tiêm:</b>{' '}
            {new Date(vaccinationDetail.schedule).toLocaleDateString('vi-VN')}
          </Text>
        </Col>
      </Row>
      <div style={{ marginTop: 16 }}>
        <Text>
          <b>Ghi chú:</b>{' '}
          {vaccinationDetail.note ? vaccinationDetail.note : 'Không có'}
        </Text>
      </div>
    </Card>
  )
}
