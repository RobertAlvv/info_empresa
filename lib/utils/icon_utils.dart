import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "exit_app": Icons.exit_to_app,
  "phonelink_setup": Icons.phonelink_setup,
  "servidor": Icons.storage,
  "routes": Icons.router,
  "impresora": Icons.print,
  "computadora": Icons.computer,
};

Icon getIcon(String stringIcon) => Icon(
      _icons[stringIcon],
      size: 45,
      color: Colors.orange.shade800,
    );

Icon getIconDrawer(String stringIcon) => Icon(
      _icons[stringIcon],
      color: Colors.orange.shade800,
    );
