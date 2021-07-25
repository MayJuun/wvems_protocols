import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class ProtocolVersion extends StatelessWidget {
  const ProtocolVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    final protocolVersionController = Get.put(ProtocolVersionController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              S.NAV_VERSION_SUBTITLE,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            StyledIconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async =>
                  await protocolVersionController.testMethod(),
            )
          ],
        ),
        _ProtocolVersionItem(
          title: '2020 WVEMS Protocols',
          isActive: true,
          onPressed: () => controller.loadNewPdf(2020, AppAssets.PROTOCOL_2020),
        ),
      ],
    );
  }
}

class _ProtocolVersionItem extends StatelessWidget {
  const _ProtocolVersionItem({
    Key? key,
    required this.title,
    this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StyledSelectableContainer(
        onPressed: onPressed,
        isActive: isActive,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
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
            _ProtocolIconButton(
              icon: Mdi.cloudDownloadOutline,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ProtocolIconButton extends StatelessWidget {
  const _ProtocolIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return StyledIconButton(
        padding: const EdgeInsets.all(4),
        iconSize: 30,
        icon: Icon(icon),
        onPressed: onPressed);
  }
}
