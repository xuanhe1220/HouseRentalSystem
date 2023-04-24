package com.house.personal.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    public static final String DATE_FORMAT = "yyyy-MM-dd";

    /**
     * 获取指定日期字符串所代表的日期对象
     *
     * @param dateString 日期字符串
     * @param format     日期格式
     * @return 日期对象
     */
    public static Date parseDate(String dateString, String format) {
        try {
            DateFormat dateFormat = new SimpleDateFormat(format);
            return dateFormat.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取指定日期所代表的日期字符串
     *
     * @param date   日期对象
     * @param format 日期格式
     * @return 日期字符串
     */
    public static String formatDate(Date date, String format) {
        DateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }

    /**
     * 获取指定日期字符串所代表的日期对象，日期格式为"yyyy-MM-dd"
     *
     * @param dateString 日期字符串
     * @return 日期对象
     */
    public static Date parseDate(String dateString) {
        return parseDate(dateString, DATE_FORMAT);
    }

    /**
     * 获取指定日期所代表的日期字符串，日期格式为"yyyy-MM-dd"
     *
     * @param date 日期对象
     * @return 日期字符串
     */
    public static String formatDate(Date date) {
        return formatDate(date, DATE_FORMAT);
    }

    /**
     * 获取当前日期对象
     *
     * @return 当前日期对象
     */
    public static Date getCurrentDate() {
        return new Date();
    }

    /**
     * 获取当前日期字符串，日期格式为"yyyy-MM-dd"
     *
     * @return 当前日期字符串
     */
    public static String getCurrentDateString() {
        return formatDate(getCurrentDate());
    }

    /**
     * 获取指定日期前i天的日期对象
     *
     * @param date 日期对象
     * @param i    天数
     * @return 日期对象
     */
    public static Date getDateBefore(Date date, int i) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - i);
        return calendar.getTime();
    }

    /**
     * 获取指定日期前i天的日期字符串，日期格式为"yyyy-MM-dd"
     *
     * @param date 日期对象
     * @param i    天数
     * @return 日期字符串
     */
    public static String getDateBeforeString(Date date, int i) {
        return formatDate(getDateBefore(date, i));
    }

}
