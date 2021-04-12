import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error loading PDF\nMessage: $error\nWOMP WOMP!'),
    );
  }
}
