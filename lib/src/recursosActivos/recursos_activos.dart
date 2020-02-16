import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';
import '../empresa/empresa.dart';
import '../recurso/info_pc.dart';

final _itemImage = [
  {
    'tag':'icon0',
    'posicion': '0',
    'cabecera': 'Configuracion PC',
    'img': 'img/Computer.png',
    'info': 'Windows 10',
    'detalle': 'Optiplex 780 SFF'
  },
  {
    'tag':'icon1',
    'posicion': '1',
    'cabecera': 'AnyDesk',
    'img': 'img/AnyDesk.png',
    'info': 'Registrado',
    'detalle': '985 339 887',
  },
  {
    'tag':'icon2',
    'posicion': '2',
    'cabecera': 'Remote Desktop',
    'img': 'img/remoteDesktop.png',
    'info': 'Sin Registrar',
    'detalle': ''
  },
  {
    'tag':'icon3',
    'posicion': '3',
    'cabecera': 'Configuracion de Red',
    'img': 'img/ethernet.png',
    'info': 'Configuracion de Red',
    'detalle': ''
  },
  {
    'tag':'icon4',
    'posicion': '4',
    'cabecera': 'TeamViewer',
    'img': 'img/teamViewer.png',
    'info': 'Registrado',
    'detalle': '1 203 699 888'
  }
];
String tagIcon;
String imgRecurso = '';
Map<String, String> cabRecurso;
int index;

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
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      logo,
                      fit: BoxFit.cover,
                    ),
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
                    fontSize: 18,
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
                padding: EdgeInsets.only(top: 15),
                children: _itemImage
                    .map(
                      (item) => MaterialButton(
                        onPressed: () {
                          tagIcon = item['tag'];
                          index = int.parse(item['posicion']);
                          cabRecurso = item;
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
                                      child: Hero(
                                        tag: item['tag'],
                                        child: Image.asset(
                                          item['img'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 11.0, right: 11),
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
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11.0, bottom: 14),
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
