package trip.two.reap.member.kakao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoAPI {
	public String kakaoLogin(String code) {
		String access_token = "";
		
		final String RequestUrl = "https://kauth.kakao.com/oauth/token"; 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>(); // Post방식
        // 서버에 전달하는 데이터  Name, Value형식으로 구성 
        // HttpClient 컴포넌트는 클라언트에서 서버로 데이터를 전송하기위해 NameValuePair 인터페이스와 URIBuilder 클래스를 제공
        // NameValuePair 인터페이스는 POST방식에서 사용되며, URIBuilder 클래스는 GET 방식에 사용된다.
       
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); // 백엔드를 제공하는 경우에 authorization_code 인증 사용
        postParams.add(new BasicNameValuePair("client_id", "[REST API KEY]")); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:13080/reap/kakaoLogin.me")); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
 
        final HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
        final HttpPost post = new HttpPost(RequestUrl); // post method URL 생성
 
        JsonNode node = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams)); // json 메시지 입력
 
            final HttpResponse response = client.execute(post); // response 출력
            // final int responseCode = response.getStatusLine().getStatusCode();
 
           //  System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
           //  System.out.println("Post parameters : " + postParams);
           //  System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            node = mapper.readTree(response.getEntity().getContent());
            // System.out.println("node : " + node);
            
            // 토큰값
            access_token = node.get("access_token").toString();
            
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
	
		return access_token;
	}
	
	
	public static JsonNode getKakaoUserInfo(String accessToken) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // 클라이언트로의 응답 중 헤더부분에 내용 추가
        post.addHeader("Authorization", "Bearer " + accessToken);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            // final int responseCode = response.getStatusLine().getStatusCode(); 
            // System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            // System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }

        return returnNode;
	}
	
}
