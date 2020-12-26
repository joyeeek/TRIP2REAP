package trip.two.reap.course.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;

@Repository("cDAO")
public class CourseDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, Course board) {
		return sqlSession.insert("courseMapper.insertBoard" , board);
	}

	public int countList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList");
	}

	public int countList1(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList1");
	}
	
	public int countList2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList2");
	}
	
	public int countList3(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList3");
	}
	
	public int countList4(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList4");
	}
	
	public int countList5(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList5");
	}
	
	public ArrayList<Course> selectCourseList(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList", null, rowBounds);
	}

	public ArrayList<Course> selectCourseList1(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList1", null, rowBounds);
	}
	
	public ArrayList<Course> selectCourseList2(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList2", null, rowBounds);
	}
	
	public ArrayList<Course> selectCourseList3(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList3", null, rowBounds);
	}
	
	public ArrayList<Course> selectCourseList4(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList4", null, rowBounds);
	}
	
	public ArrayList<Course> selectCourseList5(SqlSessionTemplate sqlSession, CoursePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList5", null, rowBounds);
	}

	public Course selectCourse(SqlSessionTemplate sqlSession, int coNo) {
		return (Course)sqlSession.selectOne("courseMapper.selectCourse", coNo);
	}

}
