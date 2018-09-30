package net.mvp.movie;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbMovieAdd(MovieDTO dto) throws Exception {
		temp.insert("movie.add",dto);
	}
	
	public int dbMovieCount(MovieDTO dto) {
		int cnt = temp.selectOne("movie.count",dto.getM_no());
		return cnt;
	}
	
	public MovieDTO dbMovieSelet(MovieDTO dto) {
		MovieDTO mdto = temp.selectOne("movie.detail",dto);
		return mdto;
	}
	
	public List<MovieDTO> dbAdminMovieList(MovieDTO dto){
		List<MovieDTO> movieList = temp.selectList("movie.list",dto);
		return movieList;
	}
	
	public int MovieAllCount(MovieDTO dto) {
		int cnt = temp.selectOne("movie.countAll",dto);
		return cnt;
	}
	public void dbMovieEdit(MovieDTO dto) {
		temp.update("movie.edit",dto);
	}
	public void dbMovieDelete(MovieDTO dto) {
		temp.delete("movie.delete",dto.getM_no());
	}
}
