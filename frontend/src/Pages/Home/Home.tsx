import React, { useEffect } from 'react'
import { Layout } from 'antd'
import Homepage from '../../components/Home/Homepage'
const { Content } = Layout
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
const Home: React.FC = () => {
  const userData = Cookies.get('userData')
    ? JSON.parse(Cookies.get('userData') as string)
    : null
  const navigate = useNavigate()
  useEffect(() => {
    if (userData.Role === 'Customer') {
      navigate('/')
    } else {
      navigate(`/${userData.Role.toLowerCase()}`)
    }
  }, [navigate, userData])
  return (
    <Layout>
      <Content>
        <Homepage />
      </Content>
    </Layout>
  )
}

export default Home
