import { Layout } from 'antd'
const { Content } = Layout
import { RegisterForm } from '../../components/Authentication/RegisterForm'

export default function Register() {
  return (
    <Layout>
      <Content
        style={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
        }}
      >
        <RegisterForm />
      </Content>
    </Layout>
  )
}
