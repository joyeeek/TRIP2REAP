package trip.two.reap.member.model.vo;

public class MyTravel {
	private int boNo;
	private String memberId;
	
	private String bo_title;
	private String bo_Tag;
	private String tr_theme;
	private String change_name;	
	private String boCount;
	
	public MyTravel() { }
	
	public MyTravel(int boNo, String memberId) {
		super();
		this.boNo = boNo;
		this.memberId = memberId;
	}

	public MyTravel(int boNo, String bo_title, String bo_Tag, String tr_theme, String change_name, String boCount) {
		super();
		this.boNo = boNo;
		this.bo_title = bo_title;
		this.bo_Tag = bo_Tag;
		this.tr_theme = tr_theme;
		this.change_name = change_name;
		this.boCount = boCount;
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

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_Tag() {
		return bo_Tag;
	}

	public void setBo_Tag(String bo_Tag) {
		this.bo_Tag = bo_Tag;
	}

	public String getTr_theme() {
		return tr_theme;
	}

	public void setTr_theme(String tr_theme) {
		this.tr_theme = tr_theme;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getBoCount() {
		return boCount;
	}

	public void setBoCount(String boCount) {
		this.boCount = boCount;
	}

	@Override
	public String toString() {
		return "MyTravel [boNo=" + boNo + ", memberId=" + memberId + ", bo_title=" + bo_title + ", bo_Tag=" + bo_Tag
				+ ", tr_theme=" + tr_theme + ", change_name=" + change_name + ", boCount=" + boCount + "]";
	}		

}
