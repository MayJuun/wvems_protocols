import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
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
              Expanded(
                child: Text(
                  S.NAV_VERSION_SUBTITLE,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              StyledIconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    await RefreshLocalDataCommand().execute();
                    await RefreshCloudDataCommand().execute();
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
                  bundle: bundle,
                ),
              ),

          /// Files in the process of being actively downloaded are displayed second
          ...protocolBundleController.bundleFilesDownloading().map(
                // ...protocolBundleController.bundleFilesDownloading().map(
                (bundle) => _ProtocolVersionItem(
                  title: _documentsUtil.bundleIdToTitle(bundle.bundleId),
                  fileSizeText: '...',

                  /// Note, if additional protocols are added more than annually
                  /// then 'bundleId' should be the isActive check, not 'year'
                  isActive: false,
                  isDownloaded: false,
                  isDownloading: true,
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
    this.isActive = false,
    this.isDownloaded = false,
    this.isDownloading = false,
  }) : super(key: key);

  final String title;
  final String fileSizeText;
  final ProtocolBundle bundle;
  final bool isActive;
  final bool isDownloaded;
  final bool isDownloading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StyledSelectableContainer(
        onPressed: isDownloading
            ? null
            : () async =>
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
                    isDownloading ? '$fileSizeText' : '$fileSizeText mb',
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Theme.of(context).disabledColor),
                  )
                ],
              ),
            ),
            const Gap(4),
            isDownloading
                ? const CircularProgressIndicator()
                : _ProtocolIconButton(
                    icon: isDownloaded
                        ? Mdi.cloudDownload
                        : Mdi.cloudDownloadOutline,
                    onPressed: () async => await DownloadOrDeleteBundleCommand()
                        .execute(bundle: bundle),
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

class _ToggleDownloadInfo extends StatelessWidget {
  const _ToggleDownloadInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
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
              children: <Widget>[
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
              children: <Widget>[
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
