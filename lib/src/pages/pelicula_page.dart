import 'package:flutter/material.dart';
import 'package:flutter_prueba/src/pages/peliculas_provider.dart';
import 'package:flutter_prueba/src/pages/widgets/movie_horizontal.dart';

class PeliculaPage extends StatefulWidget {
  PeliculaPage({Key key}) : super(key: key);

  @override
  _PeliculaPageState createState() => _PeliculaPageState();
}

class _PeliculaPageState extends State<PeliculaPage> {
  PeliculasProvider peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas"),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
              future: peliculasProvider.getEnCines(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                print("PELICULAS ${snapshot.data}");
                if (snapshot.hasData) {
                  return MovieHorizontal(peliculas: snapshot.data);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
