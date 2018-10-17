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
		System.out.println(date);
		String Year = date.substring(0,4);
		String Month = date.substring(4,6);
		String day = date.substring(6,8);
		String opendate = Year+"."+Month+"."+day;
		System.out.println(opendate);
		return opendate;
	}
	
	public String oneWeekAgo() {
		int toyoil = 0;
		Calendar cal = Calendar.getInstance();
		toyoil = cal.get(cal.DAY_OF_WEEK);
		if(toyoil == 1) {
			toyoil=7;
		}
		else {
			toyoil=toyoil-1;
		}
		cal.add(Calendar.DAY_OF_MONTH, -toyoil);
		sdf = new SimpleDateFormat("yyyyMMdd");
		String nowdate = sdf.format(cal.getTime()).toString();
		return nowdate;
	}
	public String week() {
		int toyear = 0;
		int tomonth = 0;
		int toweek =0;
		int toyoil = 0;
		Calendar cal = Calendar.getInstance();
		toyoil = cal.get(cal.DAY_OF_WEEK);
		if(toyoil == 1) {
			toyoil=7;
		}
		else {
			toyoil=toyoil-1;
		}
		cal.add(Calendar.DAY_OF_MONTH, -toyoil);
		
		toyear = cal.get(cal.YEAR);
		tomonth = cal.get(cal.MONTH);
		toweek = cal.get(cal.WEEK_OF_MONTH);
		String week = toyear+"년 "+(tomonth+1)+"월 "+toweek+"주차";
		return week;
	}
}
