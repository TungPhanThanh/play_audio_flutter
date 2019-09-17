import 'package:flutter/material.dart';
import 'package:flutter_music/src/details/detailstrack.dart';
import 'package:flutter_music/src/model/track.dart';

class TrackWidget extends StatelessWidget {
  const TrackWidget(
    this.track, {
    Key key,
    this.onPress,
  }) : super(key: key);

  final Track track;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen(
                      track: track,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      track.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: 80.0,
                    width: 80.0,
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white.withOpacity(0.7),
                      size: 42.0,
                    ))
              ],
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  track.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  track.artist,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 18.0),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
