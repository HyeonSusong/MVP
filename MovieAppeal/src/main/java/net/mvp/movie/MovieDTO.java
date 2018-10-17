package net.mvp.movie;

import java.util.HashMap;
import java.util.Map;

public class MovieDTO {

	/////// from DB data ///////////
	private int m_no;
	private String m_title;
	private String m_genre;
	private String m_plot;
	private int m_rating;
	private int m_likes;
	private int m_dislikes;
	private String m_imgurl;
	private String m_trailerurl;
	private int rn;
	
	///// from API data ///////////
	private String m_titleEn;
	private String openDt;
	private String genres;
	private String directors;
	private String actors;
	private String watchGrade;

	
	//////// 검색 쿼리문 관련 /////
	private int start;
	private int end;
	private final int pageperentity = 10;
	private String query;
	
	public Map<String, Integer> setPage(String curPage, int maxitem){
		System.out.println("curpage:"+curPage);
		curPage = curPage==null||curPage=="" ?"1":curPage;				
		Map<String,Integer> pageNummap = new HashMap<String, Integer>();
		int pageIndex = 10;
		int firstPage ; 
		int lastPage ;
		int nowPage=Integer.parseInt(curPage);
		int maxPage= maxitem%pageIndex == 0 ?maxitem/pageIndex : maxitem/pageIndex +1;
		lastPage = (1+(nowPage-1)/pageIndex)*pageIndex;
		firstPage= lastPage-pageIndex+1;
		if(lastPage>maxPage) {
			lastPage = maxPage;
		}
		this.start = nowPage*pageperentity-(pageperentity-1);
		this.end = nowPage*pageperentity > maxitem ? maxitem : nowPage*pageperentity ;
		pageNummap.put("pageIndex", pageIndex);
		pageNummap.put("firstPage", firstPage);
		pageNummap.put("lastPage",lastPage);
		pageNummap.put("nowPage", nowPage);
		pageNummap.put("maxPage", maxPage);
		return pageNummap;
	}
	
	
	
	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_plot() {
		return m_plot;
	}
	public void setM_plot(String m_plot) {
		this.m_plot = m_plot;
	}
	public int getM_rating() {
		return m_rating;
	}
	public void setM_rating(int m_rating) {
		this.m_rating = m_rating;
	}
	public int getM_likes() {
		return m_likes;
	}
	public void setM_likes(int m_likes) {
		this.m_likes = m_likes;
	}
	public String getM_imgurl() {
		return m_imgurl;
	}
	public void setM_imgurl(String m_imgurl) {
		this.m_imgurl = m_imgurl;
	}
	public String getM_trailerurl() {
		return m_trailerurl;
	}
	public void setM_trailerurl(String m_trailerurl) {
		this.m_trailerurl = m_trailerurl;
	}
	
	public String getM_titleEn() {
		return m_titleEn;
	}
	public void setM_titleEn(String m_titleEn) {
		this.m_titleEn = m_titleEn;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getGenres() {
		return genres;
	}
	public void setGenres(String genres) {
		this.genres = genres;
	}
	public String getDirectors() {
		return directors;
	}
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getWatchGrade() {
		return watchGrade;
	}
	public void setWatchGrade(String watchGrade) {
		this.watchGrade = watchGrade;
	}



	public int getM_dislikes() {
		return m_dislikes;
	}



	public void setM_dislikes(int m_dislikes) {
		this.m_dislikes = m_dislikes;
	}



	public String getQuery() {
		return query;
	}



	public void setQuery(String query) {
		this.query = query;
	}



	public int getRn() {
		return rn;
	}



	public void setRn(int rn) {
		this.rn = rn;
	}
}
