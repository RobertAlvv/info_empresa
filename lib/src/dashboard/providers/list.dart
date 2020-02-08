import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder,
  "build": Icons.build,
  "input": Icons.input,
  "list": Icons.list,
  "tune": Icons.tune,
};

Icon getIcon(String stringIcon) => Icon(
      _icons[stringIcon],
      color: Colors.blue,
    );


final listMenuOpcionDrawer = [
  {
    'title': 'Configuraciones',
  },
  {
    'title': 'Cerrar Sesion',
  }
];
