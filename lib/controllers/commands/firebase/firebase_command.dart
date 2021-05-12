import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/controllers/firebase_controller.dart';

abstract class FirebaseCommand extends AbstractCommand {
  final FirebaseController firebaseController = Get.find();
}
