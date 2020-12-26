package trip.two.reap.member.mail;

import java.util.Random;

// 인증키 생성
public class RandomKey {
	private boolean lowerCheck;
	private int size;
	
	// init() 함수를 이용하여 키 생성.
	public String getKey(int size, boolean lowerCheck) {
		this.size = size;
		this.lowerCheck = lowerCheck;
		return init();
	}
	
	// init() : 난수를 만드는 함수
	private String init() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			// 0~74 + 48 = 48 ~ 122
			num = random.nextInt(75) + 48;
			
			// 숫자, 알파벳 대소문자
			if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num);
            }else {
                continue;
            }
		} while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		} else {
			return sb.toString();
		}
	}

}
