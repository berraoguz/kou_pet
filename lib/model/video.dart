import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoData {
  final String videoId;
  final String additionalText;
  final String basliktext;
  final String text;
  bool isTextVisible;
  late YoutubePlayerController controller;

  VideoData({
    required this.videoId,
    required this.additionalText,
    required this.basliktext,
    required this.text,
    this.isTextVisible = false,
  }) {
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
}
