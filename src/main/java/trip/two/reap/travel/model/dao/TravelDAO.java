package trip.two.reap.travel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.travel.model.vo.Travel;

@Repository("tDAO")
public class TravelDAO {

	public int getAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("travelMapper.getAllListCount");
	}

	
	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> searchList) {
		return sqlSession.selectOne("travelMapper.getListCount", searchList);
	}

	public ArrayList<Travel> selectList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, Object> searchList) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); //몇개씩 건너뛸건지.
		
		return (ArrayList)sqlSession.selectList("travelMapper.selectList", searchList , rowBounds); //3개짜리 list(statement,건네줄 파라미터,넘겨줄것) rowBounds때문에 ArrayList로 형변환
		
	}



	public int insertTravel(SqlSessionTemplate sqlSession, Travel t) {
		return sqlSession.insert("travelMapper.insertTravel", t); //travel테이블에 등록하기
	}

	
	  public int insertFiles(SqlSessionTemplate sqlSession, Attachment a) { 
		  return sqlSession.insert("travelMapper.insertFiles", a); //첨부파일 
	  }
	  
	 

	public int addReadCount(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("travelMapper.addReadCount", boNo); //travel상세보기 count증가
	}

	public Travel selectTravel(SqlSessionTemplate sqlSession, int boNo) {
		return (Travel)sqlSession.selectOne("travelMapper.selectTravel", boNo); //travel상세보기
	}

	public int updateTravel(SqlSessionTemplate sqlSession, Travel t) {
		return sqlSession.update("travelMapper.updateTravel", t);
	}
	
	public int updateFile(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("travelMapper.updateFile", a);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Travel t) {
		return sqlSession.update("travelMapper.updateBoard", t);
	}

	public int deleteTravel(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("travelMapper.deleteTravel",boNo);
	}

	public int deleteFile(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("travelMapper.deleteFile",boNo);
	}






	/*
	 * public int insertOneThumImg(SqlSessionTemplate sqlSession, HashMap<String,
	 * Object> imgHashMap) { return
	 * sqlSession.insert("travelMapper.insertOneThumImg", imgHashMap); }
	 */


}
