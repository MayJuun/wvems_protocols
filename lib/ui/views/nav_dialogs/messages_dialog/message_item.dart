import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.appMessage}) : super(key: key);

  final AppMessage appMessage;

  @override
  Widget build(BuildContext context) {
    final MessagingController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StyledSelectableContainer(
        onPressed: () => controller.toggleRead(appMessage),
        isActive: !appMessage.beenRead,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    appMessage.title,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    // todo: replace with file size
                    '20 mb',
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.apply(color: Theme.of(context).disabledColor),
                  )
                ],
              ),
            ),
            const Gap(4),
            // _ProtocolIconButton(
            //   icon: Mdi.cloudDownloadOutline,
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
