import 'package:flutter/material.dart';
import 'widgets_empresa/search_delegate.dart';
import '../operacionesEmpresas/modificar_Eliminar_Activos.dart';
import '../dashboard/dashboard.dart';

String activo;
String dropdownValue = 'Por Nombre';
IconData dropdownValueIcon = Icons.view_stream;
String valorVista='';
class Empresa extends StatefulWidget {
  @override
  _EmpresaState createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa> {
  int selectedIndex = 0;

  final listContent = [
    [
      {'idcaja': '0', 'descripcion': 'Recepcion'},
      {'idcaja': '1', 'descripcion': 'caja 1'},
      {'idcaja': '2', 'descripcion': 'caja 2'},
      {'idcaja': '3', 'descripcion': 'caja 3'},
      {'idcaja': '4', 'descripcion': 'caja 4'},
      {'idcaja': '5', 'descripcion': 'caja 5'},
      {'idcaja': '6', 'descripcion': 'caja 6'},
      {'idcaja': '7', 'descripcion': 'caja 7'},
      {'idcaja': '8', 'descripcion': 'caja 8'},
      {'idcaja': '9', 'descripcion': 'caja 9'},
      {'idcaja': '10', 'descripcion': 'Delicatense'},
      {'idcaja': '11', 'descripcion': 'Restaurant'},
    ],
    [
      {'idserver': '0', 'descripcion': 'Servidor Principal'},
      {'idserver': '1', 'descripcion': 'Servidor Secundario'},
      {'idserver': '2', 'descripcion': 'Servidor Terciario'},
    ],
    [
      {'idbackup': '0', 'descripcion': 'Backup 1'},
      {'idbackup': '1', 'descripcion': 'Backup 2'},
      {'idbackup': '2', 'descripcion': 'Backup 3'},
    ],
    [
      {'idrouter': '0', 'descripcion': 'Router Primer Nivel'},
      {'idrouter': '1', 'descripcion': 'Router Segundo Nivel'},
      {'idrouter': '2', 'descripcion': 'Router Tercer Nivel'},
    ],
    [
      {'idprinter': '0', 'descripcion': 'Impresora Contabilidad'},
      {'idprinter': '1', 'descripcion': 'Impresora Almacen'},
      {'idprinter': '2', 'descripcion': 'Impresora de Label'},
    ],
  ];

  final List categoriaEmpresa = [
    {'Nombre': 'Cajas', 'list': ''},
    {'Nombre': 'Servidores', 'list': ''},
    {'Nombre': 'Backups', 'list': ''},
    {'Nombre': 'Routers', 'list': ''},
    {'Nombre': 'Impresoras', 'list': ''},
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 65,
                    width: 160,
                    child: _imageEmpresa(),
                  ),
                  _cajaTextoBusqueda(),
                  Container(
                      width: _size.width * 0.98,
                      height: _size.height * 0.06,
                      color: Colors.transparent,
                      child: _headermenu(context)),
                ],
              ),
            ),
            _rowTextOrder(context),
            Container(
              child:
              Expanded(
              child: valorVista.contains('BD') == true ? _listContenidoCuadricular() : _listContenido()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageEmpresa() {
    return Hero(
      tag: tag,
      child: Image.asset(
        logo,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _cajaTextoBusqueda() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 22.0, right: 22.0, bottom: 25.0, top: 15.0),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: TextField(
            onTap: () {
              showSearch(context: context, delegate: Search());
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
              hintText: 'Busca los equipos',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headermenu(context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriaEmpresa.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                _listContenido();
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                categoriaEmpresa[index]['Nombre'].toUpperCase(),
                style: TextStyle(
                  color: index == selectedIndex
                      ? Colors.orange.shade800
                      : Colors.orange.shade300,
                  fontSize: index == selectedIndex ? 20 : 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.9,
                ),
              ),
            ),
          );
        });
  }

  Widget _rowTextOrder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              _comboFiltro(context),
            ],
          ),
          Row(
            children: <Widget>[
              _comboFiltroVista(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //         context, MaterialPageRoute(builder: (context) => AddActivos()));
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.blueGrey,
                  ),
                  iconSize: 32,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _comboFiltro(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 26,
        elevation: 16,
        style: TextStyle(
            fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.w600),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Por Nombre', 'Por Ubicación']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _comboFiltroVista() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: DropdownButton<IconData>(
        icon: Icon(
          dropdownValueIcon,
          color: Colors.blueGrey,
        ),
        iconSize: 26,
        elevation: 16,
        onChanged: (IconData newValue) {
          setState(() {
            dropdownValueIcon = newValue;
            valorVista = dropdownValueIcon.toString();
            print(valorVista);
          });
        },
        items: <IconData>[Icons.view_stream, Icons.widgets]
            .map<DropdownMenuItem<IconData>>((IconData value) {
          return DropdownMenuItem<IconData>(
            value: value,
            child: Icon(
              value,
              color: Colors.blueGrey,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _listContenido() {
    return ListView.builder(
        itemCount: listContent[selectedIndex].length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ListTile(
                    onTap: () {
                      activo = listContent[selectedIndex][index]['descripcion'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OperacionEmpresa()));
                    },
                    leading: Icon(
                      Icons.computer,
                      color: Colors.orange.shade800,
                      size: 45,
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    subtitle: Text(
                        'Ubicacion: Esto es una prueba para ver como se ve este texto en pantalla'),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        listContent[selectedIndex][index]['descripcion']
                            .toUpperCase(),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Icon(Icons.check_circle,
                          color: Colors.green.shade600, size: 30),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _listContenidoCuadricular() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      children: listContent[selectedIndex]
          .map(
            (empresa) => MaterialButton(
              onPressed: () {
                activo = empresa['descripcion'];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OperacionEmpresa()));
              },
              child: Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 12.0, top: 10.0),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green.shade600,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.computer,
                            size: 55,
                            color: Colors.orange.shade800,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                                                      child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 2.0),
                              child: Text(
                                empresa['descripcion'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0, top: 5.0),
                              child: Text(
                                'Ubicacion: Esto es una prueba para ver como se ve este texto en pantalla',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          )
          .toList(),
    );
  }
}