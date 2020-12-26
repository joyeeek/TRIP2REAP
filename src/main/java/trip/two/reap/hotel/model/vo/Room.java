package trip.two.reap.hotel.model.vo;

public class Room {
	private int roomNo; //방번호 (필수)
	private int boNo;	//호텔번호(필수)
	private String roomType; //방종류(필수)
	private String roomName; //방이름(필수)
	private int pricePerDay; //1박 이용가격(필수)
	
	public Room() {}
	
	public Room(int roomNo, int boNo, String roomType, String roomName, int pricePerDay) {
		super();
		this.roomNo = roomNo;
		this.boNo = boNo;
		this.roomType = roomType;
		this.roomName = roomName;
		this.pricePerDay = pricePerDay;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getPricePerDay() {
		return pricePerDay;
	}

	public void setPricePerDay(int pricePerDay) {
		this.pricePerDay = pricePerDay;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", boNo=" + boNo + ", roomType=" + roomType + ", roomName=" + roomName
				+ ", pricePerDay=" + pricePerDay + "]";
	}
	
}
