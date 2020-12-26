package trip.two.reap.travel.model.vo;

import trip.two.reap.common.PageInfo;

public class Pagination { 
	  public static PageInfo getPageInfo(int currentPage, int listCount) { 
		  PageInfo pi = null;

		  int pageLimit = 5; 
		  int maxPage; 
		  int startPage; 
		  int endPage; 
		  int boardLimit = 5;

		  maxPage = (int)Math.ceil((double)listCount/boardLimit); //math.ceil로 올림해도 double이 나오므로 int로 형변환
		  
		  startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		  
		  endPage = startPage + pageLimit - 1; 
		  	if(maxPage < endPage) { 
		  		endPage = maxPage; 
			 }
		  
		  pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		  
		  return pi; 
		  } 
	  }
