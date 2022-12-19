import 'package:flutter/material.dart';

import 'layout/home_layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.purple[600],
          primary: Colors.purple[700],
        ),
      ),
      home: const HomeLayout(),
    );
  }
}
