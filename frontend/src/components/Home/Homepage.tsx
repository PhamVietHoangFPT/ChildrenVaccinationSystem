import React from 'react'
import { useGetVaccineListQuery } from '../../features/vaccine/vaccineAPI'
import { Typography, Button, Row, Col, Collapse, Space } from 'antd'
import { CalendarOutlined, LoadingOutlined } from '@ant-design/icons'
import Logo from '../../assets/Logo.png'
import { Vaccines } from '../../types/vaccine'
import { VaccineSlider } from '../Vaccine/VaccineSlider'
interface FAQ {
  question: string
  answer: string
}
interface VaccineListResponse {
  data: {
    data: {
      items: Vaccines[]
    }
  }
  isLoading: boolean
}

const { Title, Paragraph, Text } = Typography
const { Panel } = Collapse

const Homepage: React.FC = () => {
  const { data, isLoading } = useGetVaccineListQuery<VaccineListResponse>({
    pageNumber: 1,
    pageSize: 10,
  })

  const dataVaccine = data?.data.items ?? []

  const faqs: FAQ[] = [
    {
      question: 'Is vaccination safe?',
      answer:
        'Yes, vaccines undergo rigorous testing and monitoring to ensure they are safe before they are approved for use. The benefits of vaccination far outweigh the potential risks for most people.',
    },
    {
      question: 'What are the side effects?',
      answer:
        'Common side effects include soreness at the injection site, mild fever, and fatigue, which typically resolve within a few days. Serious side effects are extremely rare.',
    },
    {
      question: 'Who should get vaccinated?',
      answer:
        'Most people should get vaccinated according to the recommended schedule, but specific recommendations may vary based on age, health conditions, and other factors. Consult with your healthcare provider for personalized advice.',
    },
    {
      question: 'How long does immunity last after vaccination?',
      answer:
        'The duration of immunity varies by vaccine. Some vaccines provide lifelong protection, while others may require booster doses. Research is ongoing for newer vaccines to determine the duration of protection.',
    },
  ]

  return (
    <div
      style={{
        background: '#f0f2f5',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}
    >
      {/* Container */}
      <div
        style={{
          width: '100%',
          maxWidth: '80%',
          padding: '24px',
          margin: '0 auto',
        }}
      >
        {/* Gioi thieu */}
        <Row gutter={[24, 24]} align='middle' style={{ marginBottom: '48px' }}>
          <Col xs={24} md={12}>
            <div style={{ padding: '0 16px' }}>
              <Title
                level={1}
                style={{ marginBottom: '24px', color: '#1890ff' }}
              >
                Protect Yourself and Your Loved Ones with Vaccination
              </Title>
              <Paragraph style={{ fontSize: '16px', marginBottom: '24px' }}>
                Vaccination is one of the most effective ways to prevent
                diseases. Get vaccinated today to protect yourself and help
                build community immunity.
              </Paragraph>
              <Space>
                <Button type='primary' size='large' icon={<CalendarOutlined />}>
                  Schedule Appointment
                </Button>
                <Button size='large'>Learn More</Button>
              </Space>
            </div>
          </Col>
          <Col xs={24} md={12}>
            <img
              src={Logo || '/placeholder.svg'}
              alt=''
              style={{
                width: '100%',
                borderRadius: '8px',
                boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
              }}
            />
          </Col>
        </Row>

        {/* Danh sach vaccine */}
        <div style={{ marginBottom: '48px' }}>
          <Title
            level={2}
            style={{ textAlign: 'center', marginBottom: '32px' }}
          >
            Popular Vaccines
          </Title>
          {isLoading ? (
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
            <VaccineSlider vaccines={dataVaccine as Vaccines[]} />
          )}
        </div>

        {/*Phan nay cua FAQS*/}
        <div style={{ marginBottom: '48px' }}>
          <Title
            level={2}
            style={{ textAlign: 'center', marginBottom: '32px' }}
          >
            Frequently Asked Questions
          </Title>
          <Row justify='center'>
            <Col xs={24} md={20} lg={18}>
              <Collapse defaultActiveKey={['0']} expandIconPosition='right'>
                {faqs.map((faq, index) => (
                  <Panel
                    header={<Text strong>{faq.question}</Text>}
                    key={index}
                  >
                    <Paragraph>{faq.answer}</Paragraph>
                  </Panel>
                ))}
              </Collapse>
              <div style={{ textAlign: 'center', marginTop: '24px' }}>
                <Button type='primary'>View All FAQs</Button>
              </div>
            </Col>
          </Row>
        </div>
      </div>
    </div>
  )
}

export default Homepage
