import 'package:intl/intl.dart';

final numberFormat = NumberFormat('###,###');
final numberFormat2 = NumberFormat("###");
final dateFormat = DateFormat('yyyy.MM.dd');
final dateFormat2 = DateFormat('MM.dd.yyyy.');

String rankFormat(String i) {
  if (int.parse(i) % 10 == 1) {
    return "${i}st";
  } else if (int.parse(i) % 10 == 2) {
    return "${i}nd";
  } else if (int.parse(i) % 10 == 3) {
    return "${i}rd";
  } else {
    return "${i}th";
  }
}
