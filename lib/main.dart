import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'USA News',
        theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
        home: Home());
  }
}
