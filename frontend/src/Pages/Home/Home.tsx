import React from 'react'
import { Layout, Typography, Button } from 'antd'

const { Content } = Layout
const { Title, Paragraph } = Typography

const Homepage: React.FC = () => {

  return (
    <Layout>
      <Content>
        <Title level={1}>Welcome to the Children Vaccination System</Title>
        <Paragraph>
          Ensuring the health and safety of our children through timely
          vaccinations.
        </Paragraph>
        <Button type='primary' href='/login'>
          Login
        </Button>
      </Content>
    </Layout>
  )
}

export default Homepage
