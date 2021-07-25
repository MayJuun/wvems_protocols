import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/firebase/firebase_command.dart';
import 'package:wvems_protocols/models/models.dart';

class SelectOrDownloadFileCommand extends FirebaseCommand {
  @override
  Future<void> execute({ProtocolBundle? bundle}) async {
    /// Files have been downloaded already, handle remove
    if (bundle is ProtocolBundleAsFiles) {
      pdfStateController.loadNewPdf(bundle);
      print('select file here');
    } else if (bundle is ProtocolBundleAsFirebaseRefs) {
      _confirmDownloadBundle(bundle);
    }
  }

  void _confirmDownloadBundle(ProtocolBundleAsFirebaseRefs bundle) {
    Get.defaultDialog(
      title: 'Download PDF?',
      middleText:
          'This file has not currently been downloaded.\n\nDo you want to download and select this PDF?',
      textConfirm: 'DOWNLOAD',
      onConfirm: () {
        Get.back();
        protocolBundleController.downloadCloudBundle(bundle);
      },
      onCancel: () => Get.back(),
    );
  }
}
