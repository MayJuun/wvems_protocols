import 'package:wvems_protocols/controllers/commands/firebase/firebase_command.dart';

class RefreshCloudDataCommand extends FirebaseCommand {
  @override
  Future<void> execute() async {
    await protocolBundleController.refreshCloudData();
  }
}
