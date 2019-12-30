import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/home_page.dart';
import 'package:flutter_prueba/src/pages/camera_page.dart';
import 'package:flutter_prueba/src/pages/pelicula_page.dart';
import 'package:flutter_prueba/src/pages/productos_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: 'basicodos',
      routes: {
        'basico': (BuildContext context) => HomePage(),
        'camara': (BuildContext context) => CameraPage(),
        'pelicula': (BuildContext context) => PeliculaPage(),
        'basicodos': (BuildContext context) => ProductosPage()
      },
    );
  }
}
