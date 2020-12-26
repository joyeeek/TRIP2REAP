package trip.two.reap.review.model.vo;

import java.sql.Date;

public class Reply {
	private int reNo;
	private int boNo;
	private String memberId;
	private Date reDate; 
	private String reContent;
	private String reDeleteYN;
	private String nickName;
	
	public Reply() {}

	public Reply(int reNo, int boNo, String memberId, Date reDate, String reContent, String reDeleteYN,
			String nickName) {
		super();
		this.reNo = reNo;
		this.boNo = boNo;
		this.memberId = memberId;
		this.reDate = reDate;
		this.reContent = reContent;
		this.reDeleteYN = reDeleteYN;
		this.nickName = nickName;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Reply [reNo=" + reNo + ", boNo=" + boNo + ", memberId=" + memberId + ", reDate=" + reDate
				+ ", reContent=" + reContent + ", reDeleteYN=" + reDeleteYN + ", nickName=" + nickName + "]";
	}

	

}
