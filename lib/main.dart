import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: Color(0XFFFBAF002),
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/product': (context) => Product(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
