import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/firebase/firebase_command.dart';
import 'package:wvems_protocols/models/models.dart';

class DownloadOrDeleteBundleCommand extends FirebaseCommand {
  @override
  Future<void> execute({ProtocolBundle? bundle}) async {
    print('download or delete');

    if (bundle is ProtocolBundleAsFiles) {
      /// Files have been downloaded already, handle removal
      _confirmRemoveBundle(bundle);
    } else if (bundle is ProtocolBundleAsFirebaseRefs) {
      protocolBundleController.downloadCloudBundle(bundle);
    }
  }

  void _confirmRemoveBundle(ProtocolBundleAsFiles bundle) {
    Get.defaultDialog(
      title: 'Delete PDF?',
      middleText: 'Are you sure you want to delete this PDF?',
      textConfirm: 'DELETE',
      onConfirm: () {
        Get.back();
        protocolBundleController.removeLocalBundle(bundle);
      },
      onCancel: () => Get.back(),
    );
  }
}
