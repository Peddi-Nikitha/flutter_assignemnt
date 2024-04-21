import 'package:flutter/material.dart';
import 'screens/startup_screen.dart'; // Import the file containing the screen code

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartupScreen(), // Replace `StartupScreen()` with the name of your screen class
    );
  }
}
