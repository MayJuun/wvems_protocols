import 'package:quick_reference/controllers/commands/abstract_command.dart';
import 'package:share_plus/share_plus.dart';

class SharePdfCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    print('share pdf');
    await Share.shareFiles(
      [pdfStateController.pathPDF],
      subject: 'Subject',
      text: 'Text',
    );
  }
}
