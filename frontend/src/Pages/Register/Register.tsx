import { Layout } from 'antd'
const { Content } = Layout
import { RegisterForm } from '../../components/Authentication/Register'

export default function Register() {
  return (
    <Layout>
      <Content>
        <RegisterForm />
      </Content>
    </Layout>
  )
}
