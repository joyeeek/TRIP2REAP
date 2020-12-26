package trip.two.reap.travel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.travel.model.dao.TravelDAO;
import trip.two.reap.travel.model.vo.Travel;

@Service("tService")
public class TravelServiceImpl implements TravelService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TravelDAO tDAO;
	
	@Override
	public int getListCount(HashMap<String, Object> searchList) {
		return tDAO.getListCount(sqlSession, searchList);
	}

	@Override
	public ArrayList<Travel> selectList(PageInfo pi, HashMap<String, Object> searchList) {
		return tDAO.selectList(sqlSession, pi, searchList);
	}
	@Override
	public int getAllListCount() {
		return tDAO.getAllListCount(sqlSession);
	}


	/*
	 * @Override public int insertBoard(Travel t) { return
	 * tDAO.insertBoard(sqlSession, t); }
	 */
	
	@Override
	public int insertTravel(Travel t) {
		return tDAO.insertTravel(sqlSession, t);
	}
	
   @Override public int insertFiles(Attachment a) { return
   tDAO.insertFiles(sqlSession, a); }
	 

	@Override
	public Travel selectTravel(int boNo) {

		Travel t = null;
		
		int result = tDAO.addReadCount(sqlSession, boNo); //count증가
		
		if(result > 0) {
			t = tDAO.selectTravel(sqlSession, boNo);
		}
		
		return t;
	}
	/*
	 * @Override public int insertOneThumImg(HashMap<String, Object> imgHashMap) {
	 * return tDAO.insertOneThumImg(sqlSession, imgHashMap); }
	 */

	@Override
	public int updateTravel(Travel t) {
		return tDAO.updateTravel(sqlSession, t);
	}
	
	@Override
	public int updateFile(Attachment a) {
		return tDAO.updateFile(sqlSession, a);
	}
	
	@Override
	public int updateBoard(Travel t) {
		return tDAO.updateBoard(sqlSession, t);
	}

	@Override
	public int deleteTravel(int boNo) {
		return tDAO.deleteTravel(sqlSession, boNo);
	}

	@Override
	public int deleteFile(int boNo) {
		return tDAO.deleteFile(sqlSession, boNo);
	}




	

	


	
}
