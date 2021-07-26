import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.appMessage}) : super(key: key);

  final AppMessage appMessage;

  @override
  Widget build(BuildContext context) {
    final MessagingController controller = Get.find();
    final ThemeController themeController = Get.find();
    final appTheme =
        themeController.getAppThemeFromBrightness(Theme.of(context).brightness);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                  const Gap(8),
                  Text(
                    appMessage.body,
                    style: context.textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          DateTimeFormat.relative(appMessage.dateTime,
                              appendIfAfter: 'ago'),
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle1!
                              .apply(color: appTheme.grey),
                        ),
                        StyledIconButton(
                          icon: const Icon(Mdi.delete),
                          onPressed: () => controller.removeMessage(appMessage),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Gap(4),
          ],
        ),
      ),
    );
  }
}
