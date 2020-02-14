import 'package:flutter/material.dart';
import 'providers/providers.dart';
import '../empresa/empresa.dart';

final listMenuEmpresas = [
  {
    'title': 'Super Central',
    'subtitle': 'Super Central',
    'logo': 'img/central1.png',
    'taglogo': '1',
  },
  {
    'title': 'Plaza Venezuela',
    'subtitle': 'Plaza Venezuela',
    'logo': 'img/superplaza.jpeg',
    'taglogo': '2',
  },
  {
    'title': 'BEIA',
    'subtitle': 'Los Jardines',
    'logo': 'img/beia.png',
    'taglogo': '3',
  },
  {
    'title': 'BEIA',
    'subtitle': 'Express',
    'logo': 'img/beia.png',
    'taglogo': '4',
  },
  {
    'title': 'BEIA',
    'subtitle': 'La Vega',
    'logo': 'img/beia.png',
    'taglogo': '5',
  },
  {
    'title': 'San Luis',
    'subtitle': 'Principal',
    'logo': 'img/sanluis.png',
    'taglogo': '6',
  },
  {
    'title': 'San Luis',
    'subtitle': 'Rafael Vidal',
    'logo': 'img/sanluis.png',
    'taglogo': '7',
  },
  {
    'title': 'San Luis',
    'subtitle': 'Fuente 1',
    'logo': 'img/sanluis.png',
    'taglogo': '8',
  },
  {
    'title': 'San Luis',
    'subtitle': 'Fuente 2',
    'logo': 'img/sanluis.png',
    'taglogo': '9',
  },
  {
    'title': 'San Luis',
    'subtitle': 'Imbert',
    'logo': 'img/sanluis.png',
    'taglogo': '10',
  },
];

String tag;
String logo;

class MyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Image.asset(
                  'img/bits.PNG',
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'ENTIDADES',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.9),
                ),
              )
            ],
          ),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 10.0),
          //     child: Icon(Icons.search),
          //   )
          // ],
        ),
        drawer: Drawer(
          elevation: 1,
          child: ListView(
            children: menuDrawer(context),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: listMenuEmpresas
              .map((empresa) => MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Empresa()));
                      tag = empresa['taglogo'];
                      logo = empresa['logo'];
                    },
                    child: Container(
                      width: 180,
                      height: 170,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: empresa['taglogo'],
                              child: Image.asset(
                                empresa['logo'],
                                height: 120,
                                width: 140,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:10.0),
                                  child: Text(
                                    empresa['subtitle'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.6,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
