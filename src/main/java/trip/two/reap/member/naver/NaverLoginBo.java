package trip.two.reap.member.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBo {
	
	// 인증 요청문을 구성하는 파라미터
	private final static String CLIENT_ID = ""; // 네이버 client id
	private final static String CLIENT_SECRET = ""; // 네이버 secret
	private final static String REDIRECT_URI = "http://localhost:13080/reap/naverLogin.me"; // 콜백 URI
	// private final static String SESSION_STATE = "oauth_state";
	
	// 프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";	
	
	// 네이버 아이디로 callback 처리 및 AccessToken 획득
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

		    // OAuth 라이브러리 : 다양한 소셜 로그인을 가능하게 한다.
            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginAPI.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
    }
	
	
	// Access Token을 이용하여 네이버 사용자 프로필 API 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginAPI.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
		return response.getBody();
	}

}
