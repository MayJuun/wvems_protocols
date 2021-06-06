import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/ui/views/home/body/home_pdf_controller.dart';

class ShareScreenCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    final HomePdfController homePdfController = Get.find();

    print('share screen');
  }
}
