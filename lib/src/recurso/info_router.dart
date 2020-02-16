import 'package:flutter/material.dart';
import '../empresa/empresa.dart';

final _tableData = [
  {
    {
      'dato': 'marca y modelo',
      'valor' : 'TP-Link gc336'
    },
    {
      'dato': 'usuario',
      'valor': 'admin',
    },
    {
      'dato': 'password',
      'valor': 'admin',
    },
    {
      'dato': 'ip',
      'valor': '10.0.0.230',
    },
  }
];

class InfoRouter extends StatelessWidget {
  const InfoRouter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Image.asset('img/router.jpg'),
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Divider(
                    thickness: 1.5,
                    endIndent: 100,
                    indent: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 35),
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
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _tableData[0]
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
                    children: _tableData[0]
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
                                  labelText: datos['dato'],
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
                    padding: const EdgeInsets.only(bottom: 20),
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