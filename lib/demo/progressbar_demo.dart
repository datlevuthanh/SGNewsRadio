

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:audioplayers/audioplayers.dart';



class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late AudioPlayer audioPlayer;

  void initState(){
    super.initState();
    audioPlayer = AudioPlayer()..setSourceAsset('TuTuongHoChiMinhDoHuuVi2882700.mp3');
    //listen to playing,pause,stop
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    //listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    //listen to audio Position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }
  @override
  void dispose() {
    audioPlayer.dispose(); // Hãy chắc chắn rằng bạn dispose audio player khi widget được dispose.
    super.dispose();
  }

  String formatTime(Duration duration){
    String twoDigit(int n) => n.toString().padLeft(2,'0');
    final hour = twoDigit(duration.inHours);
    final minute = twoDigit(duration.inMinutes.remainder(60));
    final second = twoDigit(duration.inSeconds.remainder(60));
    return [
      if(duration.inHours>0) hour,minute,second,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Slider(
                  max: duration.inSeconds.toDouble(),
                  min: 0,
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async{
                    print("slider: $value");
                    final newPosition = Duration(seconds: value.toInt());
                    await audioPlayer.seek(newPosition);
                    await audioPlayer.resume();
                    setState(() {
                      position = newPosition;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(isPlaying?Icons.pause:Icons.play_arrow),
              iconSize: 50,
              onPressed: ()async{
                if(isPlaying){
                  await audioPlayer.pause();
                }else{
                  await audioPlayer.resume();
                }
                setState(() {
                  isPlaying =! isPlaying;
                });
              },

            ),

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.pop(context);},//_incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
