import 'package:share_plus/share_plus.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/ui/strings.dart';

class ShareLinkCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    Share.share(S.NAV_SHARE_LINK_INFO);
    print('share link');
  }
}
