import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/commands.dart';

class ProtocolVersionController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await RefreshCloudDataCommand().execute();
  }
}
