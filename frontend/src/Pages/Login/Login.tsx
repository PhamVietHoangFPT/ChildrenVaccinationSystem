import { Layout } from 'antd'
const { Content } = Layout
import { LoginForm } from '../../components/Authentication/Login'

export default function Login() {
  return (
    <Layout>
      <Content>
        <LoginForm />
      </Content>
    </Layout>
  )
}
