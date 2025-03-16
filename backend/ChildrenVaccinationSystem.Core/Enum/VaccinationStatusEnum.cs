namespace ChildrenVaccinationSystem.Core.Enum
{
	public enum VaccinationStatusEnum
	{
		Pending, // 0. Chưa tới ngày, chưa trả phí cho lượt tiêm này
		Paid, // 1. Đã trả khoản phí cho lượt tiêm này
		Consulting, // 2. Sau khi xác nhận các lượt tiêm đã paid, staff sẽ chỉnh sang consulting và assign từ danh sách bác sĩ trong cùng cơ sở, sau khi chuyển từ paid qua consulting, tự động trừ -1 vào loại vaccine đã được xác nhận 
		Queued, // 3. Sau khi bác sĩ khám xong sẽ chuyển bệnh nhân thành queued hoặc paid hoặc refund (nếu ko đủ điều kiện để tiêm)
		Injecting, // 4. Sau khi tới lượt tiêm thì staff sẽ  chuyển bệnh nhân từ queued sang injecting
		Monitoring, // 5. Sau khi tiêm thành công, vaccinator sẽ chuyển thành monitoring để theo dõi
		Emergency, // 6. Nếu tiêm có triệu chứng, staff chuyển sang emergency
		Completed, // 7. Sau 30 phút nếu tiêm không có triệu chứng, staff ở quầy theo dõi sẽ chuyển thành completed
		Canceled, // 8. Khách hàng cancel những lượt tiêm chưa trả tiền
		Refunded // 9. Lượt tiêm được hoàn tiền lại cho khách, khách không được hoàn tiền nếu đã qua bước consulting
	}
}

// Các thao tác của customer/staff/bác sĩ/vaccinator trên 1 lượt tiêm (vaccination)
