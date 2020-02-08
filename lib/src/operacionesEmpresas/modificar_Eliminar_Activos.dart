import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';
import '../empresa/empresa.dart';
import '../recurso/info_pc.dart';

final _itemImage = [
  {
    'cabecera': 'Configuracion PC',
    'img': 'img/Computer.png',
    'info': 'Windows 10',
    'detalle': 'Optiplex 780 SFF'
  },
  {
    'cabecera': 'AnyDesk',
    'img': 'img/AnyDesk.png',
    'info': 'Registrado',
    'detalle': 'Id 985 339 887',
  },
  {
    'cabecera': 'Remote Desktop',
    'img': 'img/remoteDesktop.png',
    'info': 'Sin Registrar',
    'detalle': ''
  },
  {
    'cabecera': 'Configuracion de Red',
    'img': 'img/ethernet.png',
    'info': 'Ip 10.0.0.5',
    'detalle': ''
  },
  {
    'cabecera': 'TeamViewer',
    'img': 'img/teamViewer.png',
    'info': 'Registrado',
    'detalle': '1 203 699 888'
  }
];

String imgRecurso = '';
String cabRecurso = '';

class OperacionEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            stops: [
              0.025,
              0.7,
              0.8,
            ],
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.9),
              Colors.white.withOpacity(0.8),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, _size.height * 0.09),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 12.0),
                child: Container(
                  height: 100,
                  child: Image.asset(
                    logo,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Recursos $activo',
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9.0,
            ),
            Divider(
              height: 1,
              thickness: 1.5,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                children: _itemImage
                    .map(
                      (item) => MaterialButton(
                        onPressed: () {
                          cabRecurso = item['cabecera'];
                          print(item);
                          imgRecurso = item['img'];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoPC()));
                        },
                        padding: EdgeInsets.all(0),
                        child: Container(
                            height: 180,
                            width: 180,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)),
                              elevation: 16,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        item['img'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: Text(
                                          item['info'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.blueGrey,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: Text(
                                          item['detalle'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
