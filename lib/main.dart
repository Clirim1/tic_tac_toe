import 'package:flutter/material.dart';

import 'Home_Page.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blueAccent,),
      home: new Home_Page(),
      
    );
  }
}
