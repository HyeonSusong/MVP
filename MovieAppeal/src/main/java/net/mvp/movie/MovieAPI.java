package net.mvp.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Repository;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import net.mvp.admin.movie.MovieDateNow;
@Repository
public class MovieAPI {
	private String key = "423d940b3ab18808f63dff1ba428ecdd"; /// �߱޹��� Ű 
	private String movieCd ="" ;
	private String movieNmEn ="";
	private String openDt ="";
	private String genres ="";
	private String directors ="";
	private String actors ="";
	private String watchGrade ="";
	
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); // ����ȣ�ⰴü
	
	public MovieDTO MovieDetail(MovieDTO dto) throws OpenAPIFault, Exception{
		Map<String,Object> result = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		movieCd = Integer.toString(dto.getM_no());
		
		String movieCdResponse = service.getMovieInfo(true, movieCd);
		System.out.println(movieCdResponse);
		
		HashMap<String, HashMap<String,Object>> step1 = mapper.readValue(movieCdResponse, new TypeReference<HashMap<String, HashMap<String,Object>>>(){});
		HashMap<String,Object> step2 = mapper.convertValue(step1.get("movieInfoResult").get("movieInfo"), HashMap.class);
		///////movieDetail ����//////
		ArrayList<HashMap<String,String>> step3 = new ArrayList<HashMap<String,String>>();
		
		this.movieNmEn = step2.get("movieNmEn").toString();
		dto.setM_titleEn(movieNmEn);
		MovieDateNow mdatenow = new MovieDateNow();
		this.openDt = step2.get("openDt").toString();
		openDt = mdatenow.openday(openDt);
		System.out.println(openDt);
		dto.setOpenDt(openDt);
		
		step3 = mapper.convertValue(step2.get("audits"), new TypeReference<ArrayList<HashMap<String,String>>>(){});
		this.watchGrade = step3.get(0).get("watchGradeNm");	
		dto.setWatchGrade(watchGrade);
		//step3 = mapper.convertValue(step2.get(""), new TypeReference<ArrayList<HashMap<String,String>>>(){});
		
		step3 = mapper.convertValue(step2.get("genres"), new TypeReference<ArrayList<HashMap<String,String>>>(){});
		for(HashMap<String,String> map : step3) {
			String genre  = map.get("genreNm");
			this.genres = this.genres + genre+ "/";
		}
		dto.setGenres(genres);		
		step3 = mapper.convertValue(step2.get("directors"), new TypeReference<ArrayList<HashMap<String,String>>>(){});
		for(HashMap<String,String> map : step3) {
			String name = map.get("peopleNm");
			this.directors = this.directors + name + "/";
		}	
		dto.setDirectors(directors);
		step3 = mapper.convertValue(step2.get("actors"), new TypeReference<ArrayList<HashMap<String,String>>>(){});
		for(HashMap<String,String> map : step3) {
			String name = map.get("peopleNm");
			map.get("peopleNmEn");
			String cast = map.get("cast");
			String actor="";
			if(cast!=null && cast!="") {
				actor = name+"("+cast+")";
			}
			else {
				actor = name;
			}
			this.actors = this.actors+ actor + " / ";	
		}
		dto.setActors(actors);
				
		return dto;
	}
	
	
	public ArrayList<Map<String,String>> boxOffice() throws OpenAPIFault, Exception{
		String targetDt = new MovieDateNow().oneWeekAgo();
		String itemPerPage="10";
		String weekGb = "0";
		String multiMovieYn="";
		String repNationCd="";
		String wideAreaCd="";
		
		String movieCdResponse = service.getWeeklyBoxOffice(true, targetDt, itemPerPage, weekGb, multiMovieYn, repNationCd, wideAreaCd);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,HashMap<String,Object>> result1 = mapper.readValue(movieCdResponse, new TypeReference<HashMap<String,HashMap<String,Object>>>() {});
		System.out.println(result1);
		ArrayList<Map<String,String>> result = mapper.convertValue(result1.get("boxOfficeResult").get("weeklyBoxOfficeList"), new TypeReference<ArrayList<Map<String,String>>>() {});
		return result;
		
		/*{"rnum":"1",
		"rank":"1",  				// ���� rank
		"rankInten":"0", 		    // 	�������
		"rankOldAndNew":"OLD",		//  �ű����Կ���
		"movieCd":"20112207",		// ��ȭ�з���ȣ
		"movieNm":"�̼����ļ���:��Ʈ��������",	//��ȭ����
		"openDt":"2011-12-15",		//������
		"audiCnt":"353274",			//���ϰ�����
		"audiAcc":"5328435",		//����������
		}*/
	
	}

	

}
