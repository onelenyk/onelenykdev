class DateUtil {

  DateUtil(this.date);
  DateTime date;
  DateTime now = DateTime.now();

  List<String> weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  String getTime([final bool showWeek = true]) {
    if (showWeek && date.isBefore(DateTime(now.year, now.month, now.day))) {
      return getWeek();
    }

    return "${date.hour < 10 ? '0' : ''}${date.hour}:${date.minute < 10 ? '0' : ''}${date.minute}";
  }

  String getWeek() => weekDays[date.weekday].substring(0, 3);
}
