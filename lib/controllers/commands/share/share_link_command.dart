import 'package:quick_reference/controllers/commands/abstract_command.dart';
import 'package:quick_reference/ui/strings.dart';
import 'package:share_plus/share_plus.dart';

class ShareLinkCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    Share.share(S.NAV_SHARE_LINK_INFO);
    print('share link');
  }
}
