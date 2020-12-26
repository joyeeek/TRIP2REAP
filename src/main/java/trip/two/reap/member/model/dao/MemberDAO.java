package trip.two.reap.member.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.model.vo.Mail;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.member.model.vo.MyHotel;
import trip.two.reap.member.model.vo.MyTravel;
import trip.two.reap.travel.model.vo.Travel;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}
	
	public int kakaoMemberCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.kakaoMemberCheck", id);
	}
	
	public int kakaoMemberInsert(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.insert("memberMapper.kakaoMemberInsert" , loginUser);
	}
	
	public int naverMemberCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.naverMemberCheck", id);
	}

	public int naverMemberInsert(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.insert("memberMapper.naverMemberInsert" , loginUser);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}
	
	public int deleteMemberOther(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.delete("memberMapper.deleteMemberOther", id);
	}

	public int memberCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.memberCheck",userId);
	}

	public int nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck",nickname);
	}

	public int createAuthKey(SqlSessionTemplate sqlSession, String email, String randomKey) {
		Mail mail = new Mail();
		mail.setEmail(email);
		mail.setRandomKey(randomKey);
		
		int result = sqlSession.selectOne("memberMapper.checkEmail",mail);
		
		if(result > 0) {
			return sqlSession.update("memberMapper.ranNumCheckUpdate", mail);
		} else {
			return sqlSession.insert("memberMapper.ranNumCheck", mail);
		}	
	}
	
	public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.phoneCheck",phone);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember" , member);
	}

	public Member searchIdPhone(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchIdPhone" , member);
	}

	public Member searchIdEmail(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchIdEmail" , member);
	}

	public Member searchPwdEmail(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchPwdEmail" , member);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updatePwd", member);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	public int selectTravel(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return sqlSession.selectOne("memberMapper.selectMyTravel", myTravel);
	}

	public int insertTravel(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return sqlSession.insert("memberMapper.insertMyTravel", myTravel);
	}

	public ArrayList<Travel> selectTravelList(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTravelList", myTravel);
	}

	public int deleteMyTravel(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return sqlSession.delete("memberMapper.deleteMyTravel", myTravel);
	}

	public int countList(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.countList",memberId);
	}

	public ArrayList<Course> selectCourseList(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectCourseList", pi, rowBounds);
	}

	public ArrayList<MyHotel> selectReservation(SqlSessionTemplate sqlSession, String memberId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectReservation", memberId);
	}

	public String findRoomName(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("memberMapper.findOneRoomName", roomNo);
	}

	public int updateRefundCheck(SqlSessionTemplate sqlSession, int reserveNo) {
		return sqlSession.update("memberMapper.updateRefundCheck", reserveNo);
	}

	public Reservation findReservationInfo(SqlSessionTemplate sqlSession, int reserveNo) {
		return sqlSession.selectOne("memberMapper.findReservationInfo", reserveNo);
	}

	public Hotel findHotelInfo(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.selectOneHotel", hId);
	}

	public Room findRoomInfo(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelMapper.selectOneRoomInfo", roomId);
	}

	public int deleteMyCourse(SqlSessionTemplate sqlSession, Course course) {
		return sqlSession.delete("memberMapper.deleteMyCourse", course);
	}

} // 클래스 종료