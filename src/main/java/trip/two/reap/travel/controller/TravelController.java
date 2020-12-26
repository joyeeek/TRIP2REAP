package trip.two.reap.travel.controller;


import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import trip.two.reap.common.Attachment;
import trip.two.reap.common.BoardException;
import trip.two.reap.common.PageInfo;
import trip.two.reap.travel.exception.TravelException;
import trip.two.reap.travel.model.service.TravelService;
import trip.two.reap.travel.model.vo.Pagination;
import trip.two.reap.travel.model.vo.Travel;

@SessionAttributes("loginUser")

@Controller
public class TravelController {  	
	
	@Autowired
	private TravelService tService;
	
	@RequestMapping("tList.tv")
	public ModelAndView goTravelList(@RequestParam(value="page", required=false) Integer page,
			HttpSession session, ModelAndView mv,@RequestParam(value="hashTag", required=false)String hashTag, 
			@RequestParam(value="reg", required=false)String reg, @RequestParam(value="tm", required=false)String tm, 
			@RequestParam(value="title", required=false)String title) throws TravelException{ //파라미터는 url을 get방식으로 가져옴, 
																	//page는 있을 수도 없을 수도 있는 변수임을 선언.  @RequestParam(value="addr", required=false) Integer addr, 
		/* @RequestParam(value="theme", required=false) Integer theme */
		HashMap<String, Object> searchList = new HashMap<String, Object>();

		String search = "all";
		
		  searchList.put("searchInput", "all"); 
		  searchList.put("searchLoc", "page");
		  searchList.put("reg", "all"); 
		  searchList.put("chkNo", "0");
		 

		
		
		if(title == null) {
			title = "all";
			searchList.put("title","all");
			
		} else {
			search = "title";
			searchList.put("searchInput", title);
			searchList.put("chkNo", 1);
			searchList.put("title", title);
		}
		

		
		if(hashTag == null) {
			hashTag = "all";
			searchList.put("hashTag", "all");

		} else {
			search = "hashTag";
			searchList.put("searchInput", hashTag);
			searchList.put("chkNo", 2);
			searchList.put("hashTag", hashTag);
	
		}
		if(reg == null) {
			reg = "all";
			searchList.put("reg", "all");
		} else {
			search = "reg";
			searchList.put("chkNo", 3);
			searchList.put("reg", reg);
		}
		if(tm == null) {
			tm = "all";
			searchList.put("tm", "all");
		} else {
			search = "tm";
			searchList.put("chkNo", 4);
			searchList.put("tm", tm);
		}
	
		searchList.put("search", search);
		
	   
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;	//현재 페이지에 page값을 집어넣음.
		}
		

		int listCount = tService.getListCount(searchList); //전체 게시글 갯수 가져오기.
		
		int travelListCount=0;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); // 페이징 관련 끝
		
		ArrayList<Integer> likeTravelList= new ArrayList<Integer>();
		
		ArrayList<Travel> list = tService.selectList(pi, searchList);
		
		for(int i=0; i<travelListCount; i++) {
			likeTravelList.add(0);
		}
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("likeTravelList", likeTravelList);
			mv.addObject("reg", reg);
			mv.addObject("tm", tm);
			mv.addObject("hashTag", hashTag);
			
			mv.addObject("pi", pi);
			mv.addObject("searchList", searchList);
			
			mv.setViewName("travelList");
			
		} else {
			throw new TravelException("여행지 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	} // 여행지 목록보기 이동.
	
	
		
	
	@RequestMapping("tDetail.tv")
	public ModelAndView goTravelDetail(@RequestParam("boNo") int boNo, @RequestParam("page") int page, ModelAndView mv) {
		
		
		Travel travel = tService.selectTravel(boNo);
		
		if(travel != null) {
			mv.addObject("travel", travel)
				.addObject("page", page)
				.setViewName("travelDetail");
		} else {
			throw new BoardException("여행지 상세보기에 실패하였습니다.");
		}
		
		
		return mv;
	} // 여행지 상세보기뷰 이동.
	


	
	   
	@RequestMapping("tInsert.tv")
	public String travelInsert(@ModelAttribute Travel t, @ModelAttribute Attachment a,
			@RequestParam("uploadFile1") MultipartFile uploadFile1,
										   @RequestParam("uploadFile2") MultipartFile uploadFile2,
										   @RequestParam("uploadFile3") MultipartFile uploadFile3,
			
								HttpSession session, HttpServletRequest request) throws Exception{
		
		
		
		
		MultipartFile[] multiFile = {uploadFile1,uploadFile2,uploadFile3};
		
		int result1 = tService.insertTravel(t);
		int result2 = 0;
		String renameFileName = "";
		
		if(uploadFile1 != null)
			for(int count=0; count<multiFile.length; count++) {
			
				a.setOriginName(multiFile[count].getOriginalFilename()); //원본 파일 명

				String renameFileName2 = saveFile(multiFile[count], request);
				
				if(renameFileName != null) {
					
					renameFileName += renameFileName2 + ",";
				}

				
				a.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\travel_uploadFiles");
				
				
			}
	
		a.setChangeName(renameFileName);
		result2 = tService.insertFiles(a);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:tList.tv";
		}else {
			throw new BoardException("여행지 등록에 실패하였습니다.");
		}
	}
	
	
		@RequestMapping("tInsertView.tv")
		public String goTravelInsert() {
			return "travelInsertView";
		} // 여행지 작성하기뷰 이동.
	


	  
	
	  public String saveFile(MultipartFile file, HttpServletRequest request) {
		  
	  String root = request.getSession().getServletContext().getRealPath("resources"); 
	  
	  String savePath = root + "\\travelFiles";{
		  File folder = new File(savePath); 
		  if(!folder.exists()){  //파일이 존재하지 않는다면
			  folder.mkdirs(); 	//만들어줌
			}
	  
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	  
	  String originName = file.getOriginalFilename(); 
	  String changeName =  "travel"+sdf.format(new Date(System.currentTimeMillis())) + originName;
	  
	  
	  String renamePath = folder + "\\" + changeName;
	  try { 
		  file.transferTo(new File(renamePath)); 
	} catch (Exception e) {
		e.printStackTrace(); }
	  
	  
	  
	  
	  return changeName; 
	  } 
	 }
	 
	  

			
	
	@RequestMapping("tUpview.tv")
	public ModelAndView goTravelUpview(@RequestParam("boNo") int boNo, @RequestParam("page") int page, ModelAndView mv) {
		
			Travel travel = tService.selectTravel(boNo);
		  
		  mv.addObject("travel", travel)
		  	.addObject("page", page)
		  	.setViewName("travelUpdateView");
		  
		  
		  return mv;
	} // 여행지 수정하기 이동
	  
	
	
	//파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath=root;
		
		File file = null;
		
		savePath= root+"\\travelFiles";
		
		file= new File(savePath + "\\" + fileName);
		
		
		if(file!=null && file.exists()) {
			file.delete();
		}
		
		;
		
	}
	  
	
	
	@RequestMapping("tUpdate.tv")
	public ModelAndView goTravelUpdate(@ModelAttribute Travel t, @ModelAttribute Attachment a, @RequestParam("page") int page, 
							@RequestParam("reloadFile") MultipartFile reloadFile, ModelAndView mv, HttpServletRequest request){
				
		
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(a.getChangeName() != null) {
				deleteFile(a.getChangeName(), request);
			}
			
			String changeName = saveFile(reloadFile, request);
			
			if(changeName != null) {
				a.setOriginName(reloadFile.getOriginalFilename());
				a.setChangeName(changeName);
			}
		}	
			int result = tService.updateTravel(t);
			int result2 = tService.updateFile(a);
			int result3 = tService.updateBoard(t);
			
		
		  if(result >  0 || result2 > 0 || result3 > 0) {
			  mv.addObject("page", page).setViewName("redirect:tDetail.tv?boNo=" + t.getBoNo());
		  } else {
			  throw new BoardException("여행지 수정에 실패하였습니다.");
		  }
		
		return mv;
	}
	
	 @RequestMapping("tDelete.tv")
	 public String goTravelDelete(@RequestParam("boNo") int boNo, @ModelAttribute Attachment a, HttpServletRequest request) {
		 
		 Travel t = tService.selectTravel(boNo);
		 
		 if(a.getOriginName() != null) {
			 deleteFile(a.getChangeName(), request);
		 }
		 
		 int result = tService.deleteTravel(boNo);
		 int result2 = tService.deleteFile(boNo);
		 if(result > 0 || result2 > 0) {
			 return "redirect:tList.tv";
		 } else {
			 throw new BoardException("여행지 삭제에 실패하였습니다.");
		 }
		 
		 
	  }//여행지 삭제하기
	
	
	@RequestMapping("tSearchError.tv")
	public String goTravelError() {
		return "search_errorPage";
	} // 검색 에러페이지 이동
	
}