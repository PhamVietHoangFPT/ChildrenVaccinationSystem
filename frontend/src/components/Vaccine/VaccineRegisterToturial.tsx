import { Card, List } from 'antd'

export default function VaccineRegisterTutorial() {
  const steps = [
    'Đăng nhập vào hệ thống',
    'Chọn "Vắc xin" trên thanh điều hướng',
    'Chọn cơ sở y tế',
    'Chọn vaccine (nhiều vaccine lẻ hoặc 1 gói)',
    'Chọn ngày đăng ký',
    'Chọn hồ sơ trẻ em',
    'Chọn phương thức thanh toán (gói: thanh toán ngay, lẻ: trả hết hoặc một phần)',
  ]

  return (
    <Card
      title='Hướng dẫn đăng ký vaccine'
      style={{ maxWidth: 700, margin: 'auto' }}
    >
      <List
        bordered
        dataSource={steps}
        renderItem={(item, index) => (
          <List.Item>{`${index + 1}. ${item}`}</List.Item>
        )}
      />
    </Card>
  )
}
