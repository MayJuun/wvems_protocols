import 'package:wvems_protocols/controllers/commands/abstract_command.dart';

class SetPageCommand extends AbstractCommand {
  @override
  Future<void> execute({int pageNum}) async {
    await pdfStateController.rxPdfController.value.setPage(pageNum ?? 0);
    pdfStateController.update();
  }
}
