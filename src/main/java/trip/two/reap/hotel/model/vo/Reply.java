package trip.two.reap.hotel.model.vo;

import java.sql.Date;

public class Reply {
	private int reNo; //댓글번호 (필수)
	private int reviewScore; //리뷰점수 (호텔 댓글에서는 필수)
	private int boNo; //게시글 번호 (필수)
	private String memberId; //작성자 id (필수)
	private Date reDate; //댓글 작성 날짜 (필수)
	private String reContent; //댓글 내용(필수)
	private String reDeleteYN; //댓글 삭제 여부 (필수)
	
	public Reply() {}
	
	public Reply(int reNo, int reviewScore, int boNo, String memberId, Date reDate, String reContent,
			String reDeleteYN) {
		super();
		this.reNo = reNo;
		this.reviewScore = reviewScore;
		this.boNo = boNo;
		this.memberId = memberId;
		this.reDate = reDate;
		this.reContent = reContent;
		this.reDeleteYN = reDeleteYN;
	}
	
	
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReDeleteYN() {
		return reDeleteYN;
	}
	public void setReDeleteYN(String reDeleteYN) {
		this.reDeleteYN = reDeleteYN;
	}
	
	
	@Override
	public String toString() {
		return "Reply [reNo=" + reNo + ", reviewScore=" + reviewScore + ", boNo=" + boNo + ", memberId=" + memberId
				+ ", reDate=" + reDate + ", reContent=" + reContent + ", reDeleteYN=" + reDeleteYN + "]";
	}
	
}
