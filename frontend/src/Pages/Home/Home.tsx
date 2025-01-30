import React from 'react'
import { Layout, Typography, Button } from 'antd'
import { useGetTestListQuery } from '../../features/Test/testAPI'

const { Content } = Layout
const { Title, Paragraph } = Typography

const Homepage: React.FC = () => {
  const { data: test = [] } = useGetTestListQuery({})

  return (
    <Layout>
      <Content>
        <Title level={1}>Welcome to the Children Vaccination System</Title>
        <Paragraph>
          Ensuring the health and safety of our children through timely
          vaccinations.
        </Paragraph>
        <Button type='primary' href='/login'>
          Register Now
        </Button>
        {Array.isArray(test) && test.length > 0 && (
          <Paragraph>
            {test.map((item: any) => (
              <div key={item.id}>
                <p>{item.name}</p>
              </div>
            ))}
          </Paragraph>
        )}
      </Content>
    </Layout>
  )
}

export default Homepage
