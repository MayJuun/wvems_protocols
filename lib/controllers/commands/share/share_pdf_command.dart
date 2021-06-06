import 'package:share_plus/share_plus.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';

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
