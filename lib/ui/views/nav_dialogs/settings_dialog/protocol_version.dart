import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/assets.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/models/models.dart';
import 'package:wvems_protocols/ui/strings.dart';
import 'package:wvems_protocols/ui/styled_components/styled_components.dart';
import 'package:wvems_protocols/ui/views/nav_dialogs/settings_dialog/protocol_version_controller.dart';

class ProtocolVersion extends StatelessWidget {
  const ProtocolVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    final ProtocolBundleController protocolBundleController = Get.find();
    // on first load, refresh all cloud data
    Get.put(ProtocolVersionController());

    final DocumentsUtil _documentsUtil = DocumentsUtil();

    return Obx(
      () => Column(
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
                  onPressed: () async {
                    await RefreshLocalDataCommand().execute();
                    await RefreshCloudDataCommand().execute();
                  })
            ],
          ),

          /// Shows loading widget on data refresh
          protocolBundleController.protocolBundleSet
                  .contains(const ProtocolBundle.loading())
              ? const LinearProgressIndicator()
              : Container(),

          /// Locally downloaded files are displayed first
          ...protocolBundleController.protocolBundleSet.map(
            (bundle) {
              Widget protocolWidget = Container();

              if (bundle is ProtocolBundleAsFiles) {
                protocolWidget = _ProtocolVersionItem(
                  title: _documentsUtil.bundleIdToTitle(bundle.bundleId),
                  isActive: bundle.year == controller.activeYear.value,
                  isDownloaded: true,
                  onPressed: () =>
                      controller.loadNewPdf(2020, AppAssets.PROTOCOL_2020),
                );
              }
              return protocolWidget;
            },
          ),

          /// Data available on the cloud are displayed second
          ...protocolBundleController.protocolBundleSet.map(
            (bundle) {
              Widget protocolWidget = Container();

              if (bundle is ProtocolBundleAsFirebaseRefs &&
                  !protocolBundleController
                      .isBundleStoredLocally(bundle.bundleId)) {
                protocolWidget = _ProtocolVersionItem(
                  title: _documentsUtil.bundleIdToTitle(bundle.bundleId),
                  isActive: false,
                  onPressed: () =>
                      controller.loadNewPdf(2020, AppAssets.PROTOCOL_2020),
                );
              }
              return protocolWidget;
            },
          ),
        ],
      ),
    );
  }
}

class _ProtocolVersionItem extends StatelessWidget {
  const _ProtocolVersionItem({
    Key? key,
    required this.title,
    this.onPressed,
    this.isActive = false,
    this.isDownloaded = false,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isDownloaded;

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
              icon: isDownloaded ? Mdi.cloudDownload : Mdi.cloudDownloadOutline,
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
