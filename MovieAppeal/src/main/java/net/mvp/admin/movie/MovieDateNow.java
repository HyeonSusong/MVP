package net.mvp.admin.movie;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MovieDateNow {
	SimpleDateFormat sdf;
	Date day = new Date();
	public String nowyear() {
		sdf = new SimpleDateFormat("yyyy");
		String nowdate = sdf.format(day.getTime()).toString();
		return nowdate;		
	}
}
