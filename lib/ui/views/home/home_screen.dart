import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WVEMS Protocols'),
      ),
      body: const Center(
        child: Text('HomeView'),
      ),
    );
  }
}
