package trip.two.reap.common;

public class Likes {

	//공통 - 좋아요 버튼
	private int boNo;  //게시글 번호 
	private String likeYN; //좋아요 여부
	private String memberId;  // 회원 Id
	
	
	public Likes() {}
	
	public Likes(int boNo, String likeYN, String memberId) {
		super();
		this.boNo = boNo;
		this.likeYN = likeYN;
		this.memberId = memberId;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getLikeYN() {
		return likeYN;
	}

	public void setLikeYN(String likeYN) {
		this.likeYN = likeYN;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Likes [boNo=" + boNo + ", likeYN=" + likeYN + ", memberId=" + memberId + "]";
	}
	
	
	
}
