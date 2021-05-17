import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

class ProtocolVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Select protocol version',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Gap(8),
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
        highlightColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed ?? () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ProtocolIconButton(
                            icon: Mdi.checkboxBlankCircleOutline,
                            onPressed: () {},
                          ),
                          _ProtocolIconButton(
                            icon: Mdi.cloudDownloadOutline,
                            onPressed: () {},
                          ),
                          _ProtocolIconButton(
                            icon: Mdi.shareVariant,
                            onPressed: () {},
                          ),
                          // _ProtocolIconButton(
                          //   icon: Mdi.dotsVertical,
                          //   onPressed: () {},
                          // ),
                        ]),
                  ),
                  Flexible(
                    child: Text(
                      '20 mb',
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.apply(color: Theme.of(context).disabledColor),
                    ),
                  ),
                ],
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
    return IconButton(
        padding: const EdgeInsets.all(4),
        iconSize: 24,
        icon: Icon(icon),
        onPressed: onPressed);
  }
}
