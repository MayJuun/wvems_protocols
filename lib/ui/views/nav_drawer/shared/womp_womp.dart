import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/ui/strings.dart';

// temporary <kludge>. kept mostly until it makes sense to remove it
void displayWompWomp(BuildContext context) {
  Get.back();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(
          S.WOMP_WOMP,
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          TextButton(
            child: Text(S.NAV_OK),
            onPressed: () {
              Get.back();
            }, //onPressed
          ),
        ],
      );
    }, // builder
  ); // showDialog()
} // </kludge>