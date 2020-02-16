import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../recursosActivos/recursos_activos.dart';
import '../empresa/empresa.dart';

final tableDAta = [
  {
    {'text': 'Sistema Operativo', 'valor': 'Windows 10'},
    {'text': 'Marca', 'valor': 'Optiplex 780 SFF'},
    {'text': 'Procesador', 'valor': 'i5 8va Gen, 2.20 ghz'},
    {'text': 'Memoria RAM', 'valor': '16 GB RAM DDR4 2100 Mhz'},
    {'text': 'Disco Duro', 'valor': '500 GB Disco Duro, 7200 RPM'},
  },
  {
    {'text': 'ID', 'valor': '985 339 887'},
    {'text': 'Contraseña', 'valor': 'BITS.b1ts'},
    {'text': 'Presencial', 'valor': 'SI'},
  },
  {
    {'text': 'Conexion', 'valor': ' Sin registrar'},
    {'text': 'Usuario', 'valor': '-'},
    {'text': 'Password', 'valor': '-'}
  },
  {
    {'text': 'IP', 'valor': '10.0.0.5'},
    {'text': 'Mascara de Subred', 'valor': '255.255.255.0'},
    {'text': 'Puerta de enlace', 'valor': '10.0.0.1'}
  },
  {
    {'text': 'ID', 'valor': '1 203 699 888'},
    {'text': 'Contraseña', 'valor': 'BITS.b1ts'},
    {'text': 'Presencial', 'valor': 'SI'},
  },
];

class InfoPC extends StatelessWidget {
  const InfoPC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context);
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
          resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              activo,
              style: TextStyle(
                  color: Colors.orange.shade800,
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
              ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    thickness: 1.5,
                    endIndent: 100,
                    indent: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 15, bottom: 25),
                    child: Text(
                      cabRecurso['cabecera'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange.shade800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Informacion',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      elevation: 5.0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        //title: Text(cabRecurso['info']),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: tableDAta[index]
                              .map((valor) => Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.remove_circle,
                                          color: Colors.orange.shade800,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            valor['valor'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35, bottom: 10),
                    child: Text('Datos',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ),
                  Column(
                    // itemExtent: 70,
                    // padding: EdgeInsets.only(bottom: 80.0),
                    // scrollDirection: Axis.vertical,
                    children: tableDAta[index]
                        .map(
                          (datos) => Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, bottom: 30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(2, 10),
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                onTap: () {},
                                decoration: InputDecoration(
                                  labelText: datos['text'],
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,      
                      children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 8,
                          onPressed: () {},
                          color: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Guardar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 8,
                          onPressed: () {},
                          color: Colors.blueGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
