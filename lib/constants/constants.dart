import 'package:flutter/material.dart';

List months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List fullMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<Map<String, dynamic>> fullMonthsWithIndex = [
  {
    "month": 'January',
    "day": 1,
  },
  {
    "month": 'February',
    "day": 2,
  },
  {
    "month": 'March',
    "day": 3,
  },
  {
    "month": 'April',
    "day": 4,
  },
  {
    "month": 'May',
    "day": 5,
  },
  {
    "month": 'June',
    "day": 6,
  },
  {
    "month": 'July',
    "day": 7,
  },
  {
    "month": 'August',
    "day": 8,
  },
  {
    "month": 'September',
    "day": 9,
  },
  {
    "month": 'October',
    "day": 10,
  },
  {
    "month": 'November',
    "day": 11,
  },
  {
    "month": 'December',
    "day": 12,
  },
];

List numberList = [
  "00",
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
  "29",
  "30",
  "31",
  "32",
  "33",
  "34",
  "35",
  "36",
  "37",
  "38",
  "39",
  "40",
  "41",
  "42",
  "43",
  "44",
  "45",
  "46",
  "47",
  "48",
  "49",
  "50",
  "51",
  "52",
  "53",
  "54",
  "55",
  "56",
  "57",
  "58",
  "59",
  "60",
  "61",
  "62",
  "63",
  "64",
  "65",
  "66",
  "67",
  "68",
  "69",
  "70",
  "71",
  "72",
  "73",
  "74"
];
String getFormatedDate(DateTime dt) {
  String formattedDt = "";
  if (dt.day < 10) {
    formattedDt += "0${dt.day}";
  } else {
    formattedDt += dt.day.toString();
  }

  switch (dt.month) {
    case 1:
      formattedDt += " Jan";
      break;
    case 2:
      formattedDt += " Feb";
      break;
    case 3:
      formattedDt += " Mar";
      break;
    case 4:
      formattedDt += " Apr";
      break;
    case 6:
      formattedDt += " Jun";
      break;
    case 7:
      formattedDt += " Jul";
      break;
    case 8:
      formattedDt += " Aug";
      break;
    case 9:
      formattedDt += " Sep";
      break;
    case 10:
      formattedDt += " Oct";
      break;
    case 11:
      formattedDt += " Nov";
      break;
    case 12:
      formattedDt += " Dec";
      break;
    case 5:
      formattedDt += " May";
      break;
  }
  formattedDt += " ${dt.year % 100}";

  return formattedDt;
}

List<String> shortMonth = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

List<Color> colors = [
  Colors.green.shade100,
  Colors.redAccent.shade100,
  Colors.purpleAccent.shade100,
  Colors.pinkAccent.shade100,
  Colors.greenAccent.shade100,
  Colors.tealAccent.shade100,
  Colors.limeAccent.shade100,
  Colors.deepOrange.shade100,
];
List<Color> noticeColor = const [
  Color(0xFFAD65C7),
  Color(0xFFD05954),
  Color(0xFF0B8FD9),
  Color(0xFF3DBA9C),
  Color(0xFF63A06B),
  Color(0xFFB99E56),
  Color(0xFF7D5CDB)
];

Map<String, dynamic> getMonthWithCount = {
  "1": 31,
  "3": 31,
  "4": 30,
  "5": 31,
  "6": 30,
  "7": 31,
  "8": 30,
  "9": 30,
  "10": 31,
  "11": 30,
  "12": 31,
  "2": DateTime.now().year % 4 == 0 ? 29 : 28
};

Map<String, dynamic> dayName = {
  "1": "Mon",
  "2": "Tue",
  "3": "Wed",
  "4": "Thu",
  "5": "Fri",
  "6": "Sat",
  "7": "Sun",
};
