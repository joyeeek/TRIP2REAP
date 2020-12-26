package trip.two.reap.hotel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int getHotelListCount(SqlSessionTemplate sqlSession) {
		//namespace가 hotelMapper인 mapper에서  id가 getHotelListCount 인 쿼리문을 수행한다.
		return sqlSession.selectOne("hotelMapper.getHotelListCount");
	}

	//hId에 해당하는 호텔이 가지고 있는 방리스트를 구한다.
	public ArrayList<Hotel> selectHotelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hotelMapper.selectHotelList", null, rowBounds);
	}

	//2020.11.25:디테일뷰 보기.
	//조회수 증가
	public int addReadCount(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.update("hotelMapper.addReadCount", hId);
	}

	//hId에 해당하는 호텔디테일뷰 보기.
	public Hotel selectOneHotel(SqlSessionTemplate sqlSession, int hId) {

		return sqlSession.selectOne("hotelMapper.selectOneHotel", hId);
	}

	//호텔방구하기
	//hId에 해당하는 호텔 방개수를 구한다.
	public int getRoomListCount(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.getRoomListCount", hId);
	}


	//hId에 해당하는 호텔이 가지고있는 방종류를 구한다.
	public ArrayList<String> getRoomTypeList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList) sqlSession.selectList("hotelMapper.getRoomTypeList", hId);
	}

	public ArrayList<Room> searchRoomTypeList(SqlSessionTemplate sqlSession, HashMap<String, Object> roomInfoMap) {
		return (ArrayList) sqlSession.selectList("hotelMapper.searchRoomTypeList", roomInfoMap);
	}


	//호텔 예약페이지 이동
	//roomId에 해당하는 방정보를 가져온다.
	public Room selectOneRoomInfo(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelMapper.selectOneRoomInfo", roomId);
	}


	//2020.11.27
	// 호텔에 등록한 방중 가장 싼 방가격을 구한다.
	public int findHotelMinPrice(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.selectOne("hotelMapper.findHotelMinPrice", boNo);
	}

	public ArrayList<Integer> selectMinPriceRoomList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> minPriceInfoMap) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectMinPriceRoomList", minPriceInfoMap);
	}

	//해당계정에서  한개 호텔을 좋아요 버튼을  눌렀는지 확인.
	public int isSmashedLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("hotelMapper.isSmashedLikeBtn", map);
	}

	//좋아요 해제
	public int cancelLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("hotelMapper.cancelLikeHotel", map);
	}

	//좋아요 반영
	public int isCanceledLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("hotelMapper.isCanceledLikeBtn", map);
	}

	public int updateLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("hotelMapper.updateLikeHotel", map);
	}

	public int insertLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("hotelMapper.insertLikeHotel", map);
	}

	public int countHotelLike(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.countHotelLike", hId);
	}
	
	
	//호텔 리뷰 등록
	public int insertReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.insert("hotelMapper.insertReview",hotelReply);
	}


	public int insertHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.insert("hotelMapper.insertHotelReview", hotelReply);
	}

	//호텔 리뷰 리스트 보여주기 
	public ArrayList<Reply> selectOneHotelReplyList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectOneHotelReplyList", hId);
	}

	public ArrayList<String> selectOneHotelReplyNickNameList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectOneHotelReplyNickNameList", hId);
	}

	public int updateHotelReviewScore(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.update("hotelMapper.updateHotelReviewScore", hId);
	}

	//호텔리뷰 삭제
	public int deleteHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.update("hotelMapper.deleteHotelReview", hotelReply);
	}

	//호텔리뷰 삭제후, 리뷰개수 카운트
	public int countHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.selectOne("hotelMapper.countHotelReview", hotelReply);
	}

	//호텔리뷰 삭제후, 리뷰개수가 0개일 때, 호텔리뷰점수 0점으로 바꾸기
	public int updateHotelReviewScoreZero(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("hotelMapper.deleteHotelReviewScoreZero",boNo);
	}

	
	//2020.12.01 ~ 2020.12.02
	//(1) 호텔상세 검색 - 검색조건을 만족하는 호텔번호를 구한다.
	public ArrayList<Integer> getDetailSearchResultHotelBoNoList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> detailSearchMap) {
		
		return (ArrayList)sqlSession.selectList("hotelMapper.getDetailSearchResultHotelBoNoList", detailSearchMap);
	}

//	//(2:폐기) 호텔 번호에 만족하는 호텔을 구한다.
//	public Hotel selectDetailSearchResultOneHotel(SqlSessionTemplate sqlSession, int hId) {
//		return sqlSession.selectOne("hotelMapper.selectOneHotel", hId);
//	}

	//(2:최종) 호텔번호 리스트에 만족하는 호텔을 구한다.
	public ArrayList<Hotel> selectDetailSearchHotelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchHashMap) {
		PageInfo pi= (PageInfo) searchHashMap.get("pi");
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.selectDetailSearchHotelList",searchHashMap ,rowBounds);
	}

	public int selectOneHotelMinPrice(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.selectOneHotelMinPrice", hId);
	}

	
	//2020.12.03 - 등급 내림차순 정렬(폐기)
	public ArrayList<Hotel> sortRankDescendent(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hotelMapper.sortRankDescendent");
	}

	//2020.12.09 - 등급순 내림차순 페이징포함
	public ArrayList<Hotel> selectOrderedRankDescendent(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.sortRankDescendent", null, rowBounds);
	}
	
	
	//2020.12.03- 평점순 (폐기)
	public ArrayList<Hotel> sortPopularDescendent(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hotelMapper.sortPopularDescendent");
	}
	
	//2020.12.09-평점순 페이지포함.
	public ArrayList<Hotel> selectOrderedPopularityDescendent(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.sortPopularDescendent", null, rowBounds);
	}

	
	//2020.12.04 -가격 높은 순(폐기)
//	public ArrayList<Integer> getOrderedHighPriceBoNoList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("hotelMapper.getOrderedHighPriceBoNoList");
//	}
	
	//2020.12.09 - 가격 높은순
	public ArrayList<Hotel> selectOrderedHighPriceHotelList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.sortHighPrice", null , rowBounds);
	}
	

	//2020.12.04 -가격 낮은순(폐기)
//	public ArrayList<Integer> getOrderedLowPriceBoNoList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("hotelMapper.getOrderedLowPriceBoNoList");
//	}

	//2020.12.09 - 가격낮은순
	public ArrayList<Hotel> selectOrderedLowPriceHotelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.sortLowPrice", null, rowBounds);
	}


	
	//2020.12.07~2020.12.08 - 호텔등록
	public int insertBoard(SqlSessionTemplate sqlSession, Hotel hotel) {
		return sqlSession.insert("hotelMapper.insertBoard", hotel);
	}
	
	public int insertHotel(SqlSessionTemplate sqlSession, Hotel hotel) {
		return sqlSession.insert("hotelMapper.insertHotel", hotel);
	}
	
	//호텔썸네일/디테일 이미지 등록
	public int insertOneHotelImg(SqlSessionTemplate sqlSession, HashMap<String, Object> imgHashMap) {
		return sqlSession.insert("hotelMapper.insertOneHotelImg", imgHashMap);
	}
	

	//2020.12.07 - 방등록
	public int insertOneRoom(SqlSessionTemplate sqlSession, Room room) {
		return sqlSession.insert("hotelMapper.insertRoom", room);
	}

	
	//2020.12.07- 호텔삭제(Board삭제)
	public int deleteBoard(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.update("hotelMapper.deleteBoard",hId);
	}

	//2020.12.08 - 호텔 이미지 구하기(썸네일이미지 + 디테일이미지) 
	//사용목적: 호텔삭제시 같이 등록된 이미지도 같이 삭제할때 사용.
	public ArrayList<Attachment> selectHotelImgList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectHotelImgList", hId);
	}

	//2020.12.08 - 호텔 이미지  한개 지우기
	public int deleteHotelImg(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.update("hotelMapper.deleteOneHotelImg", fileNo);
	}

	//2020.12.08 - 호텔 썸네일 이미지 찾기
	//사용목적: (1) 호텔리스트에 썸네일 이미지 표시.
	public Attachment selectOneHotelThumbnailImg(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.selectOne("hotelMapper.selectOneHotelThumbnailImg", boNo);
	}

	//2020.12.08 - 호텔 디테일 이미지 리스트 찾기
	public ArrayList<Attachment> selectDetailImgList(SqlSessionTemplate sqlSession, int boNo) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectDetailImgList", boNo);
	}

	
	//2020.12.13- 호텔리스트 수정
	//(1) 1개의 호텔이 보유한 객실중 가장 비싼 객실가격을 구한다.
	public int findHotelMaxPrice(SqlSessionTemplate sqlSession, int boNo) {
		return  sqlSession.selectOne("hotelMapper.findHotelMaxPrice", boNo);
	}

	//2020.12.15
	//호텔예약하기
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation reservation) {
		return sqlSession.insert("hotelMapper.insertReservation", reservation);
	}

	//2020.12.21
	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession, int hId) {
		return(ArrayList) sqlSession.selectList("hotelMapper.selectRoomList", hId);
	}

	

}
