
import "package:intl/intl.dart";
// do not include that file in commit context FOR GitBrain
main(){
  final current = DateTime.now();
  print(formatDateTime(current));
  print(formatDateTime(DateTime.parse("2024-01-12")));
}

String formatDateTime(final DateTime dateTime) {
  // Define the desired date format
  final formatter = DateFormat.yMMMMd("en_US");

  // Format the DateTime using the defined format
  return formatter.format(dateTime);
}
