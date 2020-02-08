import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../empresa/empresa.dart';
import '../dashboard.dart';

int _taglogo;
String _titulo;

Widget headerDrawer() {
  return DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.orange,
    ),
    child: Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.blue,
          child: Center(
              child: Text(
            'RA',
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
        ),
        Spacer(),
        Column(
          children: <Widget>[
            Text(
              'Tecnico Informatica',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Robert Alvarez',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'BITS (Soluciones Tecnologicas)',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget menuDrawerItem(BuildContext context, Map item) {
  return ListTile(
    //leading: getIcon(stringIcon),
    title: Text(item['title'],
        style: GoogleFonts.firaSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
    //subtitle: Text(item['subtitle']),
    onTap: () {},
  );
}

Widget imageEmpresa() {
  return Container(
    padding: EdgeInsets.only(
      right: 10,
    ),
    width: 140,
    height: 91,
    child: Image.asset(
      listMenuEmpresas[_taglogo]['logo'],
      fit: BoxFit.cover,
    ),
  );
}
