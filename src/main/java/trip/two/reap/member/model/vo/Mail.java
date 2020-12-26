package trip.two.reap.member.model.vo;

public class Mail {
	private String email;
	private String randomKey;
	
	public Mail( ) { }

	public Mail(String email, String randomKey) {
		super();
		this.email = email;
		this.randomKey = randomKey;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRandomKey() {
		return randomKey;
	}

	public void setRandomKey(String randomKey) {
		this.randomKey = randomKey;
	}

	@Override
	public String toString() {
		return "Mail [email=" + email + ", randomKey=" + randomKey + "]";
	}

	
	
	
}
