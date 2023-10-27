import 'package:chatapplication/color.dart';
import 'package:chatapplication/reponsive/reponsive_layout.dart';
import 'package:chatapplication/screens/mobile_screen_layout.dart';
import 'package:chatapplication/screens/web_screen_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData.dark().copyWith(
        backgroundColor: backgroundColor,
      ),
     home: const ReponsiveLayout(
      mobileScreenLayout: MobileScreenLayout(), 
      webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
