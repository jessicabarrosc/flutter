import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:odonto_app/higieneBucal.dart';

int idApi;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2(), Item3()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
            leading: Container(
                //height: 40,
                //width: 40,
                ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.green[400],
            child: Container(
              height: 50.0,
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),
              Text("Informações e Curiosidades",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
              Padding(padding: EdgeInsets.all(10.0)),
              CarouselSlider(
                options: CarouselOptions(
                  height: 530.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        child: card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index ? Colors.green : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/Dinossauro.jpg",
                  height: 380,
                  fit: BoxFit.fitHeight,
                ),
                const ListTile(
                  title: Text("Higiene Bucal Para Crianças",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                ButtonTheme(
                  minWidth: 140,
                  height: 0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.green[400],
                    child: const Text(
                      'Ler',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HigieneBucal(),
                        ),
                      );
                      idApi = 2;
                      fetch(idApi);
                    },
                  ),
                )
              ],
            ))));
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Center(
                child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/Adolescente.jpg",
                  height: 380,
                  //width: 350,
                  fit: BoxFit.fitHeight,
                ),
                const ListTile(
                  title: Text("Higiene Bucal para Adolescentes",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                ButtonTheme(
                  minWidth: 140,
                  height: 0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.green[400],
                    child: const Text(
                      'Ler',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HigieneBucal(),
                        ),
                      );
                      idApi = 1;
                      fetch(idApi);
                    },
                  ),
                )
              ],
            ))));
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/Boca.jpg",
                  height: 380,
                  fit: BoxFit.fill,
                ),
                const ListTile(
                  title: Text("Piercing Bucal",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                ButtonTheme(
                  minWidth: 140,
                  height: 0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.green[400],
                    child: const Text(
                      'Ler',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HigieneBucal(),
                        ),
                      );
                      idApi = 3;
                      fetch(idApi);
                    },
                  ),
                )
              ],
            ))));
  }
}

/*class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xFF03A9F4),
              Color(0xFF29B6F6),
            ]),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.add,
                size: 70,
              ),
              onPressed: () {},
            )
          ]),
    );
  }
}*/
