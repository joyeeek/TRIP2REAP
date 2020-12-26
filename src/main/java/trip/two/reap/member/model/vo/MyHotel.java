package trip.two.reap.member.model.vo;

import java.sql.Date;

public class MyHotel {
	private int boNo;//BO_NO
	private String title;//BO_TITLE
	private int reserveNo;//(추가) RESERVE_NO
	private int roomNo;//(추가) ROOM_NO
	
	private int price;//RESERVE_PRICE
	private int person;//RESERVE_TOTAL_PERSON_CNT
	private Date checkIn;//CHECK_IN_DATE
	private Date checkOut;//CHECK_OUT_DATE
	
	private String roomName; //ROOMNAME
	private String imageName;//CHANGE_NAME
	private String memberId;//(추가)MEMBER_ID

		
	public MyHotel() {}

	public MyHotel(int boNo, String title, int reserveNo, int roomNo, int price, int person, Date checkIn,
			Date checkOut, String roomName, String imageName, String memberId) {
		super();
		this.boNo = boNo;
		this.title = title;
		this.reserveNo = reserveNo;
		this.roomNo = roomNo;
		this.price = price;
		this.person = person;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomName = roomName;
		this.imageName = imageName;
		this.memberId = memberId;
	}


	public int getBoNo() {
		return boNo;
	}


	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getPerson() {
		return person;
	}


	public void setPerson(int person) {
		this.person = person;
	}


	public Date getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	public Date getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public String getImageName() {
		return imageName;
	}


	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "MyHotel [boNo=" + boNo + ", title=" + title + ", reserveNo=" + reserveNo + ", roomNo=" + roomNo
				+ ", price=" + price + ", person=" + person + ", checkIn=" + checkIn + ", checkOut=" + checkOut
				+ ", roomName=" + roomName + ", imageName=" + imageName + ", memberId=" + memberId + "]";
	}


}