import 'package:antiscam/RewardsPoints.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchAds extends StatefulWidget {
  @override
  _WatchAdsState createState() => _WatchAdsState();
}

class _WatchAdsState extends State<WatchAds> {
  late YoutubePlayerController _controller;
  bool _canClose = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '64zYEwsGhRk',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: true, 
      ),
    )..addListener(_videoListener);
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 30), () {
      setState(() {
        _canClose = true;
      });
    });
  }

  void _videoListener() {
    if (_controller.value.isPlaying) {

      _startTimer();
    } 
  }

  void _showRewardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.monetization_on,
                  size: 64,
                  color: Colors.amber, 
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "You have earned points rewards.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 130,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black, 
                ),
                child: TextButton(
                  onPressed: () {
                    _controller.pause();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RewardsPoints()),
                    );
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: Stack(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onEnded: (_) {
                setState(() {
                  _canClose = true;
                });
              },
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Visibility(
                visible: !_canClose,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], 
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10), 
                  child: Center(
                    child: Text(
                      'Watch ads for 30 seconds',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            if (_canClose)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], 
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(4), 
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black), 
                    onPressed: () {
                      _showRewardDialog();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WatchAds(),
  ));
}
