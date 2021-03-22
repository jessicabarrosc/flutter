import 'package:flutter/material.dart';
import 'package:odonto_app/home.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Mape> fetch(int idApi) async {
  var url = 'http://odontouniara.azurewebsites.net/API/noticias/$idApi';
  var response = await http.get(url);
  // print(response.body);
  var json = jsonDecode(response.body);
  var mape = Mape.fromJson(json);
  if (response.statusCode == 200) {
    return mape;
  } else {
    throw Exception('Falha ao carregar serviço');
  }
}

class Mape {
  final int id;
  final String conteudo;
  final String titulo;
  Mape({this.id, this.conteudo, this.titulo});
  factory Mape.fromJson(Map json) {
    return Mape(
      id: json['ID'],
      conteudo: json['Conteudo'],
      titulo: json['Titulo'],
    );
  }
}

class HigieneBucal extends StatefulWidget {
  @override
  _HigieneBucal createState() => _HigieneBucal();
}

class _HigieneBucal extends State<HigieneBucal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odonto App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Image.asset(
            "assets/logoApp.png",
            height: 50,
            width: 250,
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        body: new ListView(
          children: <Widget>[
            body(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green[400],
          child: Container(
            height: 70.0,
          ),
        ),
      ),
    );
  }

  Widget body() {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: FutureBuilder<Mape>(
        future: fetch(idApi),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Html(
                data: snapshot.data.titulo + "<br>" + snapshot.data.conteudo);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
