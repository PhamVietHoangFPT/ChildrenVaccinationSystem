import React from 'react'
import { Layout, Typography, Col, Row } from 'antd'

const { Footer } = Layout
const { Text } = Typography

const AppFooter: React.FC = () => {
  return (
    <Footer
      style={{
        textAlign: 'center',
        background: '#1890ff',
        padding: '20px 50px',
      }}
    >
      <Row gutter={16}>
        <Col
          span={12}
          style={{
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
          }}
        >
          <Text strong>
            <h1 style={{ color: '#ffffff' }}>KIDS VACCINE</h1>
          </Text>{' '}
          <Text style={{ color: '#ffffff' }}>
            © {new Date().getFullYear()} - Hệ thống trung tâm tiêm chủng vắc
            xin cho trẻ em
          </Text>
          <br />
          <Text type='secondary' style={{ color: '#ffffff' }}>
            An toàn - Uy tín - Chất lượng hàng đầu Việt Nam
          </Text>
          <br />
          <Text type='secondary' style={{ color: '#ffffff' }}>
            Email: kidvaccine@kidvaccine.com | SĐT: 0281234567
          </Text>
        </Col>
        <Col span={12}>
          <iframe
            src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.610010498175!2d106.8076943152967!3d10.841127592277624!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1680286377326!5m2!1svi!2s'
            width='100%'
            height='200'
            style={{ border: 0 }}
            allowFullScreen={false}
            loading='lazy'
            referrerPolicy='no-referrer-when-downgrade'
          />
        </Col>
      </Row>
    </Footer>
  )
}

export default AppFooter
