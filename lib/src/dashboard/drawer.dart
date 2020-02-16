import 'package:flutter/material.dart';
import 'dashboard.dart';
import '../../utils/icon_utils.dart';

final listMenuOpcionDrawer = [
  {
    'title': 'Configuraciones',
    'icon': 'phonelink_setup',
  },
  {
    'title': 'Cerrar Sesion',
    'icon': 'exit_app',
  }
];


int _taglogo;
String _titulo;

List<Widget> menuDrawer(BuildContext context) {
  List<Widget> list = List<Widget>();
  list.add(headerDrawer());
  for (Map it in listMenuOpcionDrawer) {
    list.add(menuDrawerItem(context, it));
  }
  return list;
}

Widget headerDrawer() {
  return DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.orange,
    ),
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            CircleAvatar(
              radius: 34.0,
              backgroundColor: Colors.white,
              child: Center(
                  child: Text(
                'RA',
                style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600),
              )),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tecnico Informatica',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
              
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Robert Alvarez',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'BITS (Soluciones Tecnologicas)',
              style: TextStyle(color: Colors.white, fontSize: 11),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget menuDrawerItem(BuildContext context, Map item) {
  return ListTile(
    leading: getIconDrawer(item['icon']),
    title: Text(item['title'],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey
        )),
    onTap: () {},
  );
}