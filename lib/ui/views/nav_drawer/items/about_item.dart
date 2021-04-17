import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';

class AboutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info, size: 30.0),
      title: Text(S.NAV_ABOUT),
      subtitle: Text('Release ${S.APP_RELEASE}'),
      onTap: () => _displayAboutDialog(context),
    );
  }
}

// pop-op dialog for "About"
void _displayAboutDialog(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('About WVEMS Protocols'),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Text('\nApplication Release: ${S.APP_RELEASE}\n'),
          Text(
            S.APP_COPYRIGHT,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12.0),
          TextButton(
            child: Text(S.NAV_OK),
            onPressed: () {
              Get.back();
            }, //onPressed
          ),
        ],
      );
    }, // builder
  ); //showDialog()
} //_displayAboutDialog()