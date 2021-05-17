import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/controllers/messaging_controller.dart';
import 'package:wvems_protocols/ui/strings.dart';

class MessagesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController pdfStateController = Get.find();
    final messagingController = Get.put(MessagingController());
    final unreadMessages = messagingController.unread;
    final readMessages = messagingController.read;

    // If there are _newMessages, then the mail icon will have a colored dot,
    // (otherwise the dot is invisible) and the menu text will change from
    // "Messages" to "New Messages"
    return ListTile(
      leading: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          // const NavIcon(Icons.message),
          Obx(
            () => Icon(
              Icons.circle,
              size: 12.0,
              color: VersionsUtil()
                  .wvemsColor(pdfStateController.activeYear.value)
                  // withAlpha used for Obx, so stream will always be called
                  // if empty, opacity is 0%, else 100%
                  .withAlpha(unreadMessages.isNotEmpty ? 255 : 0),
            ),
          ),
        ],
      ),
      title: unreadMessages.isEmpty
          ? Text(
              unreadMessages.isNotEmpty ? S.NAV_NEW_MESSAGES : S.NAV_MESSAGES,
              style: TextStyle(
                  fontWeight: unreadMessages.isNotEmpty
                      ? FontWeight.bold
                      : FontWeight.normal),
            )
          : Text(S.NAV_MESSAGES),
      subtitle: Text(S.NAV_NOTIFICATIONS),
      onTap: () => displayMessages(context, unreadMessages, readMessages),
    );
  }
}

void displayMessages(
  BuildContext context,
  Set<Map<String, dynamic>> unreadMessages,
  Set<Map<String, dynamic>> readMessages,
) {
  Get.back();
  final controller = Get.put(MessagingController());
  final unreadList = Column(children: const []);
  final readList = Column(children: const []);

  for (var message in unreadMessages) {
    unreadList.children.add(
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: Get.width * 0.2,
                child: Text('${message['dateTime']}'.substring(0, 16))),
            Container(
              width: Get.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${message['title']}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '${message['body']}',
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        onLongPress: () => controller.setAsRead(message['dateTime']),
        onPressed: () {},
      ),
    );
  }
  for (var message in readMessages) {
    readList.children.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: Get.width * 0.2,
              child: Text('${message['dateTime']}'.substring(0, 16))),
          Container(
            width: Get.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${message['title']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '${message['body']}',
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                const Text('Unread Messages',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('(long-press to mark as read)'),
                unreadList,
                const Text('Read Messages',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                readList,
              ],
            ),
          ),
          TextButton(
            child: Text(S.NAV_OK),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
