import 'package:flutter/material.dart';
import '../../operacionesEmpresas/addActivos.dart';

enum _listver { Detalle, IconosMedianos }
enum _listorden { PorNombre, Secuencia }



Widget _listaVista() {
  return PopupMenuButton(
    onSelected: (_listver result) {},
    icon: Icon(Icons.view_list),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<_listver>>[
      PopupMenuItem<_listver>(
        value: _listver.Detalle,
        child: Text('Detalle'),
      ),
      PopupMenuItem<_listver>(
        value: _listver.IconosMedianos,
        child: Text('Icono Medianos'),
      ),
    ],
  );
}

Widget _ordenVista() {
  return PopupMenuButton(
    onSelected: (_listorden result) {},
    icon: Icon(Icons.arrow_drop_down),
    itemBuilder: (BuildContext context) => <PopupMenuEntry<_listorden>>[
      PopupMenuItem<_listorden>(
        value: _listorden.PorNombre,
        child: Text('Por Nombre'),
      ),
      PopupMenuItem<_listorden>(
        value: _listorden.Secuencia,
        child: Text('Secuencial'),
      ),
    ],
  );
}
