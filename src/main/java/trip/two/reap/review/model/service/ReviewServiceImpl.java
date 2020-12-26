package trip.two.reap.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.dao.ReviewDAO;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDAO rDAO;
	
	@Override
	public int getListCount(HashMap<String, Object> searchList) {
		return rDAO.getListCount(sqlSession, searchList);
	}
	
	@Override
	public ArrayList<Review> selectList(PageInfo pi, HashMap<String, Object> searchList) {
		return rDAO.selectList(sqlSession, pi, searchList);
	}
	
	@Override
	public int insertReview(Review r) {
		return rDAO.insertReview(sqlSession,r);
	}
	
	@Override
	public int insertBoard(Review r) {
		return rDAO.insertBoard(sqlSession,r);
	}
	
	@Override
	public Review selectReview(Review r) {
		Review tmpR = null;
	      
	    int result = rDAO.addReadCount(sqlSession, r);   // 조회수
	    
	    if(result > 0) {
	    	tmpR = rDAO.selectReview(sqlSession, r);
	    }
	      
	    return tmpR;
	}

	@Override
	public int updateReview(Review r) {
	
		return rDAO.updateReview(sqlSession, r);
	}
	@Override
	public int updateReviewPhoto(Review r) {
		
		return rDAO.updateReviewPhoto(sqlSession, r);
	}

	@Override
	public int deleteReview(int boNo) {
		return rDAO.deleteReview(sqlSession, boNo);
	}

	@Override
	public int addReply(Reply re) {
		return rDAO.addReply(sqlSession, re);
	}
	
	@Override
	public int deleteReply(Reply re) {
		return rDAO.deleteReply(sqlSession, re);
	}

	@Override
	public ArrayList<Reply> selectReply(int boNo) {
		return rDAO.selectReply(sqlSession, boNo);
	}


	//디테일이미지 한개  테이블에 등록
	@Override
	public int insertDetailView(Attachment oneDetailImg) {
		return rDAO.insertDetailView(sqlSession, oneDetailImg);
	}

	
	//디테일 이미지 뷰에 뿌려주기.
	@Override
	public ArrayList<Attachment> selectDetailList(int boNo) {
		return rDAO.selectDetailList(sqlSession, boNo);
	}

	@Override
	public int isCanceledLikeBtn(HashMap<String, Object> map) {
		return rDAO.isCanceledLikeBtn(sqlSession, map);
	}

	@Override
	public int updateLikeReview(HashMap<String, Object> map) {
		return rDAO.updateLikeHotel(sqlSession, map);
	}

	@Override
	public int insertLikeReview(HashMap<String, Object> map) {
		return rDAO.insertLikeHotel(sqlSession, map);
	}

	@Override
	public int isSmashedLikeBtn(HashMap<String, Object> map) {
		return rDAO.isSmashedLikeBtn(sqlSession, map);
	}

	@Override
	public int cancelLikeReview(HashMap<String, Object> map) {
		return rDAO.cancelLikeHotel(sqlSession, map);
	}

	@Override
	public int countReviewLike(int boNo) {
		return rDAO.countReviewLike(sqlSession, boNo);
	}

	
}
