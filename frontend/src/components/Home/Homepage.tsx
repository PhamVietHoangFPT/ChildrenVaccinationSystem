import React from 'react'
import {
  Typography,
  Button,
  Row,
  Col,
  Card,
  Statistic,
  Form,
  Input,
  DatePicker,
  Select,
  Divider,
  Collapse,
  Space,
  Tag,
} from 'antd'
import {
  CalendarOutlined,
  MedicineBoxOutlined,
  CheckCircleOutlined,
  EnvironmentOutlined,
  PhoneOutlined,
  MailOutlined,
} from '@ant-design/icons'
import Logo from '../../assets/Logo.png'

interface VaccinationStat {
  count: number
  label: string
  icon: React.ReactNode
}

interface VaccineType {
  name: string
  description: string
  effectiveness: string
  image: string
}

interface FAQ {
  question: string
  answer: string
}

const { Title, Paragraph, Text } = Typography
const { Option } = Select
const { Panel } = Collapse

const Homepage: React.FC = () => {
  const stats: VaccinationStat[] = [
    {
      count: 5000000,
      label: 'Vaccinations Administered',
      icon: <MedicineBoxOutlined />,
    },
    {
      count: 2500,
      label: 'Vaccination Centers',
      icon: <EnvironmentOutlined />,
    },
    {
      count: 98,
      label: 'Effectiveness Rate (%)',
      icon: <CheckCircleOutlined />,
    },
  ]

  const vaccines: VaccineType[] = [
    {
      name: 'Bệnh dại',
      description:
        'Protects against coronavirus disease with high efficacy rate.',
      effectiveness: '94-95%',
      image: Logo,
    },
    {
      name: 'Cúm mùa',
      description:
        'Annual protection against seasonal flu strains. 36 Thanh Hóa mãi đỉnh',
      effectiveness: '40-60%',
      image: Logo,
    },
    {
      name: 'Viêm gan B',
      description:
        'Prevents human papillomavirus infections and related cancers.',
      effectiveness: '90%+',
      image: Logo,
    },
  ]

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

  const onFinish = (values: any) => {
    console.log('Received values:', values)
  }

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
              alt='Vắc xin Thanh Hóa'
              style={{
                width: '100%',
                borderRadius: '8px',
                boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
              }}
            />
          </Col>
        </Row>

        {/* Thong ke */}
        <div
          style={{
            background: '#1890ff',
            padding: '48px 24px',
            borderRadius: '8px',
            marginBottom: '48px',
          }}
        >
          <Row gutter={[24, 24]} justify='center'>
            {stats.map((stat, index) => (
              <Col xs={24} sm={20} md={8} key={index}>
                <Card hoverable style={{ height: '100%' }}>
                  <Statistic
                    title={
                      <Text style={{ fontSize: '16px' }}>{stat.label}</Text>
                    }
                    value={stat.count}
                    valueStyle={{ color: '#1890ff', fontWeight: 'bold' }}
                    prefix={
                      <span style={{ fontSize: '24px', marginRight: '8px' }}>
                        {stat.icon}
                      </span>
                    }
                    formatter={(value) =>
                      value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
                    }
                  />
                </Card>
              </Col>
            ))}
          </Row>
        </div>

        {/* Card */}
        <div style={{ marginBottom: '48px' }}>
          <Title
            level={2}
            style={{ textAlign: 'center', marginBottom: '32px' }}
          >
            Available Vaccines
          </Title>
          <Row gutter={[24, 24]} justify='center'>
            {vaccines.map((vaccine, index) => (
              <Col xs={24} sm={20} md={8} key={index}>
                <Card
                  hoverable
                  cover={
                    <img
                      alt={vaccine.name}
                      src={vaccine.image || '/placeholder.svg'}
                      style={{ height: '200px', objectFit: 'cover' }}
                    />
                  }
                  actions={[<Button type='link'>Learn more</Button>]}
                >
                  <Card.Meta
                    title={vaccine.name}
                    description={vaccine.description}
                  />
                  <div style={{ marginTop: '16px' }}>
                    <Tag color='green'>
                      Effectiveness: {vaccine.effectiveness}
                    </Tag>
                  </div>
                </Card>
              </Col>
            ))}
          </Row>
        </div>

        {/* Phan dat lich */}
        <div style={{ marginBottom: '48px' }}>
          <Row gutter={[24, 24]} justify='center'>
            <Col xs={24} lg={24} xl={22}>
              <Row gutter={[0, 24]}>
                <Col xs={24} md={12}>
                  <div
                    style={{
                      background: '#1890ff',
                      padding: '32px',
                      borderRadius: '8px',
                      height: '100%',
                      color: 'white',
                    }}
                  >
                    <Title
                      level={2}
                      style={{ color: 'white', marginBottom: '24px' }}
                    >
                      Schedule Your Vaccination
                    </Title>
                    <Paragraph
                      style={{ fontSize: '16px', marginBottom: '24px' }}
                    >
                      Getting vaccinated is quick and easy. Schedule your
                      appointment today and take a step towards a healthier
                      future.
                    </Paragraph>
                    <ul style={{ listStyle: 'none', padding: 0 }}>
                      <li
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          marginBottom: '12px',
                        }}
                      >
                        <CheckCircleOutlined style={{ marginRight: '12px' }} />{' '}
                        Quick online scheduling
                      </li>
                      <li
                        style={{
                          display: 'flex',
                          alignItems: 'center',
                          marginBottom: '12px',
                        }}
                      >
                        <CheckCircleOutlined style={{ marginRight: '12px' }} />{' '}
                        Multiple locations available
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center' }}>
                        <CheckCircleOutlined style={{ marginRight: '12px' }} />{' '}
                        Free for eligible individuals
                      </li>
                    </ul>
                    <Divider
                      style={{ backgroundColor: 'rgba(255,255,255,0.2)' }}
                    />
                    <div>
                      <Space direction='vertical'>
                        <Space>
                          <PhoneOutlined />{' '}
                          <Text style={{ color: 'white' }}>
                            Call us: (123) 456-7890
                          </Text>
                        </Space>
                        <Space>
                          <MailOutlined />{' '}
                          <Text style={{ color: 'white' }}>
                            Email: info@vaxshield.com
                          </Text>
                        </Space>
                      </Space>
                    </div>
                  </div>
                </Col>
                <Col xs={24} md={12}>
                  <Card
                    style={{
                      height: '100%',
                      borderRadius: '8px',
                    }}
                  >
                    <Title level={3} style={{ marginBottom: '24px' }}>
                      Book Your Appointment
                    </Title>
                    <Form layout='vertical' onFinish={onFinish}>
                      <Row gutter={16}>
                        <Col span={12}>
                          <Form.Item
                            name='firstName'
                            label='First Name'
                            rules={[
                              {
                                required: true,
                                message: 'Please enter your first name',
                              },
                            ]}
                          >
                            <Input placeholder='Enter your first name' />
                          </Form.Item>
                        </Col>
                        <Col span={12}>
                          <Form.Item
                            name='lastName'
                            label='Last Name'
                            rules={[
                              {
                                required: true,
                                message: 'Please enter your last name',
                              },
                            ]}
                          >
                            <Input placeholder='Enter your last name' />
                          </Form.Item>
                        </Col>
                      </Row>
                      <Form.Item
                        name='email'
                        label='Email'
                        rules={[
                          {
                            required: true,
                            message: 'Please enter your email',
                          },
                          {
                            type: 'email',
                            message: 'Please enter a valid email',
                          },
                        ]}
                      >
                        <Input placeholder='Enter your email' />
                      </Form.Item>
                      <Form.Item
                        name='phone'
                        label='Phone'
                        rules={[
                          {
                            required: true,
                            message: 'Please enter your phone number',
                          },
                        ]}
                      >
                        <Input placeholder='Enter your phone number' />
                      </Form.Item>
                      <Row gutter={16}>
                        <Col span={12}>
                          <Form.Item
                            name='date'
                            label='Preferred Date'
                            rules={[
                              {
                                required: true,
                                message: 'Please select a date',
                              },
                            ]}
                          >
                            <DatePicker style={{ width: '100%' }} />
                          </Form.Item>
                        </Col>
                        <Col span={12}>
                          <Form.Item
                            name='vaccineType'
                            label='Vaccine Type'
                            rules={[
                              {
                                required: true,
                                message: 'Please select a vaccine',
                              },
                            ]}
                          >
                            <Select placeholder='Select vaccine'>
                              <Option value='covid19'>COVID-19 Vaccine</Option>
                              <Option value='influenza'>
                                Influenza Vaccine
                              </Option>
                              <Option value='hpv'>HPV Vaccine</Option>
                            </Select>
                          </Form.Item>
                        </Col>
                      </Row>
                      <Form.Item>
                        <Button
                          type='primary'
                          htmlType='submit'
                          block
                          size='large'
                        >
                          Book Appointment
                        </Button>
                      </Form.Item>
                    </Form>
                  </Card>
                </Col>
              </Row>
            </Col>
          </Row>
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
