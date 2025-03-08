import { Layout } from 'antd'
import Logo from '../../../assets/Logo.png'

const { Header } = Layout

const CustomHeader = () => {
  return (
    <Header
      style={{
        background: '#1890ff',
        padding: '40px 40px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.15)',
        height: 'auto',
      }}
    >
      {/* Logo */}
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          alignContent: 'center',
          gap: '10px',
          color: 'white',
          fontSize: '20px',
          fontWeight: 'bold',
          height: '90px',
          margin: 20,
        }}
      >
        <img
          src={Logo}
          alt=''
          style={{
            width: '150px',
            borderRadius: '50%',
          }}
        />
        <div style={{ display: 'flex', flexDirection: 'column' }}>
          <div>HỆ THỐNG TRUNG TÂM TIÊM CHỦNG VẮC XIN CHO TRẺ EM</div>
          <div>AN TOÀN - UY TÍN - CHẤT LƯỢNG HÀNG ĐẦU VIỆT NAM *</div>
        </div>
      </div>
    </Header>
  )
}

export default CustomHeader
