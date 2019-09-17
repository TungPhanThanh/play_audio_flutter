import 'package:flutter/material.dart';

class Track {
  const Track({
    @required this.title,
    @required this.image,
    @required this.artist,
    @required this.audio,
  });

  final String artist;
  final String image;
  final String title;
  final String audio;
}