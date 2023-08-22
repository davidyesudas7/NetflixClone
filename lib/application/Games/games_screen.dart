import 'package:flutter/material.dart';

class Gamescreen extends StatelessWidget {
  const Gamescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'oops sorry \n no games added yet',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
