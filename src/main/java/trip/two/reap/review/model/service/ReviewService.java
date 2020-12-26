package trip.two.reap.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

public interface ReviewService {
	
	int getListCount(HashMap<String, Object> searchList);
	
	ArrayList<Review> selectList(PageInfo pi, HashMap<String, Object> searchList);
	
	Review selectReview(Review r);
	
	int insertReview(Review r);
	
	int insertBoard(Review r);
	
	int updateReview(Review r);
	int updateReviewPhoto(Review r);
	
	int deleteReview(int boNo);

	int addReply(Reply re);
	
	int deleteReply(Reply re);

	ArrayList<Reply> selectReply(int boNo);


	
	int insertDetailView(Attachment oneDetailImg);

	//디테일이미지뷰에  뿌려주기
	ArrayList<Attachment> selectDetailList(int boNo);

	int isCanceledLikeBtn(HashMap<String, Object> map);

	int updateLikeReview(HashMap<String, Object> map);
	
	int insertLikeReview(HashMap<String, Object> map);

	int isSmashedLikeBtn(HashMap<String, Object> map);

	int cancelLikeReview(HashMap<String, Object> map);
	
	int countReviewLike(int boNo);




}
