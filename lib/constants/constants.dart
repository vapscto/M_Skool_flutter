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

List<String> profileImg = [
  "assets/images/prof1.png",
  "assets/images/prof2.png",
  "assets/images/prof3.png",
  "assets/images/prof4.png",
  "assets/images/prof5.png",
  "assets/images/prof6.png",
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
  Color(0xFFF54c4c),
  Color(0xFF015DAF),
  Color(0xFF824CC3),
  Color(0xFFEC16F0),
  Color(0xFF28B6C8),
  Color(0xFFAF6152),
  Color(0xFF3FCF52),
];
List<Color> noticeBackgroundColor = const [
  Color(0xFFFFd8d8),
  Color(0xFFDFEFFD),
  Color(0xFFF1E5FF),
  Color(0xFFFFEEFF),
  Color(0xFFEEFDFF),
  Color(0xFFFFEBE7),
  Color(0xFFEFFFF1),
];

List<Color> examCardColor = const [
  Color.fromARGB(255, 252, 205, 255),
  Color.fromARGB(255, 243, 238, 178),
  Color.fromARGB(255, 184, 173, 233),
  Color.fromARGB(255, 161, 216, 216),
  Color.fromARGB(255, 210, 167, 223),
];
List<Color> chipColor = const [
  Color(0xFFFBCFFF),
  Color(0xFFFBF6C4),
  Color(0xFFDBC3FE),
  Color(0xFFACEFDF)
];
List<Color> textColor = const [
  Color(0xFFF000FF),
  Color(0xFFBCAE29),
  Color.fromARGB(255, 146, 73, 255),
  Color.fromARGB(255, 38, 117, 99),
  Color(0xFFE077FF),
];

List<Color> pieColor = const [
  Color(0xFFF000FF),
  Color.fromARGB(255, 255, 230, 0),
  Color.fromARGB(255, 146, 73, 255),
  Color.fromARGB(255, 38, 117, 99),
  Color(0xFFE077FF),
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

List<Color> timetablePeriodColor = const [
  Color(0xFF9900F0),
  Color(0xFF32E1F7),
  Color(0xFF4ED092),
  Color(0xFFFFE500),
  Color(0xFFFF9621),
  Color(0xFFFF60A8),
  Color(0xFFA9D252),
  Color(0xFF09B4BD),
  Color(0xFFFF6F67),
  Color.fromARGB(255, 84, 197, 19),
  Color.fromARGB(255, 12, 126, 146),
  Color.fromARGB(255, 150, 14, 127),
  Color.fromARGB(255, 114, 24, 150),
];
Color getDashBoardIconByName(String title) {
  switch (title) {
    case "english":
      return const Color(0xFF9900F0);
    case "kannada":
      return const Color(0xFF32E1F7);
    case "physics":
      return const Color(0xff4ED092);
    case "chemistry":
      return const Color(0XFF00b1bb);
    case "mathematics":
      return const Color(0xFFFF9621);
    case "computer science":
      return const Color(0xFFFF60A8);
    case "biology":
      return const Color(0xffFF6F67);
    case "social science":
      return const Color(0xff09B4BD);
    case "library":
      return const Color(0xffA9D252);
    case "science":
      return Colors.greenAccent[700]!;
    case "hindi":
      return const Color(0xFF015DAF);
    case "chemistry lab":
      return const Color(0xFF824CC3);
    case "commercial studies":
      return const Color(0xFFEC16F0);
    case "colouring..":
      return const Color(0xFFF54C4C);
    default:
      return Colors.grey;
  }
}

List<Map<String, dynamic>> subjectIcons = [
  {
    "title": "mathematics",
    "icon": "assets/images/MATHS.png",
  },
  {
    "title": "chemistry",
    "icon": "assets/images/SCI.png",
  },
  {
    "title": "physics",
    "icon": "assets/images/SCI.png",
  },
  {
    "title": "science",
    "icon": "assets/images/SCI.png",
  },
  {
    "title": "biology",
    "icon": "assets/images/SCI.png",
  },
  {
    "title": "social science",
    "icon": "assets/images/SOCIAL.png",
  },
  {
    "title": "english",
    "icon": "assets/images/ENGLISH.png",
  },
  {
    "title": "hindi",
    "icon": "assets/images/HINDI.png",
  },
  {
    "title": "kannada",
    "icon": "assets/images/KANNADA.png",
  },
  {
    "title": "other",
    "icon": "assets/images/NOSUB.png",
  }
];

Map<String, dynamic> getIconFromSubject(String subName) {
  if (subName.contains("mathematics") ||
      subName == "mathematics" ||
      subName.contains("math")) {
    return {
      "icon": "assets/images/MATHS.png",
      "chipBgColor": const Color.fromARGB(255, 234, 245, 255),
      "chipColor": const Color(0xFF015DAF)
    };
  }
  if (subName.contains("social") || subName == "social science") {
    return {
      "icon": "assets/images/SOCIAL.png",
      "chipBgColor": const Color.fromARGB(255, 255, 231, 231),
      "chipColor": const Color(0xFFFF4A4A)
    };
  }

  if (subName.contains("hindi") ||
      subName == "hindi" ||
      subName.contains("hin")) {
    return {
      "icon": "assets/images/HINDI.png",
      "chipBgColor": const Color.fromARGB(255, 232, 243, 255),
      "chipColor": const Color(0xFF143F6B)
    };
  }

  if (subName.contains("kannada") ||
      subName == "kannada" ||
      subName.contains("kan")) {
    return {
      "icon": "assets/images/KANNADA.png",
      "chipBgColor": const Color.fromARGB(255, 245, 237, 255),
      "chipColor": const Color(0xFF824CC3)
    };
  }

  if (subName.contains("english") ||
      subName == "english" ||
      subName.contains("eng")) {
    return {
      "icon": "assets/images/ENGLISH.png",
      "chipBgColor": const Color.fromARGB(255, 223, 255, 250),
      "chipColor": const Color(0xFF1EAE98)
    };
  }
  if (subName.contains("chemistry") ||
      subName == "chemistry" ||
      subName.contains("chem")) {
    return {
      "icon": "assets/images/SCI.png",
      "chipBgColor": const Color.fromARGB(52, 255, 0, 119),
      "chipColor": const Color(0xFFFF0075)
    };
  }
  if (subName.contains("physics") ||
      subName == "physics" ||
      subName.contains("phy")) {
    return {
      "icon": "assets/images/SCI.png",
      "chipBgColor": const Color.fromARGB(52, 255, 0, 119),
      "chipColor": const Color(0xFFFF0075)
    };
  }
  if (subName.contains("biology") ||
      subName == "biology" ||
      subName.contains("bio")) {
    return {
      "icon": "assets/images/SCI.png",
      "chipBgColor": const Color.fromARGB(52, 255, 0, 119),
      "chipColor": const Color(0xFFFF0075)
    };
  }
  if (subName.contains("science") ||
      subName == "science" ||
      subName.contains("sci")) {
    return {
      "icon": "assets/images/SCI.png",
      "chipBgColor": const Color.fromARGB(255, 255, 234, 243),
      "chipColor": const Color(0xFFFF0075)
    };
  }

  return {
    "icon": "assets/images/NOSUB.png",
    "chipBgColor": const Color.fromARGB(255, 255, 242, 239),
    "chipColor": const Color(0xFFAF6152)
  };
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hour ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minute ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} second ago';
  } else {
    return 'just now';
  }
}
