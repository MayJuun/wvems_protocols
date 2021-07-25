import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/firebase/firebase_command.dart';
import 'package:wvems_protocols/models/models.dart';

class SelectOrDownloadFileCommand extends FirebaseCommand {
  @override
  Future<void> execute({ProtocolBundle? bundle}) async {
    print('select or download');

    /// Files have been downloaded already, handle remove
    if (bundle is ProtocolBundleAsFiles) {
      // todo: select file here

    } else if (bundle is ProtocolBundleAsFirebaseRefs) {
      // todo: download bundle here
      _confirmDownloadBundle();
      print('download bundle here');
    }
  }
}

void _confirmDownloadBundle() {
  Get.defaultDialog(
    title: 'Download PDF?',
    middleText:
        'This file has not currently been downloaded.\n\nDo you want to download and select this PDF?',
    textConfirm: 'DOWNLOAD',
    onConfirm: () {
      Get.back();
      // todo: download bundle here
    },
    onCancel: () => Get.back(),
  );
}
