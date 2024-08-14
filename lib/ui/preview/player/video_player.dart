import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class VideoPlayer extends StatefulWidget {
  final String mediaUrl;
  final bool autoPlay;
  final bool isModalDialog;

  const VideoPlayer({
    Key? key,
    required this.mediaUrl,
    required this.autoPlay,
    required this.isModalDialog,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VlcPlayerController _videoPlayerController;
  var _isPlaying = true;

  @override
  void initState() {
    super.initState();

    //initializePlayer("https://media.w3.org/2010/05/sintel/trailer.mp4");
    initializePlayer(widget.mediaUrl);
  }

  @override
  void dispose() {
    disposevideoPlayerController();

    super.dispose();
  }

  void disposevideoPlayerController() async {
    //_videoPlayerController.removeListener(updateSeeker);
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  void initializePlayer(String dataSource) {
    _videoPlayerController = VlcPlayerController.network(
      dataSource,
      hwAcc: HwAcc.auto,
      autoPlay: widget.autoPlay,
      //autoPlay: false,
      //options: VlcPlayerOptions(),
    );

    //_videoPlayerController.addListener(updateSeeker);
  }

  Future<void> updateSeeker() async {
    final isPlaying = await _videoPlayerController.isPlaying();
    if (isPlaying != null) {
      setState(() {
        _isPlaying = isPlaying;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).size.width / (16 / 9) / 2 - 24;
    if (widget.isModalDialog) top -= 20; // TBD

    var left = MediaQuery.of(context).size.width / 2 - 24;
    if (widget.isModalDialog) left -= 60; // TBD

    return SizedBox(
        height: MediaQuery.of(context).size.width / (16 / 9),
        child: Stack(children: [
          VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top: top,
            left: left,
            child: PlayControl(
              isPlaying: _isPlaying,
              onPause: () {
                //_videoPlayerController.pause();
                _videoPlayerController.stop();
                setState(() {
                  _isPlaying = false;
                });
              },
              onPlay: () {
                _videoPlayerController.play();
                setState(() {
                  _isPlaying = true;
                });
              },
            ),
          )
        ]));
  }
}

class PlayControl extends StatelessWidget {
  const PlayControl({
    super.key,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
  });

  final bool isPlaying;
  final void Function() onPlay;
  final void Function() onPause;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PointerInterceptor(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(48, 48),
              minimumSize: Size(48, 48),
              side: BorderSide.none,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0.1),
              padding: EdgeInsets.zero,
            ),
            child: Center(
                child: (isPlaying == true)
                    ? Icon(Icons.stop_outlined, color: Colors.red, size: 48)
                    : Icon(Icons.play_arrow_outlined,
                        color: Colors.red, size: 48)),
            onPressed: () {
              if (isPlaying == true) {
                onPause();
              } else {
                onPlay();
              }
            },
          ),
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
