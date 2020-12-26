package trip.two.reap.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Repository("rDAO")
public class ReviewDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> searchList) {
		return sqlSession.selectOne("reviewMapper.getListCount", searchList);
	}
	
	public ArrayList<Review> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> searchList){
		
		int offset=(pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", searchList, rowBounds);
	} 
	public int countReviewLike(SqlSessionTemplate sqlSession,int boNo) {
		return sqlSession.selectOne("reviewMapper.countReviewLike", boNo);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("reviewMapper.selectReview", r);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, Review r) {
		 return sqlSession.update("reviewMapper.addReadCount", r);
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview",r);
	}
	public int insertBoard(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertBoard",r);
	}
	

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
	
		return sqlSession.update("reviewMapper.updateReview",r);
	}
	public int updateReviewPhoto(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.updateReviewPhoto",r);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("reviewMapper.deleteReview",boNo);
	}
	

	public int addReply(SqlSessionTemplate sqlSession, Reply re) {
		return sqlSession.update("reviewMapper.insertReply",re);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, Reply re) {
		return sqlSession.update("reviewMapper.deleteReply",re);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReplyList",boNo);
	}

	//디테일이미지 등록
	public int insertDetailView(SqlSessionTemplate sqlSession, Attachment oneDetailImg) {
		return sqlSession.insert("reviewMapper.insertDetailView", oneDetailImg);
	}

	public ArrayList<Attachment> selectDetailList(SqlSessionTemplate sqlSession, int boNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectDetailList",boNo);
		
	}

	public int isCanceledLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("reviewMapper.isCanceledLikeBtn", map);
	}

	public int updateLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("reviewMapper.updateLikeReview", map);
	}

	public int insertLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("reviewMapper.insertLikeReview", map);
	}

	public int isSmashedLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("reviewMapper.isSmashedLikeBtn", map);
	}

	public int cancelLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("reviewMapper.cancelLikeReview", map);
	}



	

}































