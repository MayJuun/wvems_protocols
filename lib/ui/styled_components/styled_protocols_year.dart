import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';

class StyledProtocolsYear extends StatelessWidget {
  //todo: extract into theme / jcontroller
  final String _yearText = wvemsText(2020);
  final Color _yearColor = wvemsColor(2020);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        //padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,2.0),
        height: 56.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _yearColor,
            border: Border.all(width: 3.0, color: Colors.grey)),
        child: Text(
          '$_yearText',
          textAlign: TextAlign.center,
          style: GoogleFonts.barlow(
            color: Colors.black,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
