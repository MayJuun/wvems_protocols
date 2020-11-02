import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/controllers/theme_service.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeService themeService = Get.find();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Western Virginia EMS Protocols',
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text('Dark Mode'),
            onTap: () {
              themeService.setThemeMode(ThemeMode.dark);
              Get.back();
            },
          ),
          ListTile(
            title: Text('Light Mode'),
            onTap: () {
              themeService.setThemeMode(ThemeMode.light);
              Get.back();
            },
          ),
          ListTile(
            title: Text('System Default'),
            onTap: () {
              themeService.setThemeMode(ThemeMode.system);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
