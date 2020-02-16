import 'package:flutter/material.dart';
import 'src/dashboard/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryIconTheme: IconThemeData(color: Colors.blueGrey), primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: MyDashboard());
  }
}

