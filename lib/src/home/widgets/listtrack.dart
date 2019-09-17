import 'package:flutter/material.dart';
import 'package:flutter_music/src/data/tracksdata.dart';
import 'package:flutter_music/src/details/detailstrack.dart';
import 'package:flutter_music/src/widget/trackwidget.dart';

class TrackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: tracks.length,
      separatorBuilder: (context, index) => Divider(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => TrackWidget(
        tracks[index],
        onPress: () => Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen())),
      ),
    );
  }
}
