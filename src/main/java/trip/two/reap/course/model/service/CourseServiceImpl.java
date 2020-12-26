package trip.two.reap.course.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.course.model.dao.CourseDAO;
import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;

@Service("cService")
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CourseDAO cDAO;
	
	@Override
	public int insertBoard(Course board) {
		return cDAO.insertBoard(sqlSession, board);
	}
	
	@Override
	public int countList() {
		return cDAO.countList(sqlSession);
	}
	
	@Override
	public int countList1() {
		return cDAO.countList1(sqlSession);
	}
	
	@Override
	public int countList2() {
		return cDAO.countList2(sqlSession);
	}
	
	@Override
	public int countList3() {
		return cDAO.countList3(sqlSession);
	}
	
	@Override
	public int countList4() {
		return cDAO.countList4(sqlSession);
	}
	
	@Override
	public int countList5() {
		return cDAO.countList5(sqlSession);
	}
	
	@Override
	public ArrayList<Course> selectCourseList(CoursePageInfo pi) {
		return cDAO.selectCourseList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Course> selectCourseList1(CoursePageInfo pi) {
		return cDAO.selectCourseList1(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Course> selectCourseList2(CoursePageInfo pi) {
		return cDAO.selectCourseList2(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Course> selectCourseList3(CoursePageInfo pi) {
		return cDAO.selectCourseList3(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Course> selectCourseList4(CoursePageInfo pi) {
		return cDAO.selectCourseList4(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Course> selectCourseList5(CoursePageInfo pi) {
		return cDAO.selectCourseList5(sqlSession, pi);
	}
	
	@Override
	public Course selectCourse(int coNo) {
		return cDAO.selectCourse(sqlSession, coNo);
	}

}
