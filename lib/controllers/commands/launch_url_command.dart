import 'package:wvems_protocols/services/services.dart';

class LaunchUrlCommand {
  Future<void> execute({required String url}) async => await launchString(url);
}
