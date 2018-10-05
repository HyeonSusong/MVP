package net.mvp.admin.movie;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MovieDateNow {
	SimpleDateFormat sdf;
	Date day = new Date();
	public String nowyear() {
		sdf = new SimpleDateFormat("yyyy");
		String nowdate = sdf.format(day.getTime()).toString();
		return nowdate;		
	}
	
	public String openday (String date) {
		sdf = new SimpleDateFormat("yyyy.MM.dd.");
		try {
			day = sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String opendate = sdf.format(day).toString();
		return opendate;
	}
	
	public String oneWeekAgo() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -7);
		sdf = new SimpleDateFormat("yyyyMMdd");
		String nowdate = sdf.format(calendar.getTime()).toString();
		return nowdate;
	}
}
