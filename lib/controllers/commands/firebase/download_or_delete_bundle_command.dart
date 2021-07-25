import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/firebase/firebase_command.dart';
import 'package:wvems_protocols/models/models.dart';

class DownloadOrDeleteBundleCommand extends FirebaseCommand {
  @override
  Future<void> execute({ProtocolBundle? bundle}) async {
    print('download or delete');

    /// Files have been downloaded already, handle remove
    if (bundle is ProtocolBundleAsFiles) {
      _confirmRemoveBundle();
    } else if (bundle is ProtocolBundleAsFirebaseRefs) {
      // todo: download bundle here
      print('download bundle here');
    }
  }
}

void _confirmRemoveBundle() {
  Get.defaultDialog(
    title: 'Delete PDF?',
    middleText: 'Are you sure you want to delete this PDF?',
    textConfirm: 'DELETE',
    onConfirm: () {
      Get.back();
      // todo: remove bundle here
    },
    onCancel: () => Get.back(),
  );
}
