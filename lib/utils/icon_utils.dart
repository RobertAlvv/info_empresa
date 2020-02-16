import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "exit_app": Icons.exit_to_app,
  "phonelink_setup": Icons.phonelink_setup,
  
};

Icon getIconDrawer(String stringIcon) => Icon(
      _icons[stringIcon],
      color: Colors.orange.shade800,
    );


