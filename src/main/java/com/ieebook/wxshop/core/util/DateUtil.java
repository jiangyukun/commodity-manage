package com.ieebook.wxshop.core.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class DateUtil {
    /**
     * 最小有效日期
     */
    public static final Timestamp MIN_VALUE = new Timestamp(0L);
    /**
     * 最大有效日期
     */
    public static final Timestamp MAX_VALUE = DateUtil.addYears(DateUtil.MIN_VALUE, 100);

    /**
     * 数据库保存的最小有效日期
     */
    public static final Timestamp MIN_DB_VALUE = DateUtil.from(2000, 1, 1);

    /**
     * 当前的时间戳
     */
    public static Timestamp getNow() {
        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * 当前的天
     */
    public static Timestamp getToday() {
        Calendar cal = Calendar.getInstance();
        cal.clear(Calendar.AM_PM);
        cal.clear(Calendar.HOUR);
        cal.clear(Calendar.HOUR_OF_DAY);
        cal.clear(Calendar.MINUTE);
        cal.clear(Calendar.SECOND);
        cal.clear(Calendar.MILLISECOND);
        return new Timestamp(cal.getTime().getTime());
    }

    /**
     * 攻取指定日期的日期部份
     *
     * @param date
     * @return
     */
    public static Timestamp getDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.clear(Calendar.AM_PM);
        cal.clear(Calendar.HOUR);
        cal.clear(Calendar.HOUR_OF_DAY);
        cal.clear(Calendar.MINUTE);
        cal.clear(Calendar.SECOND);
        cal.clear(Calendar.MILLISECOND);
        return new Timestamp(cal.getTime().getTime());
    }

    /**
     * 日期转为Timestamp
     *
     * @param date
     * @return
     */
    public static Timestamp toTimestamp(Date date) {
        if (date == null) return null;
        return new Timestamp(date.getTime());
    }

    /**
     * 从年月日转换
     *
     * @param year
     * @param month
     * @param day
     * @return
     */
    public static Timestamp from(int year, int month, int day) {
        Calendar cal = Calendar.getInstance();
        cal.clear(Calendar.AM_PM);
        cal.clear(Calendar.HOUR);
        cal.clear(Calendar.HOUR_OF_DAY);
        cal.clear(Calendar.MINUTE);
        cal.clear(Calendar.SECOND);
        cal.clear(Calendar.MILLISECOND);
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DATE, day);
        return new Timestamp(cal.getTime().getTime());
    }

    /**
     * 字串转为日期
     *
     * @param dateStr
     * @return
     */
    public static Timestamp fromString(String dateStr) {
        return fromString(dateStr, null);
    }

    /**
     * 字串转为日期
     *
     * @param dateStr
     * @param pattern
     * @return
     */
    public static Timestamp fromString(String dateStr, String pattern) {
        return fromString(dateStr, pattern, null);
    }

    /**
     * 字串转为日期
     *
     * @param dateStr
     * @param pattern
     * @param locale
     * @return
     */
    public static Timestamp fromString(String dateStr, String pattern, Locale locale) {
        if ((pattern == null) || ("".equals(pattern))) {
            pattern = "yyyy-MM-dd";
        }
        SimpleDateFormat format;
        if (locale != null)
            format = new SimpleDateFormat(pattern, locale);
        else
            format = new SimpleDateFormat(pattern);
        Date date = null;
        try {
            date = format.parse(dateStr);
        } catch (ParseException e) {
            date = null;
        }
        return DateUtil.toTimestamp(date);
    }

    /**
     * 日期转为字串
     *
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
        DateFormat df = new SimpleDateFormat(pattern);
        String s = df.format(date);
        return s;
    }

    /**
     * 日期转字串
     *
     * @param date
     * @return
     */
    public static String formatDateTime(Date date) {
        return format(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 日期转字串
     *
     * @param date
     * @return
     */
    public static String formatDate(Date date) {
        return format(date, "yyyy-MM-dd");
    }

    /**
     * 在指定的日期上增加N秒并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addSeconds(Date date, int seconds) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.SECOND, seconds);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 在指定的日期上增加N分钟并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addMinutes(Date date, int minutes) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MINUTE, minutes);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 在指定的日期上增加N小时并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addHours(Date date, int hours) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR_OF_DAY, hours);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 在指定的日期上增加N天并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addDays(Date date, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, days);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 在指定的日期上增加N月并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addMonths(Date date, int months) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, months);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 在指定的日期上增加N年并返回
     *
     * @param date
     * @param seconds
     * @return
     */
    public static Timestamp addYears(Date date, int years) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, years);
        return DateUtil.toTimestamp(calendar.getTime());
    }

    /**
     * 获取指定日期中的年
     *
     * @param date
     * @return
     */
    public static Integer getYear(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.YEAR);
    }

    /**
     * 获取指定日期中的年
     *
     * @param date
     * @return
     */
    public static Integer getMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH);
    }

    /**
     * 获取指定日期中的年
     *
     * @param date
     * @return
     */
    public static Integer getDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.DAY_OF_MONTH);
    }

    /**
     * 获取指定日期中的小时
     *
     * @param date
     * @return
     */
    public static Integer getHour(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.HOUR_OF_DAY);
    }

    /**
     * 返回两个日期时间差 ms  B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static long distance(Date first, Date second) {
        return second.getTime() - first.getTime();
    }

    /**
     * 时间差s B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static long distanceSec(Date first, Date second) {
        Long sec = Long.valueOf((second.getTime() - first.getTime()) / 1000L);
        return sec;
    }

    /**
     * 返回时间差m B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static int distanceMin(Date first, Date second) {
        Long min = distanceSec(first, second) / 60;
        return min.intValue();
    }

    /**
     * 返回时间差h B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static int distanceHour(Date first, Date second) {
        return distanceMin(first, second) / 60;
    }

    /**
     * 返回时间差d B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static int distanceDay(Date first, Date second) {
        return distanceHour(first, second) / 24;
    }

    /**
     * 返回时间差d B > A 正数 否则负数
     *
     * @param first
     * @param second
     * @return
     */
    public static int distanceMonth(Date first, Date second) {
        return getMonths(first, second);
    }

    /**
     * 返回日期是一年中第N天
     *
     * @param date
     * @return
     */
    public static int getDayOfYesr(Date date) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date);
        return c1.get(Calendar.DAY_OF_YEAR);
    }

    /**
     * 获取指定日期是星期几
     *
     * @param date
     * @return
     */
    public static int getDayOfWeek(Date date) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date);
        return c1.get(Calendar.DAY_OF_WEEK);
    }

    /**
     * 获取指定日期的月份的最后一天的值
     *
     * @param date
     * @return
     */
    public static int getLastDayOfMonth(Date date) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date);
        return c1.getActualMaximum(Calendar.DAY_OF_MONTH);
    }

    /**
     * 返回星期几字串
     *
     * @param date
     * @return
     */
    public static String getDayOfWeekStr(Date date) {
        int d = getDayOfWeek(new Date());
        String msg = null;
        switch (d) {
            case 1:
                msg = "星期天";
                break;
            case 2:
                msg = "星期一";
                break;
            case 3:
                msg = "星期二";
                break;
            case 4:
                msg = "星期三";
                break;
            case 5:
                msg = "星期四";
                break;
            case 6:
                msg = "星期五";
                break;
            case 7:
                msg = "星期六";
                break;
        }

        return msg;
    }

    /**
     * 获取日期列表
     *
     * @return
     */
    public static List<String> getDateList() {
        Calendar cal = Calendar.getInstance();
        int yyyy = cal.get(Calendar.YEAR);
        List<String> dateList = new ArrayList<String>();
        for (int i = 5; i > 0; i--) {
            String date = String.valueOf(yyyy - i);
            dateList.add(date);
        }

        for (int i = 0; i < 6; i++) {
            String date = String.valueOf(yyyy + i);
            dateList.add(date);
        }
        return dateList;
    }

    /**
     * 获取小时列表(小时 例如:01:00)
     *
     * @return
     */
    public static List<String> getDateList4Hour() {
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < 24; i++) {
            list.add(String.format("%s%s:00", i < 10 ? "0" : "", i));
        }
        return list;
    }

    /**
     * 获取小时列表(小时 例如:01)
     *
     * @return
     */
    public static List<String> getDateList4HourOnly() {
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < 24; i++) {
            list.add(String.format("%s%s", i < 10 ? "0" : "", i));
        }
        return list;
    }

    /**
     * 获取分钟列表(分钟 例如:01)
     *
     * @return
     */
    public static List<String> getDateList4MinuteOnly() {
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < 60; i++) {
            list.add(String.format("%s%s", i < 10 ? "0" : "", i));
        }
        return list;
    }

    /**
     * 返回描述时间
     *
     * @param compDate
     * @return
     */
    public static String getTimeInterval(Date compDate) {
        long curTime = new Date().getTime();
        long compTime = compDate.getTime();
        double diffTime = (curTime - compTime) / 1000.0D;
        if (diffTime >= 0.0D) {
            if (diffTime / 2592000.0D > 1.0D)
                return "1月前";
            if (diffTime / 604800.0D > 1.0D)
                return "7天前";
            if ((diffTime / 604800.0D <= 1.0D) && (diffTime / 86400.0D >= 1.0D))
                return (int) diffTime / 86400 + "天前";
            if ((diffTime / 86400.0D < 1.0D) && (diffTime / 3600.0D >= 1.0D))
                return (int) diffTime / 3600 + "小时前";
            if ((diffTime < 3600.0D) && (diffTime >= 60.0D)) {
                return (int) diffTime / 60 + "分钟前";
            }
            return "当前";
        }
        return "当前";
    }

    /**
     * 获取时间段
     *
     * @return
     */
    public static String getTimeDivision() {
        Calendar cal = Calendar.getInstance();
        int hour = cal.get(Calendar.HOUR_OF_DAY);
        if (hour >= 0 && hour <= 7) {
            return "早上";
        } else if (hour >= 8 && hour <= 11) {
            return "上午";
        } else if (hour >= 12 && hour <= 17) {
            return "下午";
        } else return "晚上";
    }

    /**
     * 获取两从此时间差
     *
     * @param date1
     * @param date2
     * @return
     */
    public static String getOddTime(Date date1, Date date2) {
        StringBuilder result = new StringBuilder();
        int min = distanceMin(date1, date2);
        int hour = min / 60;
        int day = hour / 24;
        if (day > 0)
            result.append(day).append("天").append(hour % 24).append("小时").append(min % 60).append("分钟");
        else {
            result.append(hour).append("小时").append(min % 60).append("分钟");
        }
        return result.toString();
    }

    /**
     * 获取两从此时间差(积分平衡记录显示用的)
     *
     * @param date1
     * @param date2
     * @return
     */
    public static String getOddTime4UserScore(Date date1, Date date2) {
        int min = distanceMin(date1, date2);
        int hour = min / 60;
        int day = hour / 24;
        if (day > 0) {
            return day <= 30 ? String.format("%s天", day) : "一个月";
        } else if (hour % 24 > 0) {
            return String.format("%s小时", hour % 24);
        } else if (min % 60 > 0) {
            return String.format("%s分钟", min % 60);
        }
        return "1分钟";
    }

    /**
     * 得到总的月份
     *
     * @param monthBegin
     * @param monthEnd
     * @return
     */
    public static int getMonths(Date monthBegin, Date monthEnd) {
        Calendar dtMonthBegin = Calendar.getInstance();
        dtMonthBegin.setTime(monthBegin);
        Calendar dtMonthEnd = Calendar.getInstance();
        dtMonthEnd.setTime(monthEnd);

        return (dtMonthEnd.get(Calendar.YEAR) - dtMonthBegin.get(Calendar.YEAR)) * 12 + dtMonthEnd.get(Calendar.MONTH) - dtMonthBegin.get(Calendar.MONTH);
    }

    /**
     * 得到租期的月份数
     *
     * @param monthBegin
     * @param monthEnd
     * @return
     */
    public static int getMonths4RentDayCalculate(Date monthBegin, Date monthEnd) {

        Calendar dtMonthBegin = Calendar.getInstance();
        dtMonthBegin.setTime(monthBegin);
        Calendar dtMonthEnd = Calendar.getInstance();
        dtMonthEnd.setTime(monthEnd);
        int monthGap = (dtMonthEnd.get(Calendar.YEAR) - dtMonthBegin.get(Calendar.YEAR)) * 12 + dtMonthEnd.get(Calendar.MONTH) - dtMonthBegin.get(Calendar.MONTH);

        //由于租期的计算方式有变，则判断租期的结束日期是否是当月的最后一天
        int dtMonthEndDay = dtMonthEnd.get(Calendar.DAY_OF_MONTH);
        int dtMonthEndMaxDay = getLastDayOfMonth(monthEnd);
        int FIRST_DAY = 1;
        if (dtMonthEndDay == dtMonthEndMaxDay && FIRST_DAY == dtMonthBegin.get(Calendar.DAY_OF_MONTH)) {
            ++monthGap;
        }
        return monthGap;
    }

    public static void main(String[] args) {
        //System.out.println(DateUtil.format(DateUtil.getToday(), "yyyy-MM-dd HH:mm:ss"));
        //System.out.println(DateUtil.format(MAX_VALUE, "yyyy-MM-dd HH:mm:ss"));
        //Timestamp dtNow = DateUtil.addHours(DateUtil.getToday(), 10);
        //System.out.println(dtNow);
        System.out.println(getMonths4RentDayCalculate(DateUtil.fromString("2014-1-1"), DateUtil.fromString("2014-3-30")));
    }
}