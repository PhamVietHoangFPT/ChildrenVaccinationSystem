import { Result, Button } from 'antd'
import { useNavigate } from 'react-router-dom'

const NoPermission = () => {
  const navigate = useNavigate()

  const handleBackHome = () => {
    navigate('/')
  }

  return (
    <Result
      status='403'
      title='403'
      subTitle='Xin lỗi, bạn không có quyền truy cập trang này.'
      extra={
        <Button type='primary' onClick={handleBackHome}>
          Trở về trang chủ
        </Button>
      }
    />
  )
}

export default NoPermission
