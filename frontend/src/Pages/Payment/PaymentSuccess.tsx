import React from 'react'
import { Result, Button } from 'antd'
import { useNavigate } from 'react-router-dom'

const PaymentSuccess: React.FC = () => {
  const navigate = useNavigate()
  const handleNavigateHome = () => {
    navigate('/')
  }

  return (
    <Result
      style={{
        height: '100vh',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        flexDirection: 'column',
      }}
      status='success'
      title='Thanh toán thành công'
      extra={[
        <Button type='primary' key='console' onClick={handleNavigateHome}>
          Về trang chủ
        </Button>,
      ]}
    />
  )
}

export default PaymentSuccess
