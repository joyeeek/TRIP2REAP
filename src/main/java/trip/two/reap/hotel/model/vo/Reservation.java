package trip.two.reap.hotel.model.vo;

import java.sql.Date;

public class Reservation {
	private int reserveNo;		//예약 번호(필수)
	private String memberId;	//예약자 아이디(필수)=주문자아이디
	private int boNo;			//예약 호텔번호(필수)
	private int roomNo;			//에약 방번호(필수)
	private int reservePrice;	//예약 방가격(필수)
	
	private int reserveRoomCnt;	//예약 객실 개수 (필수)
	private int reserveTotalPersonCnt;	//예약인원수(필수)
	private int reservePersonAdultCnt; 	//예약 성인 수 (필수)
	private int reservePersonChildCnt;	//예약 어린이 수 (필수)
	
	private Date checkInDate;	//체크인 날짜(필수)
	private Date checkOutDate;	//체크아웃 날짜(필수)
	private String reserveCheck; 	//예약확인 (필수)
	private String refundCheck;		//환불확인 (필수)
	
	
	//2020.12.15
	//예약자 정보(이름, 전화번호, 이메일) 를 입력해야된다. 
	//(카카오나 네이버 로그인의 경우에는 닉네임을 제외한 나머지정보가 null로 되어있다.
	//컬럼이 중복되기는 하나, 멤버테이블에 영향을 주지않는다.
	
	private String reserveName; //예약자이름
	private String reservePhone; //예약자전화번호
	private String reserveEmail; //예약자 이메일
	
	//2020.12.15 
	// 컬럼추가 (paymentUID, merchangUID, paymtentType, paymentAmount)
	private String paymentUID; //고유id
	
	// 주문자 아이디(merchant_uid)
	// 가맹점에서 생성/관리하는 고유주문번호
	private String merchantUID;
	private String paymentType; //결제수단종류
		
	
	public Reservation() {}



	public Reservation(int reserveNo, String memberId, int boNo, int roomNo, int reservePrice, int reserveRoomCnt,
			int reserveTotalPersonCnt, int reservePersonAdultCnt, int reservePersonChildCnt, Date checkInDate,
			Date checkOutDate, String reserveCheck, String refundCheck, String reserveName, String reservePhone,
			String reserveEmail, String paymentUID, String merchantUID, String paymentType) {
		super();
		this.reserveNo = reserveNo;
		this.memberId = memberId;
		this.boNo = boNo;
		this.roomNo = roomNo;
		this.reservePrice = reservePrice;
		this.reserveRoomCnt = reserveRoomCnt;
		this.reserveTotalPersonCnt = reserveTotalPersonCnt;
		this.reservePersonAdultCnt = reservePersonAdultCnt;
		this.reservePersonChildCnt = reservePersonChildCnt;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reserveCheck = reserveCheck;
		this.refundCheck = refundCheck;
		this.reserveName = reserveName;
		this.reservePhone = reservePhone;
		this.reserveEmail = reserveEmail;
		this.paymentUID = paymentUID;
		this.merchantUID = merchantUID;
		this.paymentType = paymentType;
		
	}



	public int getReserveNo() {
		return reserveNo;
	}



	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public int getBoNo() {
		return boNo;
	}



	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}



	public int getRoomNo() {
		return roomNo;
	}



	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}



	public int getReservePrice() {
		return reservePrice;
	}



	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}



	public int getReserveRoomCnt() {
		return reserveRoomCnt;
	}



	public void setReserveRoomCnt(int reserveRoomCnt) {
		this.reserveRoomCnt = reserveRoomCnt;
	}



	public int getReserveTotalPersonCnt() {
		return reserveTotalPersonCnt;
	}



	public void setReserveTotalPersonCnt(int reserveTotalPersonCnt) {
		this.reserveTotalPersonCnt = reserveTotalPersonCnt;
	}



	public int getReservePersonAdultCnt() {
		return reservePersonAdultCnt;
	}



	public void setReservePersonAdultCnt(int reservePersonAdultCnt) {
		this.reservePersonAdultCnt = reservePersonAdultCnt;
	}



	public int getReservePersonChildCnt() {
		return reservePersonChildCnt;
	}



	public void setReservePersonChildCnt(int reservePersonChildCnt) {
		this.reservePersonChildCnt = reservePersonChildCnt;
	}



	public Date getCheckInDate() {
		return checkInDate;
	}



	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}



	public Date getCheckOutDate() {
		return checkOutDate;
	}



	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}



	public String getReserveCheck() {
		return reserveCheck;
	}



	public void setReserveCheck(String reserveCheck) {
		this.reserveCheck = reserveCheck;
	}



	public String getRefundCheck() {
		return refundCheck;
	}



	public void setRefundCheck(String refundCheck) {
		this.refundCheck = refundCheck;
	}



	public String getReserveName() {
		return reserveName;
	}



	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}



	public String getReservePhone() {
		return reservePhone;
	}



	public void setReservePhone(String reservePhone) {
		this.reservePhone = reservePhone;
	}



	public String getReserveEmail() {
		return reserveEmail;
	}



	public void setReserveEmail(String reserveEmail) {
		this.reserveEmail = reserveEmail;
	}



	public String getPaymentUID() {
		return paymentUID;
	}



	public void setPaymentUID(String paymentUID) {
		this.paymentUID = paymentUID;
	}



	public String getMerchantUID() {
		return merchantUID;
	}



	public void setMerchantUID(String merchantUID) {
		this.merchantUID = merchantUID;
	}



	public String getPaymentType() {
		return paymentType;
	}



	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}




	@Override
	public String toString() {
		return "Reservation [reserveNo=" + reserveNo + ", memberId=" + memberId + ", boNo=" + boNo + ", roomNo="
				+ roomNo + ", reservePrice=" + reservePrice + ", reserveRoomCnt=" + reserveRoomCnt
				+ ", reserveTotalPersonCnt=" + reserveTotalPersonCnt + ", reservePersonAdultCnt="
				+ reservePersonAdultCnt + ", reservePersonChildCnt=" + reservePersonChildCnt + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", reserveCheck=" + reserveCheck + ", refundCheck="
				+ refundCheck + ", reserveName=" + reserveName + ", reservePhone=" + reservePhone + ", reserveEmail="
				+ reserveEmail + ", paymentUID=" + paymentUID + ", merchantUID=" + merchantUID + ", paymentType="
				+ paymentType + ", paymentAmount=" +  "]";
	}
	
}
