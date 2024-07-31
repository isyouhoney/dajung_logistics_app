import 'package:intl/intl.dart';

// DateTime 객체를 AM/PM hh:mm 형식으로 포맷하는 함수
String formatDateTimeAMPM(DateTime dateTime) {
  return DateFormat('a hh:mm').format(dateTime);
}

String dateFormat(DateTime dateTime) {
  return DateFormat('yyyy.MM.dd').format(dateTime);
}
