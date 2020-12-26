package trip.two.reap.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.dao.HotelDAO;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;

@Service("hService")
public class HotelServiceImpl implements HotelService{

	//세션
	@Autowired
	private SqlSessionTemplate sqlSession;

	//HotelDAO
	@Autowired
	private HotelDAO hDAO;

	//2020.11.23
	// 1. 호텔 리스트 불러오기.
	@Override
	public int getHotelListCount() {
		return hDAO.getHotelListCount(sqlSession);
	}

	@Override
	public ArrayList<Hotel> selectHotelList(PageInfo pi) {
		return hDAO.selectHotelList(sqlSession, pi);
	}

	//2020.11.25 - 조회수 증가 + hId에 해당하는 호텔 정보만 갖고오기(호텔디테일)
	@Override
	public Hotel selectOneHotel(int hId) {
		Hotel hotel= null;
		//게시글 조회수 증가 : boNo가 hId인 게시글 카운트 증가
		int result=hDAO.addReadCount(sqlSession, hId);
		if(result>0) {
			//호텔번호가 hId인 호텔에서 등록한 방을 구한다!

			//게시글(호텔)이 존재
			hotel=hDAO.selectOneHotel(sqlSession, hId);
		}
		return hotel;
	}
	
	//2020.12.20 - 리모컨 - 호텔번호에 해당하는 호텔을 구한다.
	@Override
	public Hotel selectOnlyOneHotel(int hId) {
		return hDAO.selectOneHotel(sqlSession, hId);
	}
	
	

	//방개수를 구한다.
	@Override
	public int getRoomListCount(int hId) {
		return hDAO.getRoomListCount(sqlSession, hId);
	}


	//호텔번호가 hId에 해당하는 방들을 구한다.
	@Override
	public ArrayList<String> getRoomTypeList(int hId) {
		return hDAO.getRoomTypeList(sqlSession, hId) ;
	}

	//호텔번호가 hId이고, 방종류가 type인 방리스트를 구한다.
	@Override
	public ArrayList<Room> searchRoomTypeList(int hId, HashMap<String, Object> roomInfoMap) {
		return hDAO.searchRoomTypeList(sqlSession, roomInfoMap);
	}

	// roomId에 해당하는 방정보1개를 가져온다.
	@Override
	public Room selectOneRoomInfo(int roomId) {
		return hDAO.selectOneRoomInfo(sqlSession, roomId);
	}


	//2020.11.27
	//방리스트 - 최소가격 나타내기
	@Override
	public int findHotelMinPrice(int boNo) {
		return hDAO.findHotelMinPrice(sqlSession, boNo);
	}

	//가장 싼 가격의 방리스트를 구한다.
	@Override
	public ArrayList<Integer> selectMinPriceRoomList(HashMap<String, Object> minPriceInfoMap) {
		return hDAO.selectMinPriceRoomList(sqlSession, minPriceInfoMap);
	}


	//해당계정에서, 좋아요 누른 호텔 구하기(호텔리스트)
	@Override
	public int isSmashedLikeBtn(HashMap<String, Object> map) {
		return hDAO.isSmashedLikeBtn(sqlSession, map);
	}


	//좋아요 해제
	@Override
	public int cancelLikeHotel(HashMap<String, Object> map) {
		return hDAO.cancelLikeHotel(sqlSession, map);
	}


	//좋아요 반영
	// 이미 좋아요를 눌렀는지 확인.(이미좋아요를 눌렀고, 현재는 좋아요 해제로 되어있는게 잇는지 확인)
	@Override
	public int isCanceledLikeBtn(HashMap<String, Object> map) {
		return hDAO.isCanceledLikeBtn(sqlSession, map);
	}

	@Override
	public int updateLikeHotel(HashMap<String, Object> map) {
		return hDAO.updateLikeHotel(sqlSession, map);
	}

	@Override
	public int insertLikeHotel(HashMap<String, Object> map) {
		return hDAO.insertLikeHotel(sqlSession, map);
	}

	//2020.11.30
	//호텔 좋아요개수 구하기 
	@Override
	public int countHotelLike(int hId) {
		return hDAO.countHotelLike(sqlSession, hId);
	}

	//호텔 리뷰 등록하기 
	//(1) REPLY테이블에 넣는다.
	@Override
	public int insertReview(Reply hotelReply) {
		// TODO Auto-generated method stub
		return hDAO.insertReview(sqlSession, hotelReply);
	}
	
	
	//(2) HOTEL_REVIEW테이블에 넣는다.
	@Override
	public int insertHotelReview(Reply hotelReply) {
		return hDAO.insertHotelReview(sqlSession, hotelReply);
	}

	
	// 리뷰 리스트 
	@Override
	public ArrayList<Reply> selectOneHotelReplyList(int hId) {
		return hDAO.selectOneHotelReplyList(sqlSession, hId);
	}

	
	//리뷰작성자 닉네임 리스트 
	@Override
	public ArrayList<String> selectOneHotelReplyNickNameList(int hId) {
		return hDAO.selectOneHotelReplyNickNameList(sqlSession, hId);
	}

	//호텔리뷰점수 업데이트
	@Override
	public int updateHotelReviewScore(int boNo) {
		return hDAO.updateHotelReviewScore(sqlSession, boNo);
	}

	//호텔 리뷰 삭제 
	@Override
	public int deleteHotelReview(Reply hotelReply) {
		return hDAO.deleteHotelReview(sqlSession, hotelReply);
	}

	//리뷰 삭제 이후, 리뷰개수 카운트
	@Override
	public int countHotelReview(Reply hotelReply) {
		return hDAO.countHotelReview(sqlSession, hotelReply);
	}

	
	//리뷰삭제 이후, 리뷰개수가 0개일때, 0점으로 바꾸기
	@Override
	public int updateHotelReviewScoreZero(int boNo) {
		return hDAO.updateHotelReviewScoreZero(sqlSession, boNo);
	}

	
	//2020.12.01 ~2020.12.02
	//호텔 상세검색
	//1. 조건을 만족하는 호텔번호를 구한다.
	@Override
	public ArrayList<Integer> getDetailSearchResultHotelBoNoList(HashMap<String, Object> detailSearchMap) {
		return hDAO.getDetailSearchResultHotelBoNoList(sqlSession, detailSearchMap);
	}


	//2.(폐기) 방번호에 해당하는 호텔정보를 갖고온다.
//	@Override
//	public Hotel selectDetailSearchResultOneHotel(int hId) {
//		return hDAO.selectDetailSearchResultOneHotel(sqlSession, hId);
//	}
	

	//2.(최종) 검색조건에 만족하는 호텔번호 리스트에 해당하는 호텔정보를 갖고온다.
	@Override
	public ArrayList<Hotel> selectDetailSearchHotelList(HashMap<String, Object> searchHashMap) {
		return hDAO.selectDetailSearchHotelList(sqlSession, searchHashMap);
	}

	
	//3. 검색조건을 만족하는 호텔(호텔번호에 부합된 호텔)이 보유한 방중 가장 싼 방가격을 구한다.
	@Override
	public int selectHotelMinPrice(int hId) {
		return hDAO.selectOneHotelMinPrice(sqlSession, hId);
	}


	
	//2020.12.09 -등급순 내림차순 정렬
	@Override
	public ArrayList<Hotel> selectOrderedRankDescendent(PageInfo pi) {
		return hDAO.selectOrderedRankDescendent(sqlSession, pi);
	}
	
	
	//2020.12.09 - 평점순 내림차순 정렬
	@Override
	public ArrayList<Hotel> selectOrderedPopularityDescendent(PageInfo pi) {
		return hDAO.selectOrderedPopularityDescendent(sqlSession, pi);
	}
	

	
	//2020.12.09- 가격높은순
	@Override
	public ArrayList<Hotel> selectOrderedHighPriceHotelList(PageInfo pi) {
		return hDAO.selectOrderedHighPriceHotelList(sqlSession, pi);
	}


	
	//2020.12.09 -방가격 낮은순
	@Override
	public ArrayList<Hotel> selectOrderedLowPriceHotelList(PageInfo pi) {
		return hDAO.selectOrderedLowPriceHotelList(sqlSession, pi);
	}

	
	//2020.12.07~2020.12.08 - 호텔등록
	@Override
	public int insertBoard(Hotel hotel) {
		return hDAO.insertBoard(sqlSession, hotel);
	}
	
	
	@Override
	public int insertHotel(Hotel hotel) {
		return hDAO.insertHotel(sqlSession, hotel);
	}
	
	//2020.12.08
	//호텔썸네일 이미지 등록
	@Override
	public int insertOneHotelImg(HashMap<String, Object> imgHashMap) {
		return hDAO.insertOneHotelImg(sqlSession, imgHashMap);
	}

	
	//2020.12.07 - 방등록
	@Override
	public int insertOneRoom(Room room) {
		return hDAO.insertOneRoom(sqlSession, room);
	}

	
	//2020.12.07 - 호텔삭제(board삭제)
	@Override
	public int deleteBoard(int hId) {
		return hDAO.deleteBoard(sqlSession, hId);
	}

	//2020.12.08 - 호텔관련 이미지 구하기
	@Override
	public ArrayList<Attachment> selectHotelImgList(int hId) {
		return hDAO.selectHotelImgList(sqlSession, hId);
	}

	//2020.12.08 -호텔이미지 지우기
	@Override
	public int deleteHotelImg(int fileNo) {
		return hDAO.deleteHotelImg(sqlSession, fileNo);
	}

	//2020.12.08 - 호텔썸네일이미지 한개구하기
	@Override
	public Attachment selectOneHotelThumbnailImg(int boNo) {
		return hDAO.selectOneHotelThumbnailImg(sqlSession, boNo);
	}

	//2020.12.08 - 호텔 디테일 이미지 뷰 구하기
	@Override
	public ArrayList<Attachment> selectDetailImgList(int boNo) {
		return hDAO.selectDetailImgList(sqlSession, boNo);
	}

	
	//2020.12.13 - (한개 호텔)가장비싼 객실가격을 구한다.
	@Override
	public int findHotelMaxPrice(int boNo) {
		return hDAO.findHotelMaxPrice(sqlSession, boNo);
	}

	//2020.12.15 - 호텔예약등록하기
	@Override
	public int insertReservation(Reservation reservation) {
		return hDAO.insertReservation(sqlSession, reservation);
	}

	@Override
	public ArrayList<Room> selectRoomList(int hId) {
		return hDAO.selectRoomList(sqlSession, hId);
	}

	
	

}
