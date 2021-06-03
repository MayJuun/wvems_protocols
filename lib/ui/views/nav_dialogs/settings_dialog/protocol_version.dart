import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class ProtocolVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    final firebaseController = Get.put(FirebaseController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Select protocol version',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            StyledIconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => firebaseController.getListExample())
          ],
        ),
        // const Gap(8),
        const _ProtocolVersionItem(
          title: '2021 WVEMS Protocols',
        ),
        _ProtocolVersionItem(
          title: '2020 WVEMS Protocols',
          onPressed: () => controller.loadNewPdf(2020, AppAssets.PROTOCOL_2020),
        ),
        _ProtocolVersionItem(
          title: '2019 WVEMS Protocols',
          onPressed: () => controller.loadNewPdf(2019, AppAssets.PROTOCOL_2019),
        )
      ],
    );
  }
}

class _ProtocolVersionItem extends StatelessWidget {
  const _ProtocolVersionItem({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Colors.grey.withOpacity(0.04);
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed))
              return Colors.grey.withOpacity(0.12);
            return null; // Defer to the widget's default.
          },
        ),
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed ?? () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.colorScheme.onSurface),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
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
              _ProtocolIconButton(
                icon: Mdi.cloudDownloadOutline,
                onPressed: () {},
              ),
            ],
          ),
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
        iconSize: 24,
        icon: Icon(icon),
        onPressed: onPressed);
  }
}
