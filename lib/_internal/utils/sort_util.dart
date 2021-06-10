import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:wvems_protocols/models/models.dart';

class SortUtil {
  List<AppMessage> sortByTitle(List<AppMessage> messageList) {
    final newList = messageList;

    messageList
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    return newList;
  }

  // todo: add sortByDateTime
}
