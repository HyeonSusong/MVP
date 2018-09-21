package net.mvp.admin.movie;

public class MovieSearchDTO {
	
	// http://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do/// 참조//
	private String key = "423d940b3ab18808f63dff1ba428ecdd"; /// 발급받은 키 
	private String curPage;
	private String itemPerPage;
	private String movieNm;
	private String directorNm;
	private String openStartDt;
	private String openEndDt;
	private String prdtStartYear;
	private String prdtEndYear;
	private String repNationCd;
	private String[] movieTypeCd;
	public String getKey() {
		return key;
	}
	public String getCurPage() {
		return curPage;
	}
	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}
	public String getItemPerPage() {
		return itemPerPage;
	}
	public void setItemPerPage(String itemPerPage) {
		this.itemPerPage = itemPerPage;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getDirectorNm() {
		return directorNm;
	}
	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}
	public String getOpenStartDt() {
		return openStartDt;
	}
	public void setOpenStartDt(String openStartDt) {
		this.openStartDt = openStartDt;
	}
	public String getOpenEndDt() {
		return openEndDt;
	}
	public void setOpenEndDt(String openEndDt) {
		this.openEndDt = openEndDt;
	}
	public String getPrdtStartYear() {
		return prdtStartYear;
	}
	public void setPrdtStartYear(String prdtStartYear) {
		this.prdtStartYear = prdtStartYear;
	}
	public String getPrdtEndYear() {
		return prdtEndYear;
	}
	public void setPrdtEndYear(String prdtEndYear) {
		this.prdtEndYear = prdtEndYear;
	}
	public String getRepNationCd() {
		return repNationCd;
	}
	public void setRepNationCd(String repNationCd) {
		this.repNationCd = repNationCd;
	}
	public String[] getMovieTypeCd() {
		return movieTypeCd;
	}
	public void setMovieTypeCd(String[] movieTypeCd) {
		this.movieTypeCd = movieTypeCd;
	}
	
	

}
