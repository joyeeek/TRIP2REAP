package trip.two.reap.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.review.model.service.ReviewService;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Controller // bean에 추가 (객체로 만듦)
public class ReviewController {

	@Autowired
	private ReviewService rService;

	// 리뷰 목록으로 이동
	@RequestMapping("reviewList.bo")
	public ModelAndView reviewList(@RequestParam(value = "page", required = false) Integer page, 
			HttpSession session,ModelAndView mv, String hashTag, String title, String content, 
			String writer, String cate) throws ReviewException{
		
		
		HashMap<String, Object> searchList = new HashMap<String, Object>();
			
		String search = "all";
		searchList.put("searchInput", "all");
		searchList.put("searchLoc", "page");
		
		searchList.put("cate", "all");
		searchList.put("chkNo", 0);

		if(writer == null) {
			writer = "all";
			searchList.put("writer", "all");
		} else {
			search = "writer";
			searchList.put("searchInput", writer);
			searchList.put("chkNo", 1);
			searchList.put("writer", writer);
		}
		
		if(title == null) {
			title = "all";
			searchList.put("title", "all");

		} else {
			search = "title";
			searchList.put("searchInput", title);
			searchList.put("chkNo", 2);
			searchList.put("title", title);
		}

		if(hashTag == null) {
			hashTag = "all";
			searchList.put("hashTag", "all");

		} else {
			hashTag = "#" + hashTag;
			search = "hashTag";
			searchList.put("searchInput", hashTag);
			searchList.put("chkNo", 3);
			searchList.put("hashTag", hashTag);
	
		}
		if(cate == null) {
			cate = "all";
		} else {
			searchList.put("cate", cate);
			searchList.put("chkNo", 4);
		}

		
		searchList.put("search", search);
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
			
		int listCount = rService.getListCount(searchList);
		
		int reviewListCount=0;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Review> list = rService.selectList(pi, searchList);
		
		ArrayList<Integer> likeReviewList= new ArrayList<Integer>();
		
		for(int i=0; i<reviewListCount; i++) {
			likeReviewList.add(0);
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("likeReviewList", likeReviewList);

			mv.addObject("pi", pi);
			mv.addObject("searchList", searchList);
			
			mv.setViewName("reviewList");
		} else {
			throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
		}
		return mv;
	}

	@RequestMapping("reviewPhotoList.bo")
	public ModelAndView reviewPhotoList(@RequestParam(value = "page", required = false) Integer page,
			HttpSession session, ModelAndView mv, String hashTag, String title, String content, 
			String writer , String cate) throws ReviewException{
		HashMap<String, Object> searchList = new HashMap<String, Object>();

		String search = "all";
		searchList.put("searchInput", "all");
		searchList.put("searchLoc", "page");
		searchList.put("writer", "all");
		searchList.put("title", "all");
		searchList.put("hashTag", "all");
		searchList.put("cate", "all");
		searchList.put("chkNo", 0);

		if(writer == null) {
			writer = "all";
		} else {
			search = "writer";
			searchList.put("searchInput", writer);
			searchList.put("chkNo", 1);
			searchList.put("writer", writer);

		}
		
		if(title == null) {
			title = "all";
		} else {
			search = "title";
			searchList.put("searchInput", title);
			searchList.put("chkNo", 2);
			searchList.put("title", title);

		}
	
		
		if(hashTag == null) {
			hashTag = "all";
		} else {
			hashTag = "#" + hashTag;
			search = "hashTag";
			searchList.put("searchInput", hashTag);
			searchList.put("chkNo", 3);
			searchList.put("hashTag", hashTag);

	
		}
		if(cate == null) {
			cate = "all";
		} else {
			searchList.put("cate", cate);
			searchList.put("chkNo", 4);
		}
		

		searchList.put("search", search);
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = rService.getListCount(searchList);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Review> list = rService.selectList(pi, searchList);
	
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("searchList", searchList);
			mv.addObject("pi", pi);
			mv.setViewName("reviewPhotoList");
		} else {
			throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
		}
		return mv;
	}

	// 리뷰 상세보기로 이동

	@RequestMapping("reviewDetail.bo")
	public ModelAndView boardDetail(@RequestParam("boNo") int boNo, Review r,
									@RequestParam("page") int page, ModelAndView mv,
									HttpSession session) throws ReviewException{

		Member loginUser = (Member) session.getAttribute("loginUser");
		if(loginUser!=null) { //로그인한 계정이라면
			r.setLoginUserId(loginUser.getMemberId());
		}
		
		Review review = rService.selectReview(r);
		ArrayList<Reply> reply = rService.selectReply(boNo);
		int reviewListCount=0;
		
		ArrayList<Attachment> detailList = rService.selectDetailList(boNo);
		
		ArrayList<Integer> likeReviewList= new ArrayList<Integer>();
		
		for(int i=0; i<reviewListCount; i++) {
			likeReviewList.add(0);
		}

		
		int likeCnt=0;
		likeCnt= rService.countReviewLike(boNo);

		if (review != null) {
			mv.addObject("review", review)
			.addObject("page", page)
			.addObject("detailList", detailList)
			.addObject("likeCnt", likeCnt)
			.setViewName("reviewDetail");
			
			/*
			mv.addObject("review", review)
			.addObject("page", page)
			.setViewName("reviewDetail");
			*/
//			mv.addObject("reply", reply).addObject("page", page).setViewName("reviewDetail");
		
		} else {
			throw new ReviewException("게시글 상세보기에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("reviewInsert.bo")
	public String reviewInsertView() {

		
		return "reviewInsert";

	}

	@RequestMapping("rInsert.bo")
	public String reviewInsert(@ModelAttribute Review r,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile,
			@RequestParam(value = "detailFile", required = false) ArrayList<MultipartFile> detailFile,
			HttpServletRequest request) {
		int result;
		// 파일을 집어넣지 않으면 empty값이 반환. 파일을 넣으면 파일이름이 반환됨.

		// if(!uploadFile.getOriginalFilename().equals("")) {
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String changeName = saveFile(uploadFile, request);
			// saveFile() : 파일을 저장할 경로 지정

			if (changeName != null) {
				r.setOriginName(uploadFile.getOriginalFilename());
				r.setChangeName(changeName);

			}
			result = rService.insertReview(r);
		} else {
			result = rService.insertBoard(r);
			return "redirect:reviewList.bo";
		}

		if (result > 0) {
//			return "redirect:reviewList.bo";
			int result2;
			String detailChangeName;
			//디테일뷰 이미지지를 등록한다
			if(detailFile!=null && !detailFile.isEmpty()) {
				for(MultipartFile file : detailFile) {
					detailChangeName= saveFile(file, request);
					
					if(detailChangeName!=null) {
						Attachment oneDetailImg= new Attachment();
						oneDetailImg.setOriginName(file.getOriginalFilename());
						oneDetailImg.setChangeName(detailChangeName);
						oneDetailImg.setFileLevel(2);
						//데이터베이스 IMG_FILE테이블에 디테일이미지 한개씩 등록한다.
						result2= rService.insertDetailView(oneDetailImg);
						if(result2==0) {
							//등록실패
							throw new ReviewException("디테일 이미지 등록에 실패하였습니다.");
						}
					}
				}
				
			}
			return "redirect:reviewList.bo"; //성공하면 리뷰리스트로 이동.
		} else {
			throw new ReviewException("게시글 등록에 실패했습니다.");
		}
	}

	@RequestMapping("download.do")
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// saveFile() : 파일을 저장할 경로 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String originFileName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + changeName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}

	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply re, HttpSession session){
		Member loginUser = (Member) session.getAttribute("loginUser");
		String rWriter = Optional.ofNullable(loginUser).orElse(new Member()).getMemberId();

		re.setMemberId(rWriter);

		int result = rService.addReply(re);
		if (rWriter != null && result > 0) {
			
				return "success";
		
		} else {
			return "error";
		}
	}

	@RequestMapping("rList.bo")
	public void getReplyList(int boNo, HttpServletResponse response) throws JsonIOException, IOException {
		// int bId : requestParam 생략

		ArrayList<Reply> list = rService.selectReply(boNo);
		response.setContentType("application/json; charset=UTF-8");

		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(list, response.getWriter());

	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";

		File f = new File(savePath + "\\" + fileName);

		if (f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("rdelete.bo")
	public String deleteReview(@ModelAttribute Review r, @RequestParam("boNo") int boNo, HttpServletRequest request) {

		Review tmpR = rService.selectReview(r);
		

		if (tmpR.getOriginName() != null) {
			deleteFile(tmpR.getChangeName(), request);
		}

		int result = rService.deleteReview(boNo);
		
		if (result > 0) {
			return "redirect:reviewList.bo";
		} else {
			throw new ReviewException("게시물 삭제에 실패하였습니다.");
		}
	}

	@RequestMapping("rupView.bo")
	public ModelAndView boardUpdateView(@ModelAttribute Review r, @RequestParam("page") int page,
			ModelAndView mv) {
		Review review = rService.selectReview(r);
		ArrayList<Attachment> detailList = rService.selectDetailList(r.getBoNo());
		
		mv.addObject("review", review).addObject("page", page).setViewName("reviewUpdate");
		mv.addObject("detailList", detailList);

		return mv;
	}

	@RequestMapping("rupdate.bo")
	public ModelAndView reviewUpdate(@ModelAttribute Review r, 
			@RequestParam("page") int page,	
			@RequestParam(value = "reloadFile") MultipartFile reloadFile,
			@RequestParam(value = "detailFile", required = false) ArrayList<MultipartFile> detailFile,
			HttpServletRequest request, ModelAndView mv) {

		String changeName = saveFile(reloadFile, request);


		if (reloadFile != null && !reloadFile.isEmpty()) {
			if (r.getChangeName() != null) {
				deleteFile(r.getChangeName(), request);
			}

			if (changeName != null) {
				r.setOriginName(reloadFile.getOriginalFilename());
				r.setChangeName(changeName);
			}
		}

		int result = rService.updateReview(r);
		int result2 = rService.updateReviewPhoto(r);

		if (result > 0 || result2 > 0) {
			mv.addObject("page", page).setViewName("redirect:reviewDetail.bo?boNo=" + r.getBoNo());
		} else {
			throw new ReviewException("게시글 수정에 실패하였습니다.");
		}

		return mv;
	}
	
	@RequestMapping("deleteReply.bo")
	@ResponseBody
	public String deleteReply(Reply re,HttpServletRequest request,
			 HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		String rWriter = loginUser.getMemberId();

		re.getMemberId();
		int result = rService.deleteReply(re);
		
		if ( result > 0) {
			return "success";
		} else {
			throw new ReviewException("댓글 삭제에 실패하였습니다.");
		}
	}
	//2020.11.27
		@RequestMapping("updateLikeReview.bo")
		@ResponseBody
		public int updateLikeReview(HttpSession session, int boNo, HttpServletResponse response) throws ReviewException {
			//좋아요 반영
			HashMap<String, Object> map= new HashMap<String, Object>();
			Member loginUser= (Member) session.getAttribute("loginUser");
			map.put("loginUserId", loginUser.getMemberId());
			map.put("boNo", boNo);


			// 좋아요를 처음 누르는가?
			// 좋아요를 전에 눌렀지만, LIKE_YN='N'으로 되어있는가?
			int isAlreadySmashedBtn= rService.isCanceledLikeBtn(map);
			int result=0;
			if(isAlreadySmashedBtn>0) {
				// LIKE_YN='Y'로 반영한다.
				result=rService.updateLikeReview(map);
			}else {
				//처음으로 좋아요를 눌렀음 => like테이블에 추가
				result=rService.insertLikeReview(map);
			}

			if(result==0) {
				throw new ReviewException("좋아요 반영에 실패하였습니다.");
			}

			int likeCnt = rService.countReviewLike(boNo);
			
			return likeCnt;
		}
	
		@RequestMapping("updateCancelLikeReview.bo")
		@ResponseBody
		public int updateCancelLikeReview(HttpSession session, int boNo, HttpServletResponse response) throws ReviewException {
			//좋아요 해제 반영
			HashMap<String, Object> map= new HashMap<String, Object>();
			Member loginUser= (Member) session.getAttribute("loginUser");
			map.put("loginUserId", loginUser.getMemberId());
			map.put("boNo", boNo);

			//이미 좋아요를 눌렀는데, LIKE_YN='Y'로 되어있는가?
			int isAlreadySmashedBtn=rService.isSmashedLikeBtn(map);
			int result=0;
			if(isAlreadySmashedBtn > 0) {
				//이미 눌려져있다면 update하여 해제한다.
				result=rService.cancelLikeReview(map);
				if(result==0) {
					throw new ReviewException("좋아요 해제 반영을 실패하였습니다!");
				}
			}
			
			int likeCnt = rService.countReviewLike(boNo);
			
			return likeCnt;
		}


		@RequestMapping("uploadFile.bo")
		public void uploadFile(@ModelAttribute Review r,
				@RequestParam(value = "reloadFile") MultipartFile uploadFile,
				HttpServletRequest request) {
			int result;

			// if(!uploadFile.getOriginalFilename().equals("")) {
			if (uploadFile != null && !uploadFile.isEmpty()) {
				String changeName = saveFile(uploadFile, request);
				Attachment oneDetailImg= new Attachment();
				oneDetailImg.setOriginName(uploadFile.getOriginalFilename());
				oneDetailImg.setChangeName(changeName);
				oneDetailImg.setFileLevel(2);
				//데이터베이스 IMG_FILE테이블에 디테일이미지 한개씩 등록한다.
				result= rService.insertDetailView(oneDetailImg);
				if(result==0) {
					//등록실패
					throw new ReviewException("디테일 이미지 등록에 실패하였습니다.");
				}
			} else {
			}
		}
		
		
}


