import 'package:flutter/material.dart';
import 'config/palette.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      debugShowCheckedModeBanner: false,
      title: 'TODO',
      home: HomeScreen(),
    );
  }
}
