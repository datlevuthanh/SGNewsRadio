

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'package:flutter/foundation.dart';
import 'Custom_widget.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
   ChangeNotifierProvider(
     create: (context)=> app_State(),
     child: MyApp(),
   )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class app_State with ChangeNotifier{
   static bool is_dark_mode_on = false;

  void changemode(){
    is_dark_mode_on =! is_dark_mode_on;
    print(is_dark_mode_on);
    notifyListeners();
  }
   bool _isDarkModeOn = false;
   bool get isDarkModeOn => _isDarkModeOn;

  void toggleDarkMode(){
    _isDarkModeOn != _isDarkModeOn;
    print(_isDarkModeOn);
    notifyListeners();
  }

   static bool isPlaying = false ;
   Duration duration = Duration.zero;
   Duration position = Duration.zero;
   late AudioPlayer audioPlayer;



   void AudioPlayerModel(){
     //super.initState();
     //isPlaying = true;
     audioPlayer = AudioPlayer()..setSourceAsset('TuTuongHoChiMinhDoHuuVi2882700.mp3');
     audioPlayer.play(AssetSource('TuTuongHoChiMinhDoHuuVi2882700.mp3'));
     //listen to playing,pause,stop
     audioPlayer.onPlayerStateChanged.listen((state) {
         isPlaying = state == PlayerState.playing;
         notifyListeners();
     });
     //listen to audio duration
     audioPlayer.onDurationChanged.listen((newDuration) {
         duration = newDuration;
         notifyListeners();
     });
     //listen to audio Position
     audioPlayer.onPositionChanged.listen((newPosition) {
         position = newPosition;
          notifyListeners();
     });
   }

   void playPause() async {
     print(isPlaying);
     if (isPlaying) {
       await audioPlayer.pause();
       //isPlaying = false;
     } else {
       await audioPlayer.play(AssetSource('TuTuongHoChiMinhDoHuuVi2882700.mp3'));
      // await audioPlayer.resume();
       //isPlaying = true;
     }
     notifyListeners();
   }

   String formatTime(Duration duration) {
     String twoDigit(int n) => n.toString().padLeft(2, '0');
     final hour = twoDigit(duration.inHours);
     final minute = twoDigit(duration.inMinutes.remainder(60));
     final second = twoDigit(duration.inSeconds.remainder(60));
     return [
       if (duration.inHours > 0) hour,
       minute,
       second,
     ].join(':');
   }
}


