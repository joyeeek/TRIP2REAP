package trip.two.reap.member.model.service;


import java.util.ArrayList;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.member.model.vo.MyHotel;
import trip.two.reap.member.model.vo.MyTravel;
import trip.two.reap.travel.model.vo.Travel;

public interface MemberService {

	Member memberLogin(Member m);
	
	int kakaoMemberCheck(String id);
	
	int kakaoMemberInsert(Member loginUser);
	
	int naverMemberCheck(String id);

	int naverMemberInsert(Member loginUser);
	
	int deleteMember(String id);
	
	int deleteMemberOther(String id);

	int memberCheck(String userId);

	int nicknameCheck(String nickname);

	String create(String email);
	
	int phoneCheck(String phone);

	int insertMember(Member member);

	Member searchIdPhone(Member member);

	Member searchIdEmail(Member member);

	Member searchPwdEmail(Member member);

	int changePwd(Member member);

	int updateMember(Member member);

	int selectTravel(MyTravel myTravel);

	int insertTravel(MyTravel myTravel);

	ArrayList<Travel> selectTravelList(MyTravel myTravel);

	int deleteMyTravel(MyTravel myTravel);

	int countList(String memberId);

	ArrayList<Course> selectCourseList(CoursePageInfo pi);

	ArrayList<MyHotel> selectReservation(String memberId);
	
	String findRoomName(int roomNo);

	int updateRefundCheck(int reserveNo);

	Reservation findReserveInfo(int reserveNo);

	Hotel findHotelInfo(int hId);

	Room findRoomInfo(int roomNo);

	int deleteMyCourse(Course course);
}