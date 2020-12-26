package trip.two.reap.hotel.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Hotel {
	// * 필수: NOT NULL
	// * 선택: NULLABLE (NULL 가능) 
	
	// BOARD
	private int boNo;	//게시판넘버(호텔번호 ) - 필수
	private int caCode; //카테고리 넘버 (5) - 필수
	private String boTitle; //호텔이름 - 필수
		
	private String boContent; //게시글 내용 : 호텔소개 내용 - 필수
	private String memberId; //게시글 작성자(주로 관리자: admin) - 필수 
	private int boCount; //조회수 - 필수 
	
	private String boTag; //해시태그  - 선택
	private String boDeleteYN; //게시글 삭제여부 - 필수 
	private Date regDate; //게시글 등록&수정 날짜 - default sysdate로 필수 
	
	
	private String hotelThumbnailImg;//호텔 썸네일 이미지 -- 필수
	private ArrayList<String> hotelDetailViewImgs; //호텔 디테일 이미지	-- 선택
	
	
	private ArrayList<Room> roomList; //등록된 방리스트(뷰=>컨트롤러 리스트형태로 전달하기위해서 사용)
	
	
	//HOTEL
	private String hotelAddr; //호텔주소 -- 필수
	private int hotelLocalCode; //호텔지역코드 --필수
	
	private String hotelSite; //호텔 사이트 -- 선택
	private String hotelTel; //호텔 전화번호 --선택 
	private double hotelReviewScore; //호텔 후기평점점수 -필수
	private int hotelRank; //호텔등급--선택 
	private int hotelOpenTime; //호텔오픈시각(시: 0시~24시) --필수
	private int hotelCloseTime; //호텔종료시각(시: 0시~24시)--필수
	
	private String hotelOptions; //호텔 옵션 --선택
	private int hotelCheckInTime; //호텔 체크인 시각대 (0시~24시) --필수
	private int hotelCheckOutTime;//호텔 체크아웃 시각대 (0시~24시)--필수
	
	//기본생성자	
	public Hotel() {}
	
	//hotelLocalCode, hotelRank, hotelOpenTime, hotelCloseTime, hotelCheckInTime, hotelCheckOutTime은
	//숫자형식의 데이터이므로, 뷰(폼)에서 컨트롤러로 전달되는 데이터는 모두 문자열형식이다. 그래서 requestParam을 이용하여 받아야한다.
	//생성자는 숫자형식데이터를 잠시 제외시킨다.
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount,
			String boDeleteYN, Date regDate, String hotelAddr, double hotelReviewScore) 
	{
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelAddr = hotelAddr;
		this.hotelReviewScore = hotelReviewScore;
	}
	
	
	
	
	
	//사진관련요소를 제외한 필수요소만 들어있는 생성자
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount,
			String boDeleteYN, Date regDate, String hotelAddr, int hotelLocalCode, double hotelReviewScore,
			int hotelOpenTime, int hotelCloseTime, int hotelCheckInTime, int hotelCheckOutTime) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelAddr = hotelAddr;
		this.hotelLocalCode = hotelLocalCode;
		this.hotelReviewScore = hotelReviewScore;
		this.hotelOpenTime = hotelOpenTime;
		this.hotelCloseTime = hotelCloseTime;
		this.hotelCheckInTime = hotelCheckInTime;
		this.hotelCheckOutTime = hotelCheckOutTime;
	}

	//필수만 들어있는 생성자(썸네일이미지만 포함)
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount,
			String boDeleteYN, Date regDate, String hotelThumbnailImg, String hotelAddr, int hotelLocalCode,
			double hotelReviewScore, int hotelOpenTime, int hotelCloseTime, int hotelCheckInTime,
			int hotelCheckOutTime) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelThumbnailImg = hotelThumbnailImg;
		this.hotelAddr = hotelAddr;
		this.hotelLocalCode = hotelLocalCode;
		this.hotelReviewScore = hotelReviewScore;
		this.hotelOpenTime = hotelOpenTime;
		this.hotelCloseTime = hotelCloseTime;
		this.hotelCheckInTime = hotelCheckInTime;
		this.hotelCheckOutTime = hotelCheckOutTime;
	}


	//사진관련요소를 제외한 모든 요소가 들어있는 생성자
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, String hotelAddr, int hotelLocalCode, String hotelSite, String hotelTel,
			double hotelReviewScore, int hotelRank, int hotelOpenTime, int hotelCloseTime,
			String hotelOptions, int hotelCheckInTime, int hotelCheckOutTime) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelAddr = hotelAddr;
		this.hotelLocalCode = hotelLocalCode;
		this.hotelSite = hotelSite;
		this.hotelTel = hotelTel;
		this.hotelReviewScore = hotelReviewScore;
		this.hotelRank = hotelRank;
		this.hotelOpenTime = hotelOpenTime;
		this.hotelCloseTime = hotelCloseTime;
		this.hotelOptions = hotelOptions;
		this.hotelCheckInTime = hotelCheckInTime;
		this.hotelCheckOutTime = hotelCheckOutTime;
	}



	//모든 요소가 들어있는 생성자
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, String hotelThumbnailImg, ArrayList<String> hotelDetailViewImgs,
			String hotelAddr, int hotelLocalCode, String hotelSite, String hotelTel, double hotelReviewScore,
			int hotelRank, int hotelOpenTime, int hotelCloseTime, String hotelOptions, int hotelCheckInTime,
			int hotelCheckOutTime) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelThumbnailImg = hotelThumbnailImg;
		this.hotelDetailViewImgs = hotelDetailViewImgs;
		this.hotelAddr = hotelAddr;
		this.hotelLocalCode = hotelLocalCode;
		this.hotelSite = hotelSite;
		this.hotelTel = hotelTel;
		this.hotelReviewScore = hotelReviewScore;
		this.hotelRank = hotelRank;
		this.hotelOpenTime = hotelOpenTime;
		this.hotelCloseTime = hotelCloseTime;
		this.hotelOptions = hotelOptions;
		this.hotelCheckInTime = hotelCheckInTime;
		this.hotelCheckOutTime = hotelCheckOutTime;
	}


	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, String hotelThumbnailImg, ArrayList<String> hotelDetailViewImgs,
			ArrayList<Room> roomList, String hotelAddr, int hotelLocalCode, String hotelSite, String hotelTel,
			double hotelReviewScore, int hotelRank, int hotelOpenTime, int hotelCloseTime, String hotelOptions,
			int hotelCheckInTime, int hotelCheckOutTime) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.hotelThumbnailImg = hotelThumbnailImg;
		this.hotelDetailViewImgs = hotelDetailViewImgs;
		this.roomList = roomList;
		this.hotelAddr = hotelAddr;
		this.hotelLocalCode = hotelLocalCode;
		this.hotelSite = hotelSite;
		this.hotelTel = hotelTel;
		this.hotelReviewScore = hotelReviewScore;
		this.hotelRank = hotelRank;
		this.hotelOpenTime = hotelOpenTime;
		this.hotelCloseTime = hotelCloseTime;
		this.hotelOptions = hotelOptions;
		this.hotelCheckInTime = hotelCheckInTime;
		this.hotelCheckOutTime = hotelCheckOutTime;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}


	public int getCaCode() {
		return caCode;
	}


	public void setCaCode(int caCode) {
		this.caCode = caCode;
	}


	public String getBoTitle() {
		return boTitle;
	}


	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}


	public String getBoContent() {
		return boContent;
	}


	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getBoCount() {
		return boCount;
	}


	public void setBoCount(int boCount) {
		this.boCount = boCount;
	}


	public String getBoTag() {
		return boTag;
	}


	public void setBoTag(String boTag) {
		this.boTag = boTag;
	}


	public String getBoDeleteYN() {
		return boDeleteYN;
	}


	public void setBoDeleteYN(String boDeleteYN) {
		this.boDeleteYN = boDeleteYN;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public String getHotelThumbnailImg() {
		return hotelThumbnailImg;
	}


	public void setHotelThumbnailImg(String hotelThumbnailImg) {
		this.hotelThumbnailImg = hotelThumbnailImg;
	}


	public ArrayList<String> getHotelDetailViewImgs() {
		return hotelDetailViewImgs;
	}


	public void setHotelDetailViewImgs(ArrayList<String> hotelDetailViewImgs) {
		this.hotelDetailViewImgs = hotelDetailViewImgs;
	}


	public String getHotelAddr() {
		return hotelAddr;
	}


	public void setHotelAddr(String hotelAddr) {
		this.hotelAddr = hotelAddr;
	}


	public String getHotelSite() {
		return hotelSite;
	}


	public void setHotelSite(String hotelSite) {
		this.hotelSite = hotelSite;
	}


	public String getHotelTel() {
		return hotelTel;
	}


	public void setHotelTel(String hotelTel) {
		this.hotelTel = hotelTel;
	}


	public double getHotelReviewScore() {
		return hotelReviewScore;
	}


	public void setHotelReviewScore(double hotelReviewScore) {
		this.hotelReviewScore = hotelReviewScore;
	}


	public int getHotelOpenTime() {
		return hotelOpenTime;
	}


	public void setHotelOpenTime(int hotelOpenTime) {
		this.hotelOpenTime = hotelOpenTime;
	}


	public int getHotelCloseTime() {
		return hotelCloseTime;
	}


	public void setHotelCloseTime(int hotelCloseTime) {
		this.hotelCloseTime = hotelCloseTime;
	}


	public String getHotelOptions() {
		return hotelOptions;
	}


	public void setHotelOptions(String hotelOptions) {
		this.hotelOptions = hotelOptions;
	}


	public int getHotelCheckInTime() {
		return hotelCheckInTime;
	}


	public void setHotelCheckInTime(int hotelCheckInTime) {
		this.hotelCheckInTime = hotelCheckInTime;
	}


	public int getHotelCheckOutTime() {
		return hotelCheckOutTime;
	}


	public void setHotelCheckOutTime(int hotelCheckOutTime) {
		this.hotelCheckOutTime = hotelCheckOutTime;
	}


	public int getHotelRank() {
		return hotelRank;
	}


	public void setHotelRank(int hotelRank) {
		this.hotelRank = hotelRank;
	}


	public int getHotelLocalCode() {
		return hotelLocalCode;
	}


	public void setHotelLocalCode(int hotelLocalCode) {
		this.hotelLocalCode = hotelLocalCode;
	}
	
	
	
	public ArrayList<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(ArrayList<Room> roomList) {
		this.roomList = roomList;
	}

	@Override
	public String toString() {
		return "Hotel [boNo=" + boNo + ", caCode=" + caCode + ", boTitle=" + boTitle + ", boContent=" + boContent
				+ ", memberId=" + memberId + ", boCount=" + boCount + ", boTag=" + boTag + ", boDeleteYN=" + boDeleteYN
				+ ", regDate=" + regDate + ", hotelThumbnailImg=" + hotelThumbnailImg + ", hotelDetailViewImgs="
				+ hotelDetailViewImgs + ", hotelAddr=" + hotelAddr + ", hotelLocalCode=" + hotelLocalCode
				+ ", hotelSite=" + hotelSite + ", hotelTel=" + hotelTel + ", hotelReviewScore=" + hotelReviewScore
				+ ", hotelRank=" + hotelRank + ", hotelOpenTime=" + hotelOpenTime + ", hotelCloseTime=" + hotelCloseTime
				+ ", hotelOptions=" + hotelOptions + ", hotelCheckInTime=" + hotelCheckInTime + ", hotelCheckOutTime="
				+ hotelCheckOutTime +", roomList=" +roomList+"]";
	}
	
}
