package net.mvp.admin.movie;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Repository;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@Repository
public class MovieSearchAPI {

	private String key = "423d940b3ab18808f63dff1ba428ecdd"; /// 발급받은 키 
	private String curPage; 		//현재페이지
	private String itemPerPage;		//결과row수
	private String movieNm;			//영화명
	private String directorNm;		//감독명
	private String openStartDt;		//개봉연도 시작조건 ( YYYY )
	private String openEndDt;		//개봉연도 끝조건 ( YYYY )	
	private String prdtStartYear;	//제작연도 시작조건 ( YYYY )
	private String prdtEndYear;		//제작연도 끝조건    ( YYYY )
	private String repNationCd;		//대표국적코드 (공통코드서비스에서 '2204'로 조회된 국가코드)
	private String[] movieTypeCdArr;		//영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
	
	
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); // 서비스호출객체

	public HashMap<String,Object> MovieSearch(MovieSearchDTO dto) throws OpenAPIFault, Exception {
		curPage = dto.getCurPage()==null?"1":dto.getCurPage();				
		itemPerPage = dto.getItemPerPage()==null?"20":dto.getItemPerPage();		
		movieNm = dto.getMovieNm()==null?"":dto.getMovieNm();						
		directorNm = dto.getDirectorNm()==null?"":dto.getDirectorNm();			
		openStartDt = dto.getOpenStartDt()==null?"":dto.getOpenStartDt();			
		openEndDt = dto.getOpenEndDt()==null?"":dto.getOpenEndDt();				
		prdtStartYear = dto.getPrdtStartYear()==null?"":dto.getPrdtStartYear();	
		prdtEndYear = dto.getPrdtEndYear()==null?"":dto.getPrdtEndYear();			
		repNationCd = dto.getRepNationCd()==null?"":dto.getRepNationCd();			
		movieTypeCdArr = dto.getMovieTypeCd()==null ? new String[] {"220101"} : dto.getMovieTypeCd();	
		
		// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
		// Json 라이브러리를 통해 Handling\
		

	
		String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
		/*
		 //// 응답결과 형식 
		{"movieListResult":
			{"totCnt":66247,"source":"영화진흥위원회","movieList":[
				 	{"movieCd":"20181905","movieNm":"후드","movieNmEn":"Robin Hood ","prdtYear":"2018","openDt":"","typeNm":"장편","prdtStatNm":"개봉예정","nationAlt":"미국","genreAlt":"어드벤처","repNationNm":"미국","repGenreNm":"어드벤처","directors":[],"companys":[]}
					,{"movieCd":"20186321","movieNm":"퍼스트맨","movieNmEn":"First Man","prdtYear":"2018","openDt":"20181018","typeNm":"장편","prdtStatNm":"개봉예정","nationAlt":"미국","genreAlt":"SF,드라마","repNationNm":"미국","repGenreNm":"SF","directors":[{"peopleNm":"데이미언 셔젤"}],"companys":[]}
				 	,{"movieCd":"20181367","movieNm":"캡틴 스터비","movieNmEn":"Sgt. Stubby: An American Hero","prdtYear":"2018","openDt":"20181101","typeNm":"장편","prdtStatNm":"개봉예정","nationAlt":"미국,아일랜드,프랑스,캐나다,영국","genreAlt":"애니메이션,어드벤처,가족,전쟁","repNationNm":"미국","repGenreNm":"애니메이션","directors":[{"peopleNm":"리처드 라니"}],"companys":[]}
				 	,{"movieCd":"20182068","movieNm":"맛있는 세자매","movieNmEn":"","prdtYear":"2018","openDt":"","typeNm":"장편","prdtStatNm":"개봉예정","nationAlt":"한국","genreAlt":"기타","repNationNm":"한국","repGenreNm":"기타","directors":[],"companys":[]}
				 	,{"movieCd":"20181950","movieNm":"모든 것과 아무 것도 아닌 것","movieNmEn":"Everything and Nothing","prdtYear":"2017","openDt":"","typeNm":"단편","prdtStatNm":"기타","nationAlt":"영국","genreAlt":"기타","repNationNm":"영국","repGenreNm":"기타","directors":[],"companys":[]}
					]
			}
		}
		
	*/	
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,Object> result1 = mapper.readValue(movieCdResponse, HashMap.class);
		HashMap<String,Object> result2 = mapper.convertValue(result1.get("movieListResult"), HashMap.class);
		ArrayList<HashMap<String, Object>> lastresult = mapper.convertValue(result2.get("movieList"),new TypeReference<ArrayList<HashMap<String,Object>>>(){});
		for(int i=0; i<lastresult.size(); i++ ) {
			HashMap<String,Object> map = mapper.convertValue(lastresult.get(i), HashMap.class);
			System.out.println(map.get("movieNm"));
			String movieName = map.get("movieNm").toString();
			String openDt = map.get("openDt").toString();
			ArrayList<HashMap<String, Object>> directors= mapper.convertValue(map.get("directors"),new TypeReference<ArrayList<HashMap<String,Object>>>(){});
			String[] directorName = new String[directors.size()];
			for (HashMap<String, Object> objects : directors) {
				int j=0;
				directorName[j] = objects.get("peopleNm").toString();
				j++;
			}
			if((i+1)%10==0) {
			Thread.sleep(1000);
			}
			String na = OpenNaverApi(movieName,openDt,directorName);
			
		}
		return result1;
	}
	
	public HashMap<String,Object> MovieCodeSearch() throws OpenAPIFault, Exception {
		
		String movieCd = "2201";
		
		// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
		// Json 라이브러리를 통해 Handling

		String movieCdResponse = service.getComCodeList(true,movieCd);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,Object> result = mapper.readValue(movieCdResponse, HashMap.class);		
		return result;
	}

	public Map<String, Integer> SearchPageNum(String curPage){
		Map<String,Integer> pageNummap = new HashMap<String, Integer>();
		int pageIndex = 10;
		int firstPage ; 
		int lastPage ;
		int nowPage=Integer.parseInt(curPage);
		lastPage = (pageIndex+(nowPage-1)/pageIndex)*pageIndex;
		firstPage= lastPage-pageIndex+1;
		pageNummap.put("pageIndex", pageIndex);
		pageNummap.put("firstPage", firstPage);
		pageNummap.put("lastPage",lastPage);
		pageNummap.put("nowPage", nowPage);
		return pageNummap;
	}
	
	public String OpenNaverApi(String movieName, String openDt,String[] directorName) {
		String clientId = "zE4ogyqon6uPhV50yEx1";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "QQy6nVjclv";//애플리케이션 클라이언트 시크릿값";
        String result="";
        String year= openDt.substring(0, 5);
        System.out.println(year);
        String requesttext="";
        try {
        	requesttext = "query="+movieName+"&yearfrom="+year+"&yearto="+year;
            String text = URLEncoder.encode(movieName, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            result = response.toString();
        } catch (Exception e) {
        	result="";
            System.out.println(e);
        }
        
		String url ="";
		return url ;
	}

/*
		// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
		String nationCdResponse = service.getComCodeList(true,"2204");
		HashMap<String,Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
		request.setAttribute("nationCd",nationCd);

		String movieTypeCdResponse = service.getComCodeList(true,"2201");
		HashMap<String,Object> movieTypeCd = mapper.readValue(movieTypeCdResponse, HashMap.class);
		request.setAttribute("movieTypeCd",movieTypeCd);*/

	
}
