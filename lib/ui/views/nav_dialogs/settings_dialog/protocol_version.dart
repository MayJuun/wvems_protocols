import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';

class ProtocolVersion extends StatelessWidget {
  const ProtocolVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProtocolBundleController protocolBundleController = Get.find();

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  S.NAV_VERSION_SUBTITLE,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              StyledIconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await RefreshLocalDataCommand().execute();
                  })
            ],
          ),

          const Gap(8),
          const _ToggleDownloadInfo(),
          const Gap(8),

          /// Shows loading widget on data refresh
          protocolBundleController.protocolBundleSet
                  .contains(const ProtocolBundle.loading())
              ? const LinearProgressIndicator()
              : Container(),
        ],
      ),
    );
  }
}

class _ToggleDownloadInfo extends StatelessWidget {
  const _ToggleDownloadInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          // fit: FlexFit.tight,
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Mdi.refresh, size: 18),
                Gap(4),
                Expanded(child: StyledSubtitleText('= refresh content')),
              ],
            ),
          ),
        ),
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Mdi.cloudDownloadOutline, size: 18),
                Gap(4),
                Expanded(child: StyledSubtitleText('= download / remove')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
