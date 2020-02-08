import 'package:flutter/material.dart';
import '../operacionesEmpresas/modificar_Eliminar_Activos.dart';


final tableDAta = [
  {'ID':'1203699888' , 'CONTRASEÑA': 'BITS.b1ts', 'PRESENCIAL':'SI'}
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
            cabRecurso.toUpperCase(),
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 23.5,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.9),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              thickness: 1.5,
              endIndent: 100,
              indent: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 24, bottom: 5.0),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 10),
                      child: Text(
                        'Editar',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [
                DataColumn(label: null)
              ], rows: [])
            ),
          ],
        ),
      ),
    );
  }
}
