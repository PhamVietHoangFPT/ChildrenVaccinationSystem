import { Layout } from 'antd'
const { Content } = Layout
import Profile from '../../components/Profile/Profile'
export default function ProfilePage() {
  return (
    <Layout>
      <Content>
        <Profile />
      </Content>
    </Layout>
  )
}
