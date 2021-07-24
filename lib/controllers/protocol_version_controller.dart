import 'package:get/get.dart';
import 'package:wvems_protocols/models/protocol_version_bundle/protocol_version_bundle.dart';

import 'controllers.dart';

class ProtocolVersionController extends GetxController {
  final FirebaseController _firebaseController = Get.find();

  final RxList<ProtocolVersionBundle> protocolBundleList =
      <ProtocolVersionBundle>[].obs;
}
