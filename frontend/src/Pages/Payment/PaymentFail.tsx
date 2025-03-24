import React from 'react'
import { Result, Button } from 'antd'
import { useNavigate } from 'react-router-dom'

const PaymentFail: React.FC = () => {
  const navigate = useNavigate()

  const handleBackHome = () => {
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
      status='error'
      title='Thanh toán thất bại'
      subTitle='Có lỗi xảy ra trong quá trình thanh toán. Vui lòng thử lại.'
      extra={[
        <Button type='primary' key='home' onClick={handleBackHome}>
          Quay về trang chủ
        </Button>,
      ]}
    />
  )
}

export default PaymentFail
