import 'package:wvems_protocols/controllers/commands/abstract_command.dart';

class SetPageCommand extends AbstractCommand {
  @override
  Future<void> execute({int? pageIndex}) async {
    await pdfStateController.setPdfPage(pageIndex);
  }
}
