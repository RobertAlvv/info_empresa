import 'package:flutter/material.dart';
import 'src/dashboard/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryIconTheme: IconThemeData(color: Colors.blueGrey), primaryColor: Colors.orange.shade800, iconTheme: IconThemeData(color:Colors.orange.shade800)),
        debugShowCheckedModeBanner: false,
        home: MyDashboard());
  }
}

