import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/messages_dialog/message_item.dart';

class UnreadMessages extends StatelessWidget {
  const UnreadMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessagingController controller = Get.find();
    final messages = controller.appMessages;

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Unread',
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...SortUtil()
                .sortByDate(messages.toList())
                .where((e) => !e.beenRead)
                .map((e) => MessageItem(appMessage: e)),
            Container(),
          ],
        ));
  }
}
