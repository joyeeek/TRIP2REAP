package trip.two.reap.common;

public class Attachment {
	private int fileNo;
	private int boNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String filePath;
	private String fileDeleteYN;
	
	public Attachment() {}
	
	public Attachment(int fileNo, int boNo, String originName, String changeName, int fileLevel, String filePath,
			String fileDeleteYN) {
		super();
		this.fileNo = fileNo;
		this.boNo = boNo;
		this.originName = originName;
		this.changeName = changeName;
		this.fileLevel = fileLevel;
		this.filePath = filePath;
		this.fileDeleteYN = fileDeleteYN;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
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

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileDeleteYN() {
		return fileDeleteYN;
	}

	public void setFileDeleteYN(String fileDeleteYN) {
		this.fileDeleteYN = fileDeleteYN;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", boNo=" + boNo + ", originName=" + originName + ", changeName="
				+ changeName + ", fileLevel=" + fileLevel + ", filePath=" + filePath + ", fileDeleteYN=" + fileDeleteYN
				+ "]";
	}
	
	
}
