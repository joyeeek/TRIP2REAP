package trip.two.reap.travel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.travel.model.vo.Travel;

public interface TravelService {

	int getAllListCount();
	ArrayList<Travel> selectList(PageInfo pi, HashMap<String, Object> searchList);

	int insertTravel(Travel t);

	Travel selectTravel(int boNo);

	int insertFiles(Attachment a);

	int updateTravel(Travel t);

	int deleteTravel(int boNo);

	int deleteFile(int boNo);

	int updateFile(Attachment a);

	int updateBoard(Travel t);

	int getListCount(HashMap<String, Object> searchList);

	
	

	/*
	 * int insertOneThumImg(HashMap<String, Object> imgHashMap); //썸네일
	 */
	
	
}
