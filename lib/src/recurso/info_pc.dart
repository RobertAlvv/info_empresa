import 'package:flutter/material.dart';
import '../operacionesEmpresas/modificar_Eliminar_Activos.dart';
import '../empresa/empresa.dart';

final tableDAta = [
  {
    {'text': 'Sistema Operativo', 'valor': 'Windows 10'},
    {'text': 'Marca', 'valor': 'Optiplex 780 SFF'},
    {'text': 'Procesador', 'valor': 'i5 8va Gen, 2.20 ghz'},
    {'text': 'Memoria RAM', 'valor': '16 GB RAM DDR4 2100 Mhz'},
    {'text': 'Disco Duro', 'valor': '500 GB Disco Duro, 7200 RPM'},
  }
];

class InfoPC extends StatelessWidget {
  const InfoPC({Key key}) : super(key: key);

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
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              activo,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Image.asset(
                  imgRecurso,
                  fit: BoxFit.contain,
                ),
              )
            ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    thickness: 1.5,
                    endIndent: 100,
                    indent: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Text(
                      cabRecurso['cabecera'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Row(
                      children: <Widget>[
                        Text('Informacion'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0, bottom: 50.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      elevation: 5.0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(25),
                        title: Text(cabRecurso['info']),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: tableDAta[0]
                              .map((valor) => Text(valor['valor']))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35, bottom: 10),
                    child: Text('Datos'),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(top: 5, bottom: 80.0),
                      scrollDirection: Axis.vertical,
                      children: tableDAta[0]
                          .map(
                            (datos) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    labelText: datos['text'],
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                left: 70,
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 15,
                      onPressed: () {},
                      color: Colors.orange.shade800,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Guardar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 15,
                      onPressed: () {},
                      color: Colors.orange.shade800,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
