import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class EventPlayer extends StatefulWidget {
  final String mediaUrl;

  const EventPlayer({
    Key? key,
    required this.mediaUrl,
  }) : super(key: key);

  @override
  State<EventPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<EventPlayer> {
  late VlcPlayerController _videoPlayerController;
  var _isVideoPlayer = false;

  @override
  void initState() {
    super.initState();

    //initializePlayer("https://media.w3.org/2010/05/sintel/trailer.mp4");
    _videoPlayerController = VlcPlayerController.network(
      widget.mediaUrl,
      hwAcc: HwAcc.auto,
      autoPlay: true,
    );
    _isVideoPlayer = true;
  }

  @override
  void dispose() {
    disposevideoPlayerController();

    super.dispose();
  }

  void disposevideoPlayerController() async {
    print("disposevideoPlayerController _isVideoPlayer: ${_isVideoPlayer}");
    if (_isVideoPlayer) {
      await _videoPlayerController.stopRendererScanning();
      await _videoPlayerController.dispose();

      _isVideoPlayer = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / (16 / 9),
          child: VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _videoPlayerController.play();
              },
              //color: _iconColor,
              //iconSize: _playButtonIconSize,
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                _videoPlayerController.pause();
              },
              //color: _iconColor,
              //iconSize: _playButtonIconSize,
              icon: const Icon(Icons.pause),
            ),
            IconButton(
              onPressed: () {
                _videoPlayerController.stop();
              },
              //color: _iconColor,
              //iconSize: _playButtonIconSize,
              icon: const Icon(Icons.stop),
            ),
          ],
        ),
      ],
    );
  }
}
