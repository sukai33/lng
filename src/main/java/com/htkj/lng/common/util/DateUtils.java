package com.htkj.lng.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 日期工具类


 * 
 * @author ChenLei
 */
public class DateUtils
{

    /**
     * <b>获取当前时间</b><br>
     * y 年 M 月 d 日 H 24小时制 h 12小时制 m 分 s 秒

    
     * 
     * @param format
     *            日期格式
     * @return String
     */
    public static String getCurrentDate(String format)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date());
    }

    /**
     * 获取制定日期的格式化字符串

    
     * 
     * @param date
     *            Date 日期
     * @param format
     *            String 格式
     * @return String
     */
    public static String getFormatedDate(Date date, String format)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 判断哪个日期在前 日过日期一在日期二之前，返回true,否则返回false
     * 
     * @param date1
     *            日期一
     * @param date2
     *            日期二

    
     * @return boolean
     */
    public static boolean isBefore(Date date1, Date date2)
    {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);

        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);

        if (c1.before(c2))
        {
            return true;
        }

        return false;
    }

    /**
     * 将字符串转换成日期

    
     * 
     * @param date
     *            String 日期字符串

    
     * @return Date
     * @throws ParseException
     */
    public static Date parseDateFromString(String date) throws ParseException
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.parse(date);
    }

    /**
     * 获取指定日期当月的最后一天

     * 
     * @param date 日期
     * @return 结果
     */
    public static Date lastDayOfMonth(Date date)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, 1);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.add(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    /**
     * 获取指定日期当月的第一天

     * 
     * @param date 日期
     * @return 结果
     */
    public static Date firstDayOfMonth(Date date)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        return cal.getTime();
    }

    /**
     * 是否是闰年

    
     * 
     * @param year
     *            年份
     * @return boolean
     */
    public static boolean isLeapYear(int year)
    {
        GregorianCalendar calendar = new GregorianCalendar();
        return calendar.isLeapYear(year);
    }

    /**
     * 获得指定日期的前一天

    
     * 
     * @param specifiedDay
     *            指定的日期

    
     * @return String
     * @throws Exception
     */
    public static String getSpecifiedDayBefore(String specifiedDay)
    {
        Calendar c = Calendar.getInstance();
        Date date = null;
        try
        {
            date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        c.setTime(date);
        int day = c.get(Calendar.DATE);
        c.set(Calendar.DATE, day - 1);

        String dayBefore = new SimpleDateFormat("yyyy-MM-dd")
                .format(c.getTime());
        return dayBefore;
    }

    /**
     * 获得指定日期的后一天

    
     * 
     * @param specifiedDay
     *            指定的日期

    
     * @return String
     */
    public static String getSpecifiedDayAfter(String specifiedDay)
    {
        Calendar c = Calendar.getInstance();
        Date date = null;
        try
        {
            date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        c.setTime(date);
        int day = c.get(Calendar.DATE);
        c.set(Calendar.DATE, day + 1);

        String dayAfter = new SimpleDateFormat("yyyy-MM-dd")
                .format(c.getTime());
        return dayAfter;
    }

    /**
     * 获取一天开始时间 如 2014-12-12 00:00:00
     * 
     * @return 结果
     */
    public static Date getDayStart()
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

    /**
     * 获取一天结束时间 如 2014-12-12 23:59:59
     * 
     * @return  结果
     */
    public static Date getDayEnd()
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        return calendar.getTime();
    }

    /**
     * 时间分段 比如：2014-12-12 10:00:00 ～ 2014-12-12 14:00:00 分成两段就是 2014-12-12 10：00：00 ～ 2014-12-12 12：00：00 和2014-12-12
     * 12：00：00 ～ 2014-12-12 14：00：00
     * 
     * @param start
     *            起始日期
     * @param end
     *            结束日期
     * @param pieces
     *            分成几段
     * @return  结果
     */
    public static Date[] getDatePieces(Date start, Date end, int pieces)
    {

        Long sl = start.getTime();
        Long el = end.getTime();

        Long diff = el - sl;

        Long segment = diff / pieces;

        Date[] dateArray = new Date[pieces + 1];

        for (int i = 1; i <= pieces + 1; i++)
        {
            dateArray[i - 1] = new Date(sl + (i - 1) * segment);
        }

        // 校正最后结束日期的误差，可能会出现偏差，比如14:00:00 ,会变成13:59:59之类的


        dateArray[pieces] = end;

        return dateArray;
    }

    /**
     * 毫秒转化天时分

     * @param ms 毫秒
     * @return 结果
     */
    public static String formatTime(Long ms)
    {
        Integer ss = 1000;
        Integer mi = ss * 60;
        Integer hh = mi * 60;
        Integer dd = hh * 24;

        Long day = ms / dd;
        Long hour = (ms - day * dd) / hh;
        Long minute = (ms - day * dd - hour * hh) / mi;
        Long second = (ms - day * dd - hour * hh - minute * mi) / ss;
        Long milliSecond = ms - day * dd - hour * hh - minute * mi
                - second * ss;

        StringBuffer sb = new StringBuffer();
        if (day > 0)
        {
            sb.append(day + "天");
        }
        if (hour > 0)
        {
            sb.append(hour + "小时");
        }
        if (minute > 0)
        {
            sb.append(minute + "分");
        }
        // if(second > 0) {
        // sb.append(second+"秒");
        // }
        // if(milliSecond > 0) {
        // sb.append(milliSecond+"毫秒");
        // }
        return sb.toString();
    }

    /**
     * 
     * @param args 参数
     * @throws ParseException 异常
     */
    public static void main(String[] args) throws ParseException
    {

        // SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //
        // Date start=sdf.parse("2014-12-12 12:00:00");
        // Date end=sdf.parse("2014-12-12 14:00:00");
        // System.out.println("开始时间"+sdf.format(start));
        // System.out.println("结束时间"+sdf.format(end));
        // System.out.println("分成"+10+"段");
        // Date[] dateArray=getDatePieces(start, end, 10);
        // for(int i=0;i<dateArray.length-1;i++){
        // System.out.println("第"+(i+1)+"段时间 ："+sdf.format(dateArray[i])+" ~
        // "+sdf.format(dateArray[i+1]));
        // }

        // System.out.println(getFormatedDate(new Date(),"yyyyMMddHHmmssSSS"));
        System.out.println(getCurrentDate("yyyy-MM-dd HH:mm:ss"));

    }
}
