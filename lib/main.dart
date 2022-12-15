import 'package:flutter/material.dart';
import 'package:techme/pages/conference.dart';
import 'package:techme/pages/meetings.dart';
import 'package:techme/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Profile(),
    );
  }
}
