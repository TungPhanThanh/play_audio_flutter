import 'package:flutter/material.dart';
import 'package:flutter_music/src/home/widgets/itemalbums.dart';
import 'package:flutter_music/src/home/widgets/listtrack.dart';
import 'package:flutter_music/src/home/widgets/searchbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildNews() {
    return ListView(
      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.only(left: 28, right: 28, top: 0, bottom: 22),
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "TOP 100",
//                style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.w900,
//                ),
//              ),
//              new GestureDetector(
//                onTap: () => Navigator.of(context).pushNamed("/pokedex"),
//                child: new Text(
//                  "View All",
//                  style: TextStyle(
//                    fontSize: 14,
//                    fontWeight: FontWeight.w500,
//                    color: Colors.indigo,
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
        TrackList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            children: <Widget>[
              SizedBox(height: 30.0),
              SearchBar(), //search bar
              SizedBox(height: 30.0),
              Text(
                'Playlists',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0),
              ), //playlist name
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  ItemCard('assets/images/relaxing.jpg', 'Relaxing'),
                  SizedBox(
                    width: 16.0,
                  ),
                  ItemCard('assets/images/gaming.jpg', 'Gaming'),
                ],
              ), //playlist
              Row(
                children: <Widget>[
                  ItemCard('assets/images/genres_adventure.jpg', 'R&B'),
                  SizedBox(
                    width: 16.0,
                  ),
                  ItemCard('assets/images/ambient.jpg', 'Korean'),
                ],
              ), //playlist
              SizedBox(
                height: 32.0,
              ),
              Text(
                'Recommend',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 38.0),
              ), //Recommend name
              SizedBox(height: 16.0),
              TrackList(),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
