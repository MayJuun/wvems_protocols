import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/controllers/controllers.dart';

abstract class FirebaseCommand extends AbstractCommand {
  final FirebaseController firebaseController = Get.find();
}
