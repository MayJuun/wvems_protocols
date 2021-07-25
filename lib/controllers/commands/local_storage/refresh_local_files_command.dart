import 'package:wvems_protocols/controllers/commands/abstract_command.dart';

class RefreshLocalDataCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    await protocolBundleController.refreshLocalData();
  }
}
