import 'package:url_launcher/url_launcher.dart';

Future<void> launchString(String url) async {
  final Uri _uri = Uri.parse(url);
  if (!await launchUrl(_uri)) {
    throw 'Could not launch $_uri';
  }
}
