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
    final ValidatorsUtil _validatorsUtil = ValidatorsUtil();

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
          ...protocolBundleController.bundleFiles().map(
                (bundle) => _ProtocolVersionItem(
                  title: _documentsUtil.bundleIdToTitle(bundle.bundleId),
                  fileSizeText: _validatorsUtil.numToStringAsFixed(
                      _validatorsUtil.intBytesToMegabytes(bundle.pdfFileSize),
                      1),

                  /// Note, if additional protocols are added more than annually
                  /// then 'bundleId' should be the isActive check, not 'year'
                  isActive: bundle.year == controller.activeYear.value,
                  isDownloaded: true,
                  onPressed: () =>
                      controller.loadNewPdf(2020, AppAssets.PROTOCOL_2020),
                  bundle: bundle,
                ),
              ),

          /// Data available on the cloud are displayed second
          ...protocolBundleController.bundleFirebaseRefs().map(
                (bundle) => (!protocolBundleController
                        .isBundleStoredLocally(bundle.bundleId))
                    ? _ProtocolVersionItem(
                        title: _documentsUtil.bundleIdToTitle(bundle.bundleId),
                        fileSizeText: _validatorsUtil.numToStringAsFixed(
                            _validatorsUtil
                                .intBytesToMegabytes(bundle.pdfFileSize),
                            1),
                        isActive: false,
                        onPressed: () => controller.loadNewPdf(
                            2020, AppAssets.PROTOCOL_2020),
                        bundle: bundle,
                      )
                    : Container(),
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
    required this.fileSizeText,
    required this.bundle,
    this.onPressed,
    this.isActive = false,
    this.isDownloaded = false,
  }) : super(key: key);

  final String title;
  final String fileSizeText;
  final ProtocolBundle bundle;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isDownloaded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StyledSelectableContainer(
        onPressed: () async =>
            await SelectOrDownloadFileCommand().execute(bundle: bundle),
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
                    '$fileSizeText mb',
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
              onPressed: () async =>
                  await DownloadOrDeleteBundleCommand().execute(bundle: bundle),
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
