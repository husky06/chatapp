import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapplication/common/enum/message_enum.dart';
import 'package:chatapplication/features/chat/widgets/video_player_item.dart';
import 'package:flutter/material.dart';

class DisplayTextImageGIF extends StatelessWidget {
  final String message;
  final MessageEnum type;

  const DisplayTextImageGIF({super.key,
      required this.message,
      required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // bool isPlaying = false;
    // final AudioPlayer audioPlayer = AudioPlayer();

    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.video
        ? VideoPlayerItem(
          videoUrl: message)
        : CachedNetworkImage(
          imageUrl: message
        );
}
}