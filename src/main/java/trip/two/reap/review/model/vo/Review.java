package trip.two.reap.review.model.vo;

import java.sql.Date;

public class Review {
	// 커밋용!
	private int boNo;
	private int caCode;
	private String boTitle;
	private String boContent;
	private String memberId;
	private int boCount;
	private String boTag;
	private String boDeleteYN;
	private Date regDate;
	private String caName;
	private String originName;
	private String changeName;
	private String nickName;
	private int likes;
	private int likeCnt;
	private int likeYn;
	private String loginUserId;

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

	public String getCaName() {
		return caName;
	}

	public void setCaName(String caName) {
		this.caName = caName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getLikeYn() {
		return likeYn;
	}

	public void setLikeYn(int likeYn) {
		this.likeYn = likeYn;
	}

	public String getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}
}
