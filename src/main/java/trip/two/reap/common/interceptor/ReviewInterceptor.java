package trip.two.reap.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import trip.two.reap.member.model.vo.Member;

public class ReviewInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session= request.getSession();
		Member loginUser=(Member) session.getAttribute("loginUser");
		
		//로그인한 유저일때만 접근가능.
		if(loginUser==null) {
			request.setAttribute("msg", "로그인후에 이용해주세요!");
			request.getRequestDispatcher("WEB-INF/views/review/reviewList.jsp").forward(request, response);
			return false;
		}
				
		return super.preHandle(request, response, handler); //항상true를 반환
	}

}
