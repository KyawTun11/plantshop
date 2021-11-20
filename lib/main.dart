import 'package:flutter/material.dart';
import 'package:plant_shop/Home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff51B1A6),
      ),
      home: HomePage(),
    );
  }
}
