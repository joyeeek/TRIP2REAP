package trip.two.reap.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import trip.two.reap.member.model.vo.Member;

public class HotelOnlyLoginEnterAcceptInterceptor extends HandlerInterceptorAdapter{

	//비회원은 들어가지 못하게 한다.
	//호텔관련 비회원접근제한: 호텔 예약페이지
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session =request.getSession();
		Member loginUser=(Member)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			request.setAttribute("msg", "호텔예약은 회원만 가능합니다! 로그인해주세요!");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
	
}
