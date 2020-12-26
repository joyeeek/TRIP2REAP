package trip.two.reap.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.mail.MailHandler;
import trip.two.reap.member.mail.RandomKey;
import trip.two.reap.member.model.dao.MemberDAO;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.member.model.vo.MyHotel;
import trip.two.reap.member.model.vo.MyTravel;
import trip.two.reap.travel.model.vo.Travel;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	// xml에서 bean을 설정하고 사용하기 불편하기때문에 Autowired를 이용해서 개발자가 만든 클래스들의 빈을 직접 자바코드에서 이용할 수 있다. 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}
	
	@Override
	public int kakaoMemberCheck(String id) {
		return mDAO.kakaoMemberCheck(sqlSession, id);
	}
	
	@Override
	public int kakaoMemberInsert(Member loginUser) {
		return mDAO.kakaoMemberInsert(sqlSession, loginUser);
	}
	
	@Override
	public int naverMemberCheck(String id) {
		return mDAO.naverMemberCheck(sqlSession, id);
	}
	
	@Override
	public int naverMemberInsert(Member loginUser) {
		return mDAO.naverMemberInsert(sqlSession, loginUser);
	}
	
	@Override
	public int deleteMember(String id) {
		return mDAO.deleteMember(sqlSession, id);
	}
	
	@Override
	public int deleteMemberOther(String id) {
		return mDAO.deleteMemberOther(sqlSession, id);
	}
	
	@Override
	public int memberCheck(String userId) {
		return mDAO.memberCheck(sqlSession, userId);
	}
	
	@Override
	public int nicknameCheck(String nickname) {
		return mDAO.nicknameCheck(sqlSession, nickname);
	}
	
	@Override
	public String create(String email) {
		// 인증키 생성 (내가 원하는 사이즈, lowerCheck)
		String randomKey = new RandomKey().getKey(10, false);
		
		// 인증키 DB에 저장
		int result = mDAO.createAuthKey(sqlSession, email, randomKey);
			
		try {
			MailHandler mail = new MailHandler(mailSender);
			mail.setSubject("[TRIP2REAP] 이메일 인증번호 안내 메일입니다.");			
			mail.setText("<div class=\"separator\" style=\"clear: both;\"><a href=\"https://1.bp.blogspot.com/-Om57ZZgk-gE/X7XGWiGUcrI/AAAAAAAAAA4/-8hpMD8TmjokktCPlu2vmzUNbNvyXfyjACLcBGAsYHQ/s622/%25EB%25A9%2594%25EC%259D%25BC%25EC%259A%25A9%2B%25EB%25A1%259C%25EA%25B3%25A0.png\" style=\"clear: left; display: block; float: left; padding: 1em 0px; text-align: center;\"><img alt=\"\" border=\"0\" data-original-height=\"123\" data-original-width=\"622\" src=\"https://1.bp.blogspot.com/-Om57ZZgk-gE/X7XGWiGUcrI/AAAAAAAAAA4/-8hpMD8TmjokktCPlu2vmzUNbNvyXfyjACLcBGAsYHQ/s200/%25EB%25A9%2594%25EC%259D%25BC%25EC%259A%25A9%2B%25EB%25A1%259C%25EA%25B3%25A0.png\" width=\"200\" /></a></div>" 
					+ "<br><br><br><br>안녕하세요. [TRIP2REAP]입니다.<br> 회원님께서 요청하신 인증번호는 <strong>" + randomKey +"</strong> 입니다.<br>" + "10분안에 이메일 인증번호를 입력해주세요.<br>이용해주셔서 감사합니다♡♡♡");
			mail.setFrom("trip2reap@gmail.com", "TRIP2REAP");
			mail.setTo(email);
			mail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(result == 0) {
			return "errorMail";
		} else {
			return randomKey;
		}
	}
	
	@Override
	public int phoneCheck(String phone) {
		return mDAO.phoneCheck(sqlSession, phone);
	}
	
	@Override
	public int insertMember(Member member) {
		return mDAO.insertMember(sqlSession, member);
	}
	
	@Override
	public Member searchIdPhone(Member member) {
		return mDAO.searchIdPhone(sqlSession, member);
	}
	
	@Override
	public Member searchIdEmail(Member member) {
		return mDAO.searchIdEmail(sqlSession, member);
	}
	
	@Override
	public Member searchPwdEmail(Member member) {
		return mDAO.searchPwdEmail(sqlSession, member);
	}
	
	@Override
	public int changePwd(Member member) {
		return mDAO.changePwd(sqlSession, member);
	}
	
	@Override
	public int updateMember(Member member) {
		return mDAO.updateMember(sqlSession, member);
	}	
	
	@Override
	public int selectTravel(MyTravel myTravel) {
		return mDAO.selectTravel(sqlSession, myTravel);
	}
	
	@Override
	public int insertTravel(MyTravel myTravel) {
		return mDAO.insertTravel(sqlSession, myTravel);
	}
	
	@Override
	public ArrayList<Travel> selectTravelList(MyTravel myTravel) {
		return mDAO.selectTravelList(sqlSession, myTravel);
	}
	
	@Override
	public int deleteMyTravel(MyTravel myTravel) {
		return mDAO.deleteMyTravel(sqlSession, myTravel);
	}
	
	@Override
	public int countList(String memberId) {
		return mDAO.countList(sqlSession,memberId);
	}	
	
	@Override
	public ArrayList<Course> selectCourseList(CoursePageInfo pi) {
		return mDAO.selectCourseList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<MyHotel> selectReservation(String memberId) {
		return mDAO.selectReservation(sqlSession, memberId);
	}
	
	@Override
	public String findRoomName(int roomNo) {
		return mDAO.findRoomName(sqlSession, roomNo);
	}

	@Override
	public int updateRefundCheck(int reserveNo) {
		return mDAO.updateRefundCheck(sqlSession, reserveNo);
	}

	@Override
	public Reservation findReserveInfo(int reserveNo) {
		return mDAO.findReservationInfo(sqlSession, reserveNo);
	}

	@Override
	public Hotel findHotelInfo(int hId) {
		return mDAO.findHotelInfo(sqlSession, hId);
	}

	@Override
	public Room findRoomInfo(int roomNo) {
		return mDAO.findRoomInfo(sqlSession, roomNo);
	}

	@Override
	public int deleteMyCourse(Course course) {
		return mDAO.deleteMyCourse(sqlSession, course);
	}

} // 클래스 종료