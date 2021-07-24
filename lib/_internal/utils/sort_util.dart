import 'package:wvems_protocols/models/models.dart';

class SortUtil {
  List<AppMessage> sortByTitle(List<AppMessage> messageList) {
    final newList = messageList;
    newList
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    return newList;
  }

  List<AppMessage> sortByDate(List<AppMessage> messageList) {
    final newList = messageList;
    newList.sort((a, b) => DateTime.parse(b.dateTime.toString())
        .compareTo(DateTime.parse(a.dateTime.toString())));
    return newList;
  }
}
