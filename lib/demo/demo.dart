import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../main.dart';





class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioPlayerModel(),
      child: AudioPlayerScreenContent(),
    );
  }
}

class AudioPlayerScreenContent extends StatefulWidget {
  @override
  _AudioPlayerScreenContentState createState() => _AudioPlayerScreenContentState();
}

class _AudioPlayerScreenContentState extends State<AudioPlayerScreenContent> {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<app_State>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Slider(
                max: audioPlayerModel.duration.inSeconds.toDouble(),
                min: 0,
                value: audioPlayerModel.position.inSeconds.toDouble(),
                onChanged: (value) async {
                  print("slider: $value");
                  final newPosition = Duration(seconds: value.toInt());
                  await audioPlayerModel.audioPlayer.seek(newPosition);
                  await audioPlayerModel.audioPlayer.resume();
                  audioPlayerModel.position = newPosition;
                  // notifyListeners() is not needed here because position is already updated in the model
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(audioPlayerModel.formatTime(audioPlayerModel.position)),
                  Text(audioPlayerModel.formatTime(audioPlayerModel.duration - audioPlayerModel.position)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(audioPlayerModel.isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 50,
              onPressed: () async {
                audioPlayerModel.playPause();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
