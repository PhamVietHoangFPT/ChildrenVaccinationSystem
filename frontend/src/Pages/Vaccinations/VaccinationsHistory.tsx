import {
  CheckCircleOutlined,
  LoadingOutlined,
  MinusCircleOutlined,
} from '@ant-design/icons'
import { useGetVaccinationsHistoryQuery } from '../../features/vaccinations/vaccinationAPI'
import { useGetChildrenListQuery } from '../../features/children/childrenAPI'
import {
  AllVaccinationHistory,
  VaccinationHistory,
} from '../../types/vaccination'
import { useSearchParams } from 'react-router-dom'
import { Card, Collapse, Empty, Select, Tag, Typography } from 'antd'
import { useCallback, useEffect, useState } from 'react'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
import { Option } from 'antd/es/mentions'
import { Children } from '../../types/children'

const { Text } = Typography
const { Panel } = Collapse

interface VaccinationsHistoryResponse {
  data: {
    data: AllVaccinationHistory[]
  }
  isLoading: boolean
  isFetching: boolean
  message: string
}

interface ChildrenListResponse {
  data: {
    data: {
      items: Children[]
    }
  }
  isLoading: boolean
  isFetching: boolean
}

export default function VaccinationsHistory() {
  const [searchParams] = useSearchParams()
  const navigate = useNavigate()
  const [selectedChildId, setSelectedChildId] = useState(
    searchParams.get('childId') || null
  )
  const [selectedIsupcoming, setSelectedIsupcoming] = useState<boolean>(true)
  const parentId = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string).Id
    : null

  const { data: childrenData } = useGetChildrenListQuery<ChildrenListResponse>({
    parentId: parentId,
    pageNumber: 1,
    pageSize: 100,
  })
  const { data, isLoading, isFetching } =
    useGetVaccinationsHistoryQuery<VaccinationsHistoryResponse>(
      {
        childId: selectedChildId,
        isUpcoming: selectedIsupcoming,
      },
      {
        skip: !selectedChildId,
      }
    )

  const updateURL = useCallback(() => {
    const params = new URLSearchParams()
    if (selectedChildId) params.append('childId', selectedChildId)
    if (selectedIsupcoming) params.append('isUpcoming', 'true')
    else params.append('isUpcoming', 'false')

    navigate(`/vaccinations-history?${params.toString()}`)
  }, [selectedChildId, navigate, selectedIsupcoming])

  useEffect(() => {
    updateURL()
  }, [updateURL])

  const getStatusTag = (status: string) => {
    const statusMap: Record<string, JSX.Element> = {
      Paid: <Tag color='processing'>Đã thanh toán</Tag>,
      Completed: (
        <Tag color='success' icon={<CheckCircleOutlined />}>
          Hoàn thành
        </Tag>
      ),
      Canceled: (
        <Tag color='red' icon={<MinusCircleOutlined />}>
          Đã hủy
        </Tag>
      ),
      Refunded: <Tag color='purple'>Đã hoàn tiền</Tag>,
    }

    return statusMap[status] || <Tag color='gray'>Không rõ</Tag>
  }

  const groupedData: { [key: string]: VaccinationHistory[] } = {}
  data?.data.forEach((item: AllVaccinationHistory) => {
    const categoryName = item.category.name
    if (!groupedData[categoryName]) {
      groupedData[categoryName] = []
    }
    groupedData[categoryName].push(...item.vaccinations)
  })

  return (
    <>
      <Text
        strong
        style={{ display: 'block', textAlign: 'center', marginBottom: 10 }}
      >
        Chọn trẻ bạn muốn xem dữ liệu:
      </Text>

      {childrenData ? (
        <div
          style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            marginBottom: '20px',
          }}
        >
          <Select
            style={{
              width: '300px',
              fontSize: '18px',
            }}
            size='large'
            dropdownStyle={{ fontSize: '18px' }}
            placeholder='Chọn trẻ muốn tiêm'
            value={selectedChildId}
            onChange={(value) => setSelectedChildId(value)}
          >
            {childrenData.data.items.map((child) => (
              <Option key={child.id} value={child.id}>
                {child.name} -{' '}
                {child.dateOfBirth
                  ? new Date(child.dateOfBirth).toLocaleDateString('vi-VN')
                  : 'Không có ngày sinh'}
              </Option>
            ))}
          </Select>

          <Select
            style={{
              width: '300px',
              fontSize: '18px',
              marginLeft: '20px',
            }}
            size='large'
            dropdownStyle={{ fontSize: '18px' }}
            placeholder='Chọn loại dữ liệu'
            value={selectedIsupcoming ? 'true' : 'false'}
            onChange={(value) => setSelectedIsupcoming(value === 'true')}
          >
            <Option value='true'>Mũi tiêm kế tiếp</Option>
            <Option value='false'>Lịch sử tiêm chủng</Option>
          </Select>
        </div>
      ) : (
        <LoadingOutlined
          style={{
            fontSize: '50px',
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '30vh',
          }}
        />
      )}

      {selectedChildId &&
        (isLoading || isFetching ? (
          <LoadingOutlined
            style={{
              fontSize: '50px',
              display: 'flex',
              justifyContent: 'center',
              alignItems: 'center',
              height: '30vh',
            }}
          />
        ) : data.data.length !== 0 ? (
          <Collapse
            accordion
            style={{
              background: '#f9f9f9',
              borderRadius: '10px',
              overflow: 'hidden',
              boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
            }}
          >
            {Object.entries(groupedData).map(([category, vaccinations]) => (
              <Panel
                header={
                  <Text strong style={{ fontSize: '16px', color: '#1890ff' }}>
                    {category}
                  </Text>
                }
                key={category}
                style={{
                  background: '#ffffff',
                  borderRadius: '8px',
                  marginBottom: '10px',
                  padding: '5px 10px',
                }}
              >
                {vaccinations.map((vaccine) => (
                  <Card
                    key={vaccine.id}
                    bordered={false}
                    style={{
                      background: '#e6f7ff',
                      borderRadius: '10px',
                      boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)',
                      marginBottom: 10,
                    }}
                    hoverable
                    onClick={() =>
                      navigate(`/vaccinations-history-detail/${vaccine.id}`)
                    }
                  >
                    <Text strong style={{ fontSize: '14px', color: '#0050b3' }}>
                      {vaccine.name}
                    </Text>
                    <div style={{ marginTop: 5 }}>
                      <Text type='secondary'>Lịch tiêm: </Text>
                      {new Date(vaccine.schedule).toLocaleDateString('vi-VN')}
                    </div>
                    {selectedIsupcoming === false ? (
                      <div>{getStatusTag(vaccine.status)}</div>
                    ) : vaccine.status === 'Pending' ? (
                      <></>
                    ) : (
                      <div>{getStatusTag('Paid')}</div>
                    )}

                    <div
                      style={{
                        display: 'flex',
                        flexDirection: 'row-reverse',
                        marginTop: 5,
                      }}
                    >
                      <Text
                        strong
                        style={{
                          fontSize: '20px',
                          color: '#1890ff',
                          display: 'flex',
                          alignItems: 'center',
                        }}
                      >
                        Mũi số {vaccine.currentSequence}
                      </Text>
                    </div>
                  </Card>
                ))}
              </Panel>
            ))}
          </Collapse>
        ) : (
          <Card
            style={{
              borderRadius: 12,
              boxShadow: '0px 4px 10px rgba(0, 0, 0, 0.1)',
              textAlign: 'center',
              padding: '20px',
            }}
          >
            <Empty description='Chưa có dữ liệu tiêm chủng' />
          </Card>
        ))}
    </>
  )
}
