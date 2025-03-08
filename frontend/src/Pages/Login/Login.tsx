import { Layout } from 'antd'
const { Content } = Layout
import { LoginForm } from '../../components/Authentication/LoginForm'

export default function Login() {
  return (
    <Layout>
      <Content
        style={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          minWidth: '100vw',
        }}
      >
        <LoginForm />
      </Content>
    </Layout>
  )
}
