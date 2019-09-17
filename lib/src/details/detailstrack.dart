import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/src/model/track.dart';

class DetailedScreen extends StatefulWidget {
  final Track track;


  const DetailedScreen({Key key, this.track}) : super(key: key);

  @override
  _DetailedScreen createState() => new _DetailedScreen(track.title, track.artist, track.image, track.audio);
}

class _DetailedScreen extends State<DetailedScreen> {
  final title;
  final artist;
  final image;
  final audio;
  int _count = 1;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  AudioPlayerState playerState;

  _DetailedScreen(this.title, this.artist, this.image, this.audio);

  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    advancedPlayer.stop();
    super.dispose();
  }

  void initPlayer(){
    playerState = AudioPlayerState.STOPPED;
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    // ignore: deprecated_member_use
    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    // ignore: deprecated_member_use
    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    var blueColor = Color(0xFF090e42);
    var pinkColor = Color(0xFFff6b80);

    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        children: <Widget>[
          Container(
            height: 450.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [blueColor.withOpacity(0.4), blueColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              )),
                          Column(
                            children: <Widget>[
                              Text(
                                'PLAYLIST',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                              Text('Best Vibes of the Week',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Spacer(),
                      Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        artist,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 42.0),
          Slider(
            onChanged: (double value) {},
            value: 0.0,
            activeColor: pinkColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '0:00',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text('-03:56',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.repeat,
                color: Colors.white,
              ),
              SizedBox(width: 30.0),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                  size: 42.0,
                ),
              ),
              SizedBox(width: 32.0),
              Container(
                  decoration: BoxDecoration(
                      color: pinkColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => audioCache.play(audio),
                      child: Icon(
                        Icons.play_arrow,
                        size: 58.0,
                        color: Colors.white,
                      ),
                    ),
                  )),
              SizedBox(width: 32.0),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                  size: 42.0,
                ),
              ),
              SizedBox(width: 30.0),
              Icon(
                Icons.shuffle,
                color: Colors.white,
              )
            ],
          ),
          Spacer(),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
