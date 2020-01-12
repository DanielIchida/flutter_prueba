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
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.redAccent,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              button: TextStyle(
                  color: Colors.white
              )
          ),
          appBarTheme: AppBarTheme(
             textTheme: ThemeData.light().textTheme.copyWith(
                 title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                 )
             )
          )
      ),
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
