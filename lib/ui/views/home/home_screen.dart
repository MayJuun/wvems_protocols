import 'package:flutter/material.dart';
import 'package:wvems_protocols/ui/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.APP_TITLE),
      ),
      body: Center(
        child: Text(S.HOME_VIEW),
      ),
    );
  }
}
