import 'package:quick_reference/controllers/commands/abstract_command.dart';

class RefreshLocalDataCommand extends AbstractCommand {
  @override
  Future<void> execute() async {
    await protocolBundleController.refreshLocalData();
  }
}
