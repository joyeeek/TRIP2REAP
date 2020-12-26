package trip.two.reap.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;


public interface HotelService {

	// 호텔 리스트 불러오기
	int getHotelListCount();

	ArrayList<Hotel> selectHotelList(PageInfo pi);

	// 호텔 디테일뷰 불러오기.
	Hotel selectOneHotel(int hId);

	// 호텔에 등록한 방들을 구한다.
	int getRoomListCount(int hId); //호텔에 등록된 방개수구하기.
	ArrayList<String> getRoomTypeList(int hId); //호텔에 등록된 방종류 리스트 구하기.

	ArrayList<Room> searchRoomTypeList(int hId, HashMap<String, Object> roomInfoMap);

	//예약페이지 이동
	Room selectOneRoomInfo(int roomId); //방번호에 해당하는 방정보가 존재하는지 확인.


	// 호텔리스트 - 호텔방 최소가격을 의미함.
	int findHotelMinPrice(int boNo);

	ArrayList<Integer> selectMinPriceRoomList(HashMap<String, Object> minPriceInfoMap);

	// 해당 계정에서 , 호텔들을 좋아요 눌렀는지 확인하는 함수.
	// isSmashedLikeBtn은 호텔리스트에서 랜더링할때 사용.
	int isSmashedLikeBtn(HashMap<String, Object> map);

	//좋아요 해제
	int cancelLikeHotel(HashMap<String, Object> map);

	//좋아요를 눌렀고, 좋아요 해제를 반영한게 있는지 확인.
	int isCanceledLikeBtn(HashMap<String, Object> map);

	// 좋아요로 바꾸기
	int updateLikeHotel(HashMap<String, Object> map);

	// like 테이블에 등록하기
	int insertLikeHotel(HashMap<String, Object> map);

	//호텔 좋아요 개수 표시 
	int countHotelLike(int hId);
	
	//호텔 리뷰등록
	int insertReview(Reply hotelReply); // REPLY테이블에 넣는다.
	
	int insertHotelReview(Reply hotelReply); // HOTEL_REVIW 테이블에 넣는다.

	//리뷰리스트 
	ArrayList<Reply> selectOneHotelReplyList(int hId);

	//리뷰작성자 닉네임 리스트 
	ArrayList<String> selectOneHotelReplyNickNameList(int hId);

	//호텔 리뷰점수 업데이트
	int updateHotelReviewScore(int boNo);

	//호텔 리뷰 삭제
	int deleteHotelReview(Reply hotelReply);

	// 리뷰 삭제 이후, 리뷰개수 카운트
	int countHotelReview(Reply hotelReply);

	//리뷰삭제이후, 리뷰개수가 0개일때 0점으로 바꾸기
	int updateHotelReviewScoreZero(int boNo);

	//2020.12.01 ~ 2020.12.02
	//호텔 상세검색 - 검색조건에 맞는 호텔구하기
	ArrayList<Integer> getDetailSearchResultHotelBoNoList(HashMap<String, Object> detailSearchMap);

	//hId에 해당하는 호텔정보한개 구하기
	//Hotel selectDetailSearchResultOneHotel(int hId);

	//검색조건에 만족하는 방번호를 가진 호텔리스트
	ArrayList<Hotel> selectDetailSearchHotelList(HashMap<String, Object> searchHashMap);

	//검색조건을 만족하는 호텔한개가 가진 방중 가장 싼 가격을 구한다.
	int selectHotelMinPrice(int hId);


	//2020.12.09 - 등급순 내림차순 정렬
	ArrayList<Hotel> selectOrderedRankDescendent(PageInfo pi);


	//2020.12.09 - 평점순 내림차순 정렬
	ArrayList<Hotel> selectOrderedPopularityDescendent(PageInfo pi);

	

	//2020.12.09 - 방가격 내림차순 정렬
	ArrayList<Hotel> selectOrderedHighPriceHotelList(PageInfo pi);


	//2020.12.09- 방가격 오름차순 정렬
	ArrayList<Hotel> selectOrderedLowPriceHotelList(PageInfo pi);


	
	//2020.12.07 - 호텔 등록
	int insertBoard(Hotel hotel);
	int insertHotel(Hotel hotel);
	int insertOneHotelImg(HashMap<String, Object> imgHashMap); //호텔썸네일 이미지 등록

	
	//2020.12.07 - 호텔에 등록한 객실 등록
	int insertOneRoom(Room room);

	//2020.12.07 - 호텔 삭제
	int deleteBoard(int hId);

	//2020.12.08 -호텔 이미지 구하기
	ArrayList<Attachment> selectHotelImgList(int hId);
	
	//2020.12.08- FILE_NO를 찾아서 이미지 1개 지우기
	int deleteHotelImg(int fileNo);

	//2020.12.08 -hotelList.ho/ hotelDetailView.ho - 호텔한개의 썸네일이미지를 찾는다.
	Attachment selectOneHotelThumbnailImg(int boNo);

	//2020.12.08 -hotelDetailView.ho - 호텔한개의 디테일이미지들(디테일이미지 리스트)을 찾는다.
	ArrayList<Attachment> selectDetailImgList(int boNo);

	
	//호텔리스트 수정피드백 반영
	//2020.12.13 - 호텔리스트 - 가장비싼 객실가격을 구한다.
	int findHotelMaxPrice(int boNo);

	//2020.12.15 - 결제진행이 성공하면, 호텔예약테이블에 등록한다.
	int insertReservation(Reservation reservation);

	//2020.12.20 - 리모컨 기능
	//호텔 한개 정보를 찾는다.
	Hotel selectOnlyOneHotel(int hId);

	ArrayList<Room> selectRoomList(int hId);



	
	

	

	


}
