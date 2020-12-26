package trip.two.reap.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.hotel.exception.HotelException;
import trip.two.reap.hotel.model.service.HotelService;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Reservation;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class HotelController {
	@Autowired
	private HotelService hService;
	
	private static String OS= System.getProperty("os.name").toLowerCase(); //os구분용도 -파일업로드에서 os마다 경로표기방식이 다르기때문에 사용.


	@RequestMapping("hotelList.ho")
	public ModelAndView hotelList(@RequestParam(value="page", required=false, defaultValue="1") Integer page ,
			@RequestParam(value="searchTypeDetail", required=false, defaultValue="0") int searchTypeDetail,
			@RequestParam(value="searchHotelRank", required=false, defaultValue="0") int searchHotelRank ,
			@RequestParam(value="searchHotelLocalCode", required=false, defaultValue="0") int searchHotelLocalCode,
			@RequestParam(value="searchHotelPricePerDayType", required=false, defaultValue="0") int searchHotelPricePerDayType,
			@RequestParam(value="searchHotelName", required=false) String searchHotelName,
			HttpSession session, ModelAndView mv)throws HotelException{
		//httpSession
		//searchTypeDetail:검색조건
		//0: BO_NO 순서대로
		//1: 평점순
		//2: 등급순
		//3: 가격순-높은순
		//4: 가격순-낮은순
		//5: 상세검색
		mv.addObject("searchTypeDetail",searchTypeDetail)
		.addObject("searchHotelRank", searchHotelRank)
		.addObject("searchHotelLocalCode", searchHotelLocalCode)
		.addObject("searchHotelPricePerDayType", searchHotelPricePerDayType)
		.addObject("searchHotelName", searchHotelName);
		
		
		//검색호텔이름이 존재하지않으면 null로한다.
		if(searchHotelName=="") {
			searchHotelName=null;
		}
		
		int currentPage =1; //호텔예약페이지에 접속 초기 페이지번호
		if(page !=null) {
			currentPage=page;
		}

		//hotelListCount, pi, hotelList초기화
		int hotelListCount=0;
		PageInfo pi=null;
		ArrayList<Hotel> hotelList=null;
		ArrayList<Integer> boNoList=null; //검색조건만족호텔 번호리스트
		int boNoListCount=0;
		
		if(searchTypeDetail==0){
			// searchTypeDetail ==0 (검색조건이 없을때)
			//(1)호텔리스트 개수를 구한다.
			hotelListCount= hService.getHotelListCount();
			
			//(2)페이지인포를 구한다.
			pi = Pagination.getPageInfo(currentPage, hotelListCount);
	
			//(3)페이지에 해당하는 보드값을 구한다.
			hotelList= hService.selectHotelList(pi);
			
		} else if(searchTypeDetail==1) {
			//평점순검색(전체호텔을 대상)
			hotelListCount=hService.getHotelListCount();
			pi = Pagination.getPageInfo(currentPage, hotelListCount);
			hotelList= hService.selectOrderedPopularityDescendent(pi);
			
		}else if(searchTypeDetail==2) {
			//등급순검색(전체호텔 대상)
			hotelListCount=hService.getHotelListCount();
			pi = Pagination.getPageInfo(currentPage, hotelListCount);
			hotelList=hService.selectOrderedRankDescendent(pi);
			
			
		}else if(searchTypeDetail==3) {
			//가격순(높은순) 검색 : (전체호텔대상)
			hotelListCount=hService.getHotelListCount();
			pi = Pagination.getPageInfo(currentPage, hotelListCount);
			hotelList=hService.selectOrderedHighPriceHotelList(pi);
			
			
		}else if(searchTypeDetail==4) {
			//가격순(낮은순) 검색: (전체호텔대상)
			hotelListCount=hService.getHotelListCount();
			pi = Pagination.getPageInfo(currentPage, hotelListCount);
			
			//호텔 방최저가가 가장싼것을 우선으로해서 호텔을 정렬
			hotelList=hService.selectOrderedLowPriceHotelList(pi);
			
		}else if(searchTypeDetail==5) {
			//상세검색 결과: (조건에 만족하는 호텔만 해당)
			//검색조건 해시맵
			HashMap<String,Object> detailSearchMap=new HashMap<String, Object>();
			detailSearchMap.put("searchLocalCode", searchHotelLocalCode);
			detailSearchMap.put("searchHotelRank", searchHotelRank);
			
			if(searchHotelName!=null)
				searchHotelName="%"+searchHotelName+"%";
			
			detailSearchMap.put("searchHotelName", searchHotelName);
			detailSearchMap.put("searchHotelPricePerDayType", searchHotelPricePerDayType);
			
			//검색조건을 만족하는 호텔번호리스트를 구한다. (조건에 만족하는 호텔번호는 중복허용하지 않는다)
			boNoList=hService.getDetailSearchResultHotelBoNoList(detailSearchMap);					
			boNoListCount=boNoList.size();
			hotelListCount=boNoList.size();
			
			pi=Pagination.getPageInfo(currentPage, boNoListCount);
			
			if(boNoListCount>0) {
				//검색조건에 만족하는 호텔리스트를 구한다.
				HashMap<String, Object> searchHashMap =new HashMap<String, Object>();
				searchHashMap.put("pi", pi);
				searchHashMap.put("searchBoNoList", boNoList);
				hotelList=hService.selectDetailSearchHotelList(searchHashMap);
			}
		
		}
		
		//최종적으로 hotelList에 정렬된/검색조건에 만족하는 호텔들을 담아야한다!
		// 각 호텔 중 가장싼 방가격을 담은 리스트를 구한다.
		ArrayList<Integer> minRoomPricePerDayList=null;
		
		
		//2020.12.13
		// 각 호텔 중 가장비싼 방가격을 담은 리스트를 구한다.
		ArrayList<Integer> maxRoomPricePerDayList= null;
		
		//2020.12.13
		//해시태그리스트의 리스트를 구한다.
		// 리스트안에 구분자(,)로 split된 리스트를 저장.
		ArrayList<ArrayList<String>> hashTagList= null;


		//해당 계정에서 좋아요를 눌렀는지 확인 (1: 좋아요를 누름/ 0: 좋아요를 누르지 않음)
		//크기를  hotelListcount개 로 한다.
		//모두 0으로 초기화 한다.
		ArrayList<Integer> likeHotelList= new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}

		//로그인 계정 아이디확인
		Member loginUser= (Member)session.getAttribute("loginUser");
		
		//썸네일이미지 리스트
		ArrayList<Attachment> thumbnailImgList=null;
		

		if(hotelList!=null) {
			//호텔리스트가 존재함!
			//가장 싼 방 가격을 구한다.
			minRoomPricePerDayList=new  ArrayList<Integer>();
			
			
			//가장비싼 방가격을 구한다.
			maxRoomPricePerDayList=new ArrayList<Integer>();
			
			//해시태그리스트
			hashTagList= new ArrayList< ArrayList<String> >();
			
			//호텔썸네일 이미지가 존재하는지 확인한다.
			thumbnailImgList= new ArrayList<Attachment>();
			
			int hotelMinPrice, hotelMaxPrice;
			for(Hotel hotel :hotelList) {
				//호텔번호에 해당하는 가장싼 방가격을 조회하여 리스트에 추가.
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
				
				//2020.12.13
				//호텔번호에 해당하는 가장비싼 방가격을 조회하여 리스트에 추가
				hotelMaxPrice= hService.findHotelMaxPrice(hotel.getBoNo());
				maxRoomPricePerDayList.add(hotelMaxPrice);
				
				
				if(hotel.getBoTag()!=null) {
					//boTag 컬럼이 null이 아니라면
					//해시태그문자열을 구하여 -> split을하고 -> split한 리스트를 hashTagList에 넣는다.
					ArrayList<String> oneHotelHashTagList= new ArrayList<String>();
					String [] splitedHashTagStr= hotel.getBoTag().split(", "); //해시태그 문자열을 ', ' 을 기준으로 split시켜서 문자열로 나타냄.
					for(String hashTag: splitedHashTagStr) {
						oneHotelHashTagList.add(hashTag);
					}
					hashTagList.add(oneHotelHashTagList);
				}else {
					//해시태그가 존재하지 않는다면 -> 일단 리스트에 널을 넣는다.
					hashTagList.add(null);
				}
				
				
				
				//호텔번호에 해당하는 썸네일이미지 1개를 조회하여 리스트에 추가한다.
				Attachment hotelThumbnailImg= hService.selectOneHotelThumbnailImg(hotel.getBoNo());
				thumbnailImgList.add(hotelThumbnailImg);
			}


			if(loginUser!=null) { //로그인한 계정이라면
				HashMap<String , Object> checkLikeMap= new HashMap<String, Object>();

				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);

					//hId값을 변경하면됨
					checkLikeMap.put("hId", hotel.getBoNo());

					//좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set( hotelIdx, result);
					}
				}
			}

		}
		
		mv.addObject("hotelList", hotelList);
		mv.addObject("pi", pi);
		mv.addObject("minRoomPricePerDayList", minRoomPricePerDayList);
		mv.addObject("maxRoomPricePerDayList", maxRoomPricePerDayList); //12.13- 최대가격
		mv.addObject("likeHotelList",likeHotelList);
		mv.addObject("thumbnailImgList", thumbnailImgList);
		mv.addObject("hashTagList", hashTagList);
		mv.setViewName("hotel_list");

		return mv;
	}

	

	// 호텔 디테일뷰 페이지로 이동
	@RequestMapping("hotelDetailView.ho")
	public ModelAndView goHotelDetailView(@RequestParam("hId") int hId,
			@RequestParam(value="page", required=false) int page, //12.17 추가
			HttpServletResponse response, //12.20 추가 
			ModelAndView mv)throws HotelException 
	{
		//12.20 쿠키 코드 추가 /////
		try {
			//쿠키생성 - 호텔넘버(hId)를 문자열로 변환시켜서 쿠키생성..
			Cookie cookie= new Cookie("hotelNo", URLEncoder.encode( Integer.toString(hId), "utf-8"));
			cookie.setMaxAge(60*40); //40분유지
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//////////////////////
		
		//hId에 해당하는 호텔을 구한다.
		ArrayList<String>hashTagsList=null;
		ArrayList<String>hotelOptionsList=null;
		Hotel hotel=hService.selectOneHotel(hId);

		int roomCnt=0; 	// hId 호텔번호에 해당하는 호텔에 등록된 방 개수
		int likeCnt=0;  // hId 호텔번호의 좋아요 개수 

		//hId중 가장 싼 가격의 방번호를 구한다.
		//여러개가 있다면 가장 첫번째꺼를 구하면된다.
		int minPriceRoomId=-1; //초기화
		ArrayList<String>roomTypeList=null; //hId에 해당하는 방종류리스트를 구한다.
		ArrayList<Reply> reviewList=null; // hId에 해당하는 리뷰댓글을 불러온다.
		int reviewListCount =0; //리뷰개수
		ArrayList<String> reviewNickNameList=null; // 리뷰작성자의 닉네임 리스트
		Attachment thumbnailImg= null; //썸네일 이미지
		ArrayList<Attachment> detailViewList= null; //디테일이미지 리스트
		
		HashMap<String,ArrayList<Room>> roomMap=null; //방리스트맵 (키값: 방종류: roomType)

		if(hotel!=null) {
			roomCnt= hService.getRoomListCount(hId); //hId에 해당하는 방의 개수를 구한다.
			likeCnt= hService.countHotelLike(hId); //hId에 해당하는 호텔의 좋아요 개수를 구한다.
			
			//해시태그 보여주기
			if(hotel.getBoTag()!=null) { 
				//해시태그가 null이 아니라면
				hashTagsList=new ArrayList<String>();
				String [] hashTagSplited= hotel.getBoTag().split(", ");
				for(String hashTag : hashTagSplited) {
					hashTagsList.add(hashTag);
				}
			}

			//호텔옵션 보여주기
			if(hotel.getHotelOptions()!=null) {
				hotelOptionsList= new ArrayList<String>();
				String [] hotelOptionSplited= hotel.getHotelOptions().split(", ");
				for(String option: hotelOptionSplited) {
					hotelOptionsList.add(option);
				}
			}

			//호텔 방종류와 방
			if(roomCnt >0) { //방데이터가 존재한다면
				//방종류 리스트를 구한다.
				roomTypeList=hService.getRoomTypeList(hId); //방종류
				roomMap=new HashMap<String, ArrayList<Room>>();

				//방종류이름을 키값으로하고, 해당 방종류의 룸을 구한다.
				for(String type: roomTypeList) {
					HashMap<String, Object> roomInfoMap= new HashMap<String, Object>();
					roomInfoMap.put("hId", hId);//방번호
					roomInfoMap.put("type", type);//방종류
					ArrayList<Room> roomList=hService.searchRoomTypeList(hId, roomInfoMap); //방종류에 해당하는 방리스트를 구한다.
					roomMap.put(type, roomList); //방리스트를 맵에넣는다.
				}

				//2020.11.27
				//가장 싼 방 데이터를 구한다.
				int minPrice= hService.findHotelMinPrice(hId); //해당호텔에서 가장싼 가격을 구한다.
				HashMap <String, Object> minPriceInfoMap = new HashMap<String, Object>(); //가장싼방의 개수가 여러개라면 그중 맨앞에꺼를 선택
				minPriceInfoMap.put("hId", hId);
				minPriceInfoMap.put("minPrice", minPrice);
				ArrayList<Integer> minPriceRoomList=hService.selectMinPriceRoomList(minPriceInfoMap);
				minPriceRoomId= minPriceRoomList.get(0);
			}
			
			reviewList= hService.selectOneHotelReplyList(hId); //리뷰리스트를 보여준다.
			if(reviewList!=null) {
				reviewListCount=reviewList.size();
			}
			
			reviewNickNameList= hService.selectOneHotelReplyNickNameList(hId); //리뷰작성자 닉네임 리스트 
			thumbnailImg= hService.selectOneHotelThumbnailImg(hotel.getBoNo()); //썸네일 이미지 보여주기
			detailViewList=hService.selectDetailImgList(hotel.getBoNo()); //디테일이미지 리스트보여주기
			
			mv.addObject("hotel", hotel)
			.addObject("page",page)
			.addObject("roomCnt", roomCnt)
			.addObject("hashTagsList", hashTagsList)
			.addObject("hotelOptionsList", hotelOptionsList)
			.addObject("roomMap", roomMap)
			.addObject("minPriceRoomId", minPriceRoomId)
			.addObject("likeCnt", likeCnt)
			.addObject("reviewList", reviewList)
			.addObject("reviewListCount", reviewListCount)
			.addObject("reviewNickNameList", reviewNickNameList)
			.addObject("thumbnailImg", thumbnailImg)
			.addObject("detailViewList",detailViewList)
			.setViewName("hotel_detail");
		}else {
			throw new HotelException("해당 호텔이 존재하지 않습니다!");
		}
		return mv;
	}

	
	//2020.11.26
	// 호텔 예약페이지로 이동
	@RequestMapping("hotelReservationView.ho")
	public ModelAndView goHotelReservationView(@RequestParam("hId") int hId, 
			@RequestParam("roomId") int roomId,
			@RequestParam(value="page", required=false) int page,
			ModelAndView mv) throws HotelException {
		// hId에 해당하는 호텔정보가 존재하는지 확인한다.
		Hotel hotelInfo=hService.selectOneHotel(hId);

		Room roomInfo= null;
		if(hotelInfo !=null) {
			// roomId에 해당하는 방이 존재하는지 확인한다.
			roomInfo= hService.selectOneRoomInfo(roomId);
			if(roomInfo==null) {
				//방조회 실패
				throw new HotelException("객실이 존재하지 않습니다");
			}

		}else {
			//호텔조회 실패
			throw new HotelException("호텔이 존재하지 않습니다!");
		}

		mv.addObject("hotel", hotelInfo)
		.addObject("page", page)
		.addObject("room", roomInfo)
		.setViewName("hotel_reservation");
		return mv;
	}
	

	//2020.11.27
	@RequestMapping("updateLikeHotel.ho")
	@ResponseBody
	public void updateLikeHotel(HttpSession session, int hId, HttpServletResponse response) throws HotelException {
		//좋아요 반영
		HashMap<String, Object> map= new HashMap<String, Object>();
		Member loginUser= (Member) session.getAttribute("loginUser");
		map.put("loginUserId", loginUser.getMemberId());
		map.put("hId", hId);


		// 좋아요를 처음 누르는가?
		// 좋아요를 전에 눌렀지만, LIKE_YN='N'으로 되어있는가?
		int isAlreadySmashedBtn= hService.isCanceledLikeBtn(map);
		int result=0;
		if(isAlreadySmashedBtn>0) {
			// LIKE_YN='Y'로 반영한다.
			result=hService.updateLikeHotel(map);

		}else {
			//처음으로 좋아요를 눌렀음 => like테이블에 추가
			result=hService.insertLikeHotel(map);
		}

		if(result==0) {
			throw new HotelException("좋아요 반영에 실패하였습니다.");
		}


	}

	@RequestMapping("updateCancelLikeHotel.ho")
	@ResponseBody
	public void updateCancelLikeHotel(HttpSession session, int hId, HttpServletResponse response) throws HotelException {
		//좋아요 해제 반영
		HashMap<String, Object> map= new HashMap<String, Object>();
		Member loginUser= (Member) session.getAttribute("loginUser");
		map.put("loginUserId", loginUser.getMemberId());
		map.put("hId", hId);

		//이미 좋아요를 눌렀는데, LIKE_YN='Y'로 되어있는가?
		int isAlreadySmashedBtn=hService.isSmashedLikeBtn(map);
		int result=0;
		if(isAlreadySmashedBtn>0) {
			//이미 눌려져있다면 update하여 해제한다.
			result=hService.cancelLikeHotel(map);
			if(result==0) {
				throw new HotelException("좋아요 해제 반영을 실패하였습니다!");
			}
		}

	}
	
	//2020.11.30
	//호텔 리뷰 댓글 등록 
	@RequestMapping("insertHotelReview.ho")
	@ResponseBody
	public String insertHotelReview(Reply hotelReply, HttpSession session) throws HotelException {
		//로그인한 회원 아이디를 얻는다.
		Member loginUser=(Member) session.getAttribute("loginUser");
		hotelReply.setMemberId(loginUser.getMemberId());
		
		//댓글 등록(1) : Reply테이블에 넣는다.
		int result1=hService.insertReview(hotelReply);
		
		//댓글등록(2) : HOTEL_REVIEW 테이블에 넣는다!
		int result2=0;
		
		//호텔리뷰점수 업데이트
		int updateHotelReviewScore=0;
		
		if(result1>0) {
			result2= hService.insertHotelReview(hotelReply);
			if(result2>0) {
				updateHotelReviewScore=hService.updateHotelReviewScore(hotelReply.getBoNo());
				if(updateHotelReviewScore>0)
					return "success";
				else
					throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
			}
			else {
				throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
			}
		}else {
			throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
		}
		
	}
	
	//호텔리뷰 댓글 삭제
	@RequestMapping("deleteHotelReview.ho")
	@ResponseBody
	public String deleteHotelReview(Reply hotelReply) throws HotelException{
		int result=hService.deleteHotelReview(hotelReply);
		int reviewCnt=0;
		int updateHotelReviewScore=0;
		if(result>0) {
			//삭제후 리뷰개수에 따라 서비스 처리가 다르다.
			reviewCnt=hService.countHotelReview(hotelReply);
			
			if(reviewCnt==0) {
				//삭제 처리 이후 리뷰개수가 0개라면 => 0점으로 바꾼다.
				updateHotelReviewScore=hService.updateHotelReviewScoreZero(hotelReply.getBoNo());
			}else {
				//삭제 처리 이후, 리뷰개수가 0개가 아니라면 업데이트
				updateHotelReviewScore= hService.updateHotelReviewScore(hotelReply.getBoNo());
			}
			
			if(updateHotelReviewScore>0) {
				return "success";
			}else {
				throw new HotelException("호텔 리뷰 삭제에 실패하였습니다!");
			}
			
		}else {
			throw new HotelException("호텔 리뷰 삭제에 실패하였습니다!");
		}
	}
	

	
	//go to hotel insert page (only admin)
	// 호텔 등록페이지뷰로 이동
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		return "hotel_insert";
	}
	
	//호텔등록
	@RequestMapping("hotelInsert.ho")
	public String hotelInsert(@ModelAttribute Hotel hotel, 
	HttpServletRequest request,
	@RequestParam("rank") int hotelRank,
	@RequestParam("localCode") int hotelLocalCode,
	@RequestParam("openTime") int hotelOpenTime,
	@RequestParam("closeTime") int hotelCloseTime,
	@RequestParam("checkInTime") int hotelCheckInTime,
	@RequestParam("checkOutTime") int hotelCheckOutTime,
	@RequestParam("thumbnailImgFile") MultipartFile hotelThumbnailImg,
	@RequestParam("detailImgFiles") ArrayList<MultipartFile> hotelDetailViewImgs)throws HotelException {
	
		hotel.setHotelRank(hotelRank);
		hotel.setHotelLocalCode(hotelLocalCode);
		hotel.setHotelOpenTime(hotelOpenTime);
		hotel.setHotelCloseTime(hotelCloseTime);
		hotel.setHotelCheckInTime(hotelCheckInTime);
		hotel.setHotelCheckOutTime(hotelCheckOutTime);

		//1. BOARD테이블에 등록한다
		int boardInsertResult=hService.insertBoard(hotel);
		if(boardInsertResult>0) {
			
			//2. HOTEL 테이블에 등록한다.
			int hotelInsertResult= hService.insertHotel(hotel);
			if(hotelInsertResult>0) {
				
				//3. ROOM테이블에 호텔에 같이 등록한 객실들을 등록한다.
				int roomInsertResult;
				ArrayList<Room> rooms= hotel.getRoomList();
				
				for(Room room:rooms) {
					roomInsertResult=hService.insertOneRoom(room);
					if(roomInsertResult==0) {
						throw new HotelException("객실 등록에 실패하였습니다."); //ROOM테이블 등록실패
					}
				}
				
			}else {
				throw new HotelException("호텔 게시판 등록에 실패하였습니다."); //HOTEL테이블 등록 실패
			}
		}else {
			throw new HotelException("호텔 게시판 등록에 실패하였습니다."); //BOARD테이블 등록 실패
		}
		
		
		// 썸네일이미지
		HashMap<String, Object>  imgHashMap= null;
		if(!hotelThumbnailImg.getOriginalFilename().equals("")) {
			//썸네일 이미지가 존재한다
			//1. 썸네일 이미지를 buploadFiles에 넣는다.
			imgHashMap=saveImgFile(hotelThumbnailImg,1,request);
			
			//2. IMG_FILE 테이블에 추가한다.
			if(imgHashMap.get("changeName")!=null) { //변경된 이미지 이름이 null이 아니라면
				
				int thumbnailInsertResult=hService.insertOneHotelImg(imgHashMap);
				
				if(thumbnailInsertResult<=0) {
					throw new HotelException("호텔 썸네일 이미지 등록에 실패하였습니다.");
				}
			}
		}
		
		// 디테일이미지 등록
		if(hotelDetailViewImgs!=null) {
			//디테일이미지가 존재한다.
			for(MultipartFile detailImgFile : hotelDetailViewImgs) {
				//1. 한개의 디테일 이미지를 buploadFiles에 넣는다.
				imgHashMap=saveImgFile(detailImgFile,2, request);
				
				if(imgHashMap.get("changeName")!=null) {
					//2. 한개의 디테일이미지를 IMG_FILE 테이블에 추가한다.
					int detailInsertResult=hService.insertOneHotelImg(imgHashMap);
					if(detailInsertResult<=0) {
						throw new HotelException("호텔 디테일 이미지 등록에 실패하였습니다.");
					}
				}
			}
		}
		return "redirect:hotelList.ho";
	}
	
	
	//OS구분하기
	public static boolean isWindows() {
		return (OS.indexOf("win")>=0);
	}
	
	public static boolean isMac() {
		return (OS.indexOf("mac")>=0);
	}
	
	//이미지 저장메소드
	public HashMap<String, Object> saveImgFile(MultipartFile file, int imgCategory, HttpServletRequest request) {
		// imgCategory
		// 1: 썸네일 이미지
		// 2: 디테일이미지
		HashMap<String, Object> imgInfo= new HashMap<String, Object>();
		String root= request.getSession().getServletContext().getRealPath("resources");
		
		//저장 위치 설정 -OS에 따라 다르게 표기되기때문에 저장위치를 다르게한다.
		String savePath=root;
		if(isWindows()) {
			savePath= root+ "\\buploadFiles"; //windows
			
		}else if(isMac()) {
			savePath= root+"/buploadFiles"; //mac
		}

		
		File folder= new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); //폴더생성
		}
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String originImgFileName= file.getOriginalFilename();
		String renameImgFileName="";
		if(imgCategory==1) {
			//썸네일이미지 이름을 변경
			renameImgFileName= "hotel_thumbnail_"+sdf.format(new Date(System.currentTimeMillis()))+"."
											+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
		}else {
			//디테일이미지 이름을 변경
			renameImgFileName= "hotel_detail_"+sdf.format(new Date(System.currentTimeMillis()))+"."
					+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
		}
		
		String renamePath= folder+"";
		if(isWindows()) {
			renamePath= folder+"\\"+renameImgFileName; //windows
			
		}else if(isMac()) {
			renamePath= folder+"/"+renameImgFileName; //macos
		}
		
		//업로드한 파일을 저장한다.
		try {
			file.transferTo(new File(renamePath));
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}

		imgInfo.put("originName", originImgFileName);//원래파일이름
		imgInfo.put("changeName", renameImgFileName);//변경파일이름
		imgInfo.put("fileLevel", imgCategory); //파일레벨
		imgInfo.put("filePath", renamePath); //파일 저장경로
		return imgInfo;
	}
	
	
	
	//파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath=root;
		File file=null;
		if(isWindows()) {
			savePath= root+"\\buploadFiles";
			file= new File(savePath+"\\"+fileName);
		}else if(isMac()) {
			savePath= root+"/buploadFiles";
			file=new File(savePath+"/"+ fileName);
		}
		
		if(file!=null && file.exists()) {
			file.delete();
		}
	}
	
	
	@RequestMapping("hotelDelete.ho")
	public String deleteHotel(@RequestParam("hId") int hId, HttpServletRequest request) throws HotelException{
		
		//hId에 해당하는 이미지를 구한다.
		ArrayList<Attachment> hotelImgs= hService.selectHotelImgList(hId);
		if(hotelImgs!=null) {
			for(Attachment deleteTargetImg: hotelImgs) {
				//썸네일 이미지를 지운다: FILE_DELETE_YN을 N => Y로 변경.
				//디테일 이미지를 지운다: FILE_DELETE_YN을 N => Y로 변경.
				int deleteResult= hService.deleteHotelImg(deleteTargetImg.getFileNo());
				deleteFile(deleteTargetImg.getChangeName(),request); //buploadFiles에 있는 이미지 삭제.
				
				if(deleteResult<=0) {
					throw new HotelException("호텔 이미지 삭제에 실패하였습니다!");
				}
			}
		}
		
		//호텔을 지운다.
		int result=hService.deleteBoard(hId);
		if(result>0) {
			return "redirect:hotelList.ho";
		}else {
			throw new HotelException("호텔 삭제에 실패하였습니다.");
		}
	}
	
	
	//2020.12.13 ~ 2020.12.14 -호텔 예약
	@RequestMapping("hotelReservation.ho")
	@ResponseBody
	public String goHotelReservation(HttpServletResponse response, 
			HttpSession session,
			Reservation reservation, 
			int boNo, 
			int roomNo,
			int reservePrice,
			int reserveRoomCnt,
			int reserveTotalPersonCnt,
			int reservePersonAdultCnt,
			int reservePersonChildCnt,
			String checkInDateStr, 
			String checkOutDateStr){
		response.setContentType("application/json; charset=UTF-8"); 
		Member loginUser= (Member)session.getAttribute("loginUser");
		reservation.setMemberId(loginUser.getMemberId());
		
		java.sql.Date checkInDate= java.sql.Date.valueOf(checkInDateStr);
		java.sql.Date checkOutDate= java.sql.Date.valueOf(checkOutDateStr);
		
		reservation.setCheckInDate(checkInDate);
		reservation.setCheckOutDate(checkOutDate);
		
		
		//호텔예약테이블에 등록
		int result= hService.insertReservation(reservation);
		if(result>0)
			return "success";//예약성공
		return "fail";//예약실패
	}
	
	//2020.12.19 - 내가본 호텔 리모컨기능
	@RequestMapping("hotelCookies.ho")
	public void hotelCookies(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException{
		response.setContentType("application/json; charset=UTF-8");
	
		Hotel hotel= null;			//호텔 리스트
		Cookie[] cookieArr= request.getCookies();//쿠키배열을 구한다.
		
		if(cookieArr!=null) {
			
			
			for(Cookie cookie : cookieArr) {
				//쿠키이름 구하기
				String cookieName= cookie.getName();

				//쿠키이름이 hotelNo인지 확인
				if(cookieName.equals("hotelNo")) {
					//이때 쿠키값(cookie.getValue(), 리턴타입: 문자열)을 구하여 int로 바꾼다.
					//cookieValue값은 호텔번호이다.
					int cookieValue= Integer.parseInt(cookie.getValue());
					
					//cookieValue에 해당하는 호텔 썸네일 이미지와, 호텔이름을 구한다.
					hotel= hService.selectOnlyOneHotel(cookieValue);
					
					//호텔썸네일 이미지 1개 구한뒤에, bupload에 로드된 호텔이름(changeName)을 구한다.
					Attachment thumbnailImg= hService.selectOneHotelThumbnailImg(cookieValue);
					hotel.setHotelThumbnailImg(thumbnailImg.getChangeName());
				}
			}
		}
		Gson gson =new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(hotel, response.getWriter());
				
	}
	
	
	//only admin(관리자용)
	// 호텔 수정페이지뷰로 이동
	@RequestMapping("hotelEditView.ho")
	public ModelAndView goEditHotelView(@RequestParam("hId") int hId, ModelAndView mv){
		Hotel hotel= hService.selectOneHotel(hId); //호텔정보를 불러온다.
		LinkedHashSet<String> hashTags=null;
		String hotelLocalCallNum="";
		String hotelCallNumber="";
		
		if(hotel!=null) {
			//해시태그
			if(hotel.getBoTag()!=null) {
				hashTags=new LinkedHashSet<String>();
				String []hashTagArr= hotel.getBoTag().split(", ");
				for(String hashTag: hashTagArr) {
					hashTags.add(hashTag);
				}
			}
			
			//전화번호
			if(hotel.getHotelTel()!=null) {
				String[] hotelTelArr=hotel.getHotelTel().split("-");
				hotelLocalCallNum=hotelTelArr[0];
				hotelCallNumber=hotelTelArr[1]+"-"+hotelTelArr[2];
			}
		}
		
		ArrayList<Room> roomList=hService.selectRoomList(hId);
	
		
		mv.addObject("hotel", hotel)
		.addObject("hashTags", hashTags)
		.addObject("roomList", roomList)
		.addObject("hotelLocalCallNum", hotelLocalCallNum)
		.addObject("hotelCallNumber", hotelCallNumber)
		.setViewName("hotel_edit");
		return mv;
	}

// 은강><

}
