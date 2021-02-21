import 'package:flutter/material.dart';

class StyledProtocolsYear extends StatelessWidget {
  //todo: extract into theme / jcontroller
  final String _yearText = 'Protocols 2020';
  final Color _yearColor = Colors.purple[100];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: _yearColor,
          border: Border.all(width: 3.0, color: Colors.grey)),
      child: Text(
        '$_yearText',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
