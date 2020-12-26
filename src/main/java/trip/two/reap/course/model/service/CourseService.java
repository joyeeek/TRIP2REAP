package trip.two.reap.course.model.service;


import java.util.ArrayList;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;

public interface CourseService {

	int insertBoard(Course board);

	int countList();	

	int countList1();

	int countList2();
	
	int countList3();
	
	int countList4();
	
	int countList5();

	ArrayList<Course> selectCourseList(CoursePageInfo pi);

	ArrayList<Course> selectCourseList1(CoursePageInfo pi);
	
	ArrayList<Course> selectCourseList2(CoursePageInfo pi);
	
	ArrayList<Course> selectCourseList3(CoursePageInfo pi);
	
	ArrayList<Course> selectCourseList4(CoursePageInfo pi);
	
	ArrayList<Course> selectCourseList5(CoursePageInfo pi);

	Course selectCourse(int coNo);

}
