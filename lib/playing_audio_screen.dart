 import 'package:flutter/material.dart';
 import 'package:flutter_svg/flutter_svg.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgnradiooo/main.dart';
import 'package:sgnradiooo/demo/progressbar_demo.dart';
 import 'Custom_widget.dart';
 import 'package:audioplayers/audioplayers.dart';

class playing_audio_screen extends StatefulWidget{


  @override
  _playingScreen createState() => _playingScreen();
}



class _playingScreen extends State<playing_audio_screen>{
  void initState(){

   // app_State().audioPlayer = AudioPlayer()..setSourceAsset('TuTuongHoChiMinhDoHuuVi2882700.mp3');
    //app_State().audioPlayer.play(AssetSource('TuTuongHoChiMinhDoHuuVi2882700.mp3'));
  }
/*
  late bool isPlaying ;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late AudioPlayer audioPlayer;

  void initState(){
    super.initState();
    isPlaying = true;
    audioPlayer = AudioPlayer()..setSourceAsset('TuTuongHoChiMinhDoHuuVi2882700.mp3');
    audioPlayer.play(AssetSource('TuTuongHoChiMinhDoHuuVi2882700.mp3'));
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

  String formatTime(Duration duration){
    String twoDigit(int n) => n.toString().padLeft(2,'0');
    final hour = twoDigit(duration.inHours);
    final minute = twoDigit(duration.inMinutes.remainder(60));
    final second = twoDigit(duration.inSeconds.remainder(60));
    return [
      if(duration.inHours>0) hour,minute,second,
    ].join(':');
  }*/
  @override
  Widget build(BuildContext context) {
    bool isDarkModeOn = Provider.of<app_State>(context).isDarkModeOn;
    double screenWidth = MediaQuery.of(context).size.width;
    Color black_white = app_State.is_dark_mode_on?Colors.white:Colors.black;
    final audioPlayerModel = Provider.of<app_State>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context)=> app_State(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: app_State.is_dark_mode_on?Colors.black87:Colors.white),
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(app_State.is_dark_mode_on?Color.fromRGBO(153,153,153,1):Color.fromRGBO(0,0,0,1),BlendMode.srcIn),
                child: SvgPicture.string(
                      fit: BoxFit.fitHeight ,
                    '<svg class="artwork-fallback" preserveAspectRatio="xMinYMin slice" viewBox="0 0 1600 1200" xmlns="http://www.w3.org/2000/svg"><rect opacity="0.3" width="1600" height="1200"></rect><g clip-path="url(#a)" fill-rule="evenodd" clip-rule="evenodd"><path opacity="0.2" d="M143.091 223.179c-2.812-9.035 2.233-18.639 11.268-21.451l294.471-91.637c9.036-2.812 18.639 2.233 21.451 11.268l66.183 212.674c2.811 9.035-2.234 18.639-11.269 21.45l-40.899 12.728-212.673 66.182-40.899 12.728c-9.035 2.811-18.639-2.234-21.45-11.269l-66.183-212.673Zm134.166 200.489 196.314-61.092-11.455-36.808a4.284 4.284 0 0 0-5.362-2.818L268.62 381.497a4.283 4.283 0 0 0-2.818 5.362l11.455 36.809Zm204.494-63.637-11.455-36.809c-2.109-6.776-9.311-10.56-16.088-8.451l-188.134 58.546c-6.776 2.109-10.56 9.311-8.451 16.088l11.454 36.809-40.898 12.727a8.568 8.568 0 0 1-10.726-5.634l-66.182-212.674a8.566 8.566 0 0 1 5.634-10.725l294.471-91.637a8.566 8.566 0 0 1 10.725 5.634l66.183 212.673a8.568 8.568 0 0 1-5.634 10.726l-40.899 12.727ZM247.068 240.167c-22.587 7.029-35.2 31.039-28.171 53.626 7.029 22.588 31.038 35.201 53.626 28.172 22.588-7.03 35.201-31.039 28.172-53.627-7.03-22.587-31.039-35.2-53.627-28.171Zm-36.351 56.172c-8.435-27.106 6.701-55.917 33.806-64.352 27.105-8.435 55.916 6.701 64.351 33.806 8.435 27.105-6.7 55.916-33.805 64.351-27.106 8.435-55.917-6.7-64.352-33.805Zm155.416-48.364c-7.03-22.588 5.583-46.597 28.171-53.627 22.588-7.029 46.597 5.584 53.626 28.172 7.029 22.587-5.584 46.597-28.171 53.626-22.588 7.029-46.597-5.584-53.626-28.171Zm25.625-61.806c-27.105 8.435-42.24 37.246-33.805 64.351 8.435 27.105 37.246 42.241 64.351 33.806 27.105-8.435 42.241-37.247 33.806-64.352-8.435-27.105-37.246-42.24-64.352-33.805Zm-55.985 21.908-32.719 10.182a4.283 4.283 0 1 0 2.545 8.18l32.719-10.182a4.283 4.283 0 0 0-2.545-8.18Z"></path><path opacity="0.3" d="M1024.92-24.18c2.24-6.528 9.35-10 15.88-7.755l212.78 73.18c6.53 2.244 10 9.357 7.76 15.886l-52.86 153.671c-2.24 6.529-9.35 10.001-15.88 7.756l-212.779-73.179c-6.529-2.245-10.001-9.358-7.756-15.886l52.855-153.672Zm13.85-1.844a6.247 6.247 0 0 0-7.94 3.878l-52.854 153.672a6.25 6.25 0 0 0 3.878 7.943l29.556 10.164 9.14-26.598c1.69-4.896 7.02-7.5 11.92-5.816l135.94 46.753c4.9 1.684 7.5 7.018 5.82 11.915l-9.15 26.597 29.55 10.163a6.247 6.247 0 0 0 7.94-3.877l52.85-153.672a6.244 6.244 0 0 0-3.87-7.944l-212.78-73.178Zm39.98 56.713c-16.32-5.614-34.1 3.067-39.71 19.388-5.62 16.321 3.06 34.103 19.38 39.716 16.33 5.613 34.11-3.067 39.72-19.389 5.61-16.32-3.07-34.102-19.39-39.715Zm-45.62 17.355c6.73-19.585 28.07-30.002 47.65-23.266 19.59 6.736 30.01 28.074 23.27 47.66-6.74 19.585-28.07 30.001-47.66 23.266-19.58-6.736-30-28.074-23.26-47.66Zm112.29 38.622c5.62-16.321 23.4-25.002 39.72-19.388 16.32 5.613 25 23.394 19.39 39.716-5.61 16.321-23.4 25.002-39.72 19.388-16.32-5.613-25-23.394-19.39-39.716Zm41.75-25.299c-19.58-6.736-40.92 3.681-47.66 23.267-6.73 19.585 3.68 40.923 23.27 47.659 19.59 6.736 40.92-3.681 47.66-23.267 6.74-19.585-3.68-40.923-23.27-47.659Zm-42.39-11.274-23.64-8.13a3.124 3.124 0 1 0-2.03 5.91l23.64 8.13a3.124 3.124 0 0 0 3.97-1.938 3.12 3.12 0 0 0-1.94-3.972Zm-118.32 74.975a3.135 3.135 0 0 1 3.98-1.939l135.94 46.753c1.63.562 2.5 2.34 1.93 3.972l-9.14 26.597-141.85-48.786 9.14-26.597Z"></path><path opacity="0.2" d="M857.117 429.032c-1.169-5.348 2.218-10.631 7.566-11.8l174.287-38.114a9.91 9.91 0 0 1 11.8 7.565l27.53 125.874c1.17 5.348-2.22 10.631-7.57 11.8l-174.285 38.115c-5.348 1.169-10.631-2.218-11.8-7.566l-27.528-125.874Zm8.624-6.959a4.956 4.956 0 0 0-3.782 5.9l27.527 125.875a4.955 4.955 0 0 0 5.9 3.782l24.207-5.293-4.765-21.786a7.435 7.435 0 0 1 5.674-8.851l111.348-24.35c4.01-.878 7.98 1.663 8.85 5.673l4.77 21.787 24.2-5.294a4.96 4.96 0 0 0 3.79-5.9l-27.53-125.875a4.96 4.96 0 0 0-5.9-3.782l-174.289 38.114Zm50.454 21.94c-13.369 2.924-21.836 16.132-18.913 29.5 2.924 13.369 16.131 21.837 29.5 18.913 13.369-2.923 21.837-16.131 18.913-29.5-2.923-13.369-16.131-21.836-29.5-18.913Zm-23.754 30.559c-3.509-16.043 6.653-31.892 22.695-35.4 16.043-3.508 31.892 6.653 35.401 22.695 3.508 16.043-6.653 31.892-22.696 35.401-16.043 3.508-31.892-6.653-35.4-22.696Zm91.985-20.116c-2.924-13.369 5.544-26.577 18.914-29.5 13.37-2.924 26.58 5.544 29.5 18.913 2.92 13.369-5.54 26.576-18.91 29.5-13.37 2.924-26.58-5.544-29.504-18.913Zm17.854-34.341c-16.042 3.508-26.204 19.357-22.695 35.4 3.508 16.043 19.357 26.204 35.405 22.695 16.04-3.508 26.2-19.357 22.69-35.4-3.51-16.043-19.36-26.204-35.4-22.695Zm-33.36 9.831-19.365 4.235a2.477 2.477 0 1 0 1.059 4.842l19.365-4.235a2.477 2.477 0 1 0-1.059-4.842Zm-49.25 99.546a2.477 2.477 0 0 1 1.891-2.95l111.349-24.351a2.475 2.475 0 0 1 2.95 1.891l4.77 21.786-116.196 25.41-4.764-21.786Z"></path><path opacity="0.2" d="M-52.632 589.269c.922-6.224 6.714-10.522 12.938-9.6l202.834 30.044c6.224.922 10.522 6.715 9.6 12.938l-21.699 146.492c-.922 6.224-6.714 10.521-12.938 9.6l-202.834-30.045c-6.224-.922-10.522-6.714-9.6-12.938l21.699-146.491Zm12.103-3.966a5.697 5.697 0 0 0-6.469 4.8l-21.699 146.492a5.696 5.696 0 0 0 4.8 6.469l28.172 4.173 3.755-25.355a8.543 8.543 0 0 1 9.704-7.199l129.589 19.195a8.543 8.543 0 0 1 7.199 9.703l-3.755 25.354 28.171 4.173a5.696 5.696 0 0 0 6.469-4.8l21.699-146.491a5.696 5.696 0 0 0-4.8-6.469l-202.835-30.045Zm45.284 44.135c-15.559-2.305-30.04 8.439-32.344 23.998-2.305 15.559 8.44 30.04 23.998 32.345 15.559 2.304 30.04-8.44 32.345-23.999 2.304-15.559-8.44-30.04-23.999-32.344Zm-37.979 23.164c2.766-18.671 20.143-31.564 38.814-28.799 18.67 2.766 31.564 20.143 28.798 38.813-2.765 18.671-20.143 31.564-38.813 28.799-18.67-2.766-31.564-20.143-28.799-38.813Zm107.052 15.856c2.305-15.559 16.786-26.303 32.345-23.999 15.558 2.305 26.303 16.786 23.998 32.345-2.304 15.558-16.785 26.303-32.344 23.998-15.559-2.304-26.303-16.785-23.999-32.344Zm33.179-29.633c-18.67-2.765-36.047 10.128-38.813 28.799-2.766 18.67 10.128 36.047 28.798 38.813 18.671 2.765 36.048-10.128 38.814-28.799 2.765-18.67-10.128-36.047-28.799-38.813Zm-39.857-3.024-22.538-3.339a2.848 2.848 0 0 0-.834 5.635l22.537 3.338a2.848 2.848 0 0 0 .835-5.634Zm-93.485 86.916a2.848 2.848 0 0 1 3.234-2.4l129.589 19.195a2.848 2.848 0 0 1 2.4 3.234l-3.756 25.355-135.223-20.03 3.756-25.354ZM417.817 596.911c2.241-10.444 12.525-17.094 22.969-14.853l340.4 73.05c10.445 2.241 17.095 12.525 14.853 22.97l-52.758 245.844c-2.241 10.445-12.525 17.095-22.969 14.853l-340.401-73.05c-10.444-2.241-17.094-12.525-14.853-22.969l52.759-245.845Zm20.94-5.397c-5.222-1.121-10.364 2.204-11.485 7.426l-52.758 245.845c-1.121 5.222 2.204 10.364 7.426 11.485l47.279 10.146 9.131-42.551c1.681-7.833 9.394-12.82 17.227-11.139l217.478 46.671c7.833 1.681 12.821 9.393 11.14 17.227l-9.132 42.55 47.278 10.146c5.222 1.12 10.364-2.205 11.484-7.427l52.759-245.845c1.12-5.222-2.205-10.364-7.427-11.484l-340.4-73.05Zm71.91 79.723c-26.11-5.603-51.82 11.022-57.423 37.133-5.604 26.11 11.021 51.82 37.132 57.423 26.111 5.604 51.82-11.021 57.423-37.132 5.604-26.111-11.021-51.82-37.132-57.424Zm-66.879 35.103c6.724-31.333 37.576-51.282 68.909-44.558 31.333 6.724 51.282 37.575 44.558 68.908-6.724 31.333-37.575 51.283-68.908 44.559-31.333-6.724-51.283-37.576-44.559-68.909Zm179.656 38.554c5.604-26.111 31.313-42.735 57.424-37.132 26.111 5.604 42.735 31.313 37.132 57.424-5.603 26.111-31.313 42.735-57.424 37.132-26.11-5.603-42.735-31.313-37.132-57.424Zm59.453-46.587c-31.333-6.724-62.184 13.225-68.908 44.558-6.724 31.333 13.225 62.184 44.558 68.909 31.333 6.724 62.185-13.226 68.909-44.559 6.724-31.333-13.226-62.184-44.559-68.908Zm-67.203-9.477-37.823-8.116a4.835 4.835 0 1 0-2.029 9.455l37.822 8.117a4.837 4.837 0 0 0 2.03-9.456ZM447.805 825.895a4.837 4.837 0 0 1 5.743-3.714l217.478 46.671a4.835 4.835 0 0 1 3.713 5.742l-9.131 42.55-226.934-48.699 9.131-42.55Z"></path><path opacity="0.3" d="M908.977 959.511c-3.61-12.251 3.395-25.108 15.645-28.718l399.268-117.659c12.25-3.61 25.11 3.394 28.72 15.645l84.98 288.361c3.61 12.25-3.4 25.11-15.65 28.72l-399.27 117.66c-12.25 3.61-25.107-3.4-28.717-15.65l-84.976-288.359Zm18.914-17.627c-6.126 1.805-9.628 8.233-7.823 14.359l84.972 288.357c1.81 6.13 8.24 9.63 14.36 7.83l55.46-16.35-14.71-49.9c-2.71-9.19 2.55-18.84 11.73-21.54l255.09-75.17c9.19-2.71 18.83 2.54 21.54 11.73l14.71 49.91 55.45-16.34c6.13-1.81 9.63-8.24 7.82-14.36l-84.97-288.363c-1.81-6.125-8.23-9.627-14.36-7.822L927.891 941.884Zm121.059 42.675c-30.62 9.025-48.14 41.171-39.11 71.791 9.02 30.63 41.17 48.14 71.79 39.12 30.63-9.03 48.14-41.17 39.12-71.8-9.03-30.625-41.17-48.136-71.8-39.111Zm-50.201 75.061c-10.831-36.75 10.181-75.322 46.931-86.152 36.76-10.83 75.33 10.184 86.16 46.932 10.83 36.76-10.19 75.33-46.94 86.16-36.75 10.83-75.32-10.19-86.151-46.94Zm210.721-62.095c-9.02-30.626 8.49-62.77 39.12-71.796 30.62-9.025 62.77 8.487 71.79 39.113 9.03 30.626-8.48 62.768-39.11 71.798-30.63 9.02-62.77-8.49-71.8-39.115Zm35.85-82.886c-36.75 10.83-57.77 49.403-46.94 86.151 10.83 36.75 49.41 57.77 86.16 46.94 36.75-10.83 57.76-49.405 46.93-86.156-10.83-36.752-49.4-57.766-86.15-46.935Zm-76 28.423-44.37 13.073a5.782 5.782 0 0 0 3.27 11.091l44.37-13.073a5.785 5.785 0 0 0 3.91-7.18c-.91-3.062-4.12-4.814-7.18-3.911Zm-98.08 239.848a5.78 5.78 0 0 1 3.91-7.18l255.09-75.17c3.06-.91 6.28.85 7.18 3.91l14.71 49.91-266.18 78.44-14.71-49.91Z"></path><path opacity="0.2" d="M1455.01 327.394c3-8.502 12.32-12.963 20.82-9.965l277.09 97.725c8.51 2.998 12.97 12.321 9.97 20.823l-70.58 200.122c-3 8.502-12.32 12.963-20.82 9.965l-277.1-97.725c-8.5-2.998-12.96-12.321-9.96-20.823l70.58-200.122Zm18.11-2.268c-4.25-1.499-8.92.732-10.42 4.983l-70.57 200.122a8.16 8.16 0 0 0 4.98 10.411l38.48 13.573 12.22-34.636c2.25-6.377 9.24-9.723 15.62-7.474l177.03 62.435c6.37 2.249 9.72 9.241 7.47 15.618l-12.21 34.636 38.48 13.573a8.161 8.161 0 0 0 10.41-4.983l70.58-200.122a8.16 8.16 0 0 0-4.98-10.411l-277.09-97.725Zm51.63 74.462c-21.26-7.496-44.57 3.657-52.06 24.912-7.5 21.255 3.65 44.562 24.91 52.058 21.25 7.496 44.56-3.658 52.06-24.912 7.49-21.255-3.66-44.562-24.91-52.058Zm-59.76 22.197c9-25.505 36.96-38.889 62.47-29.894 25.51 8.995 38.89 36.964 29.89 62.469-8.99 25.506-36.96 38.89-62.47 29.895-25.5-8.995-38.89-36.964-29.89-62.47Zm146.24 51.577c7.5-21.254 30.81-32.408 52.06-24.912 21.26 7.496 32.41 30.803 24.91 52.058-7.49 21.255-30.8 32.408-52.05 24.912-21.26-7.496-32.41-30.803-24.92-52.058Zm54.78-32.609c-25.51-8.995-53.48 4.389-62.47 29.895-9 25.505 4.39 53.474 29.89 62.469 25.51 8.996 53.48-4.389 62.47-29.894 9-25.506-4.39-53.475-29.89-62.47Zm-55.24-15.154-30.79-10.858a4.078 4.078 0 0 0-5.2 2.491 4.076 4.076 0 0 0 2.49 5.206l30.79 10.858c2.12.75 4.45-.365 5.2-2.491a4.077 4.077 0 0 0-2.49-5.206Zm-155.26 96.694a4.077 4.077 0 0 1 5.2-2.491l177.03 62.435a4.077 4.077 0 0 1 2.49 5.206l-12.21 34.637-184.73-65.15 12.22-34.637Z"></path><path opacity="0.1" d="M102.996 1104.22c-.55-9 6.299-16.74 15.297-17.29L411.565 1069c8.999-.55 16.739 6.29 17.289 15.29l12.95 211.81c.55 9-6.299 16.74-15.297 17.29l-293.272 17.93c-8.999.55-16.739-6.3-17.29-15.3l-12.949-211.8Zm15.795-9.15c-4.499.28-7.924 4.15-7.648 8.65l12.949 211.8c.275 4.5 4.145 7.93 8.644 7.65l40.733-2.49-2.241-36.66c-.412-6.74 4.724-12.55 11.473-12.96l187.368-11.46c6.749-.41 12.554 4.73 12.967 11.47l2.241 36.66 40.732-2.49c4.499-.27 7.923-4.14 7.648-8.64l-12.949-211.81c-.275-4.5-4.145-7.92-8.645-7.65l-293.272 17.93Zm76.556 48.47c-22.496 1.38-39.618 20.73-38.242 43.22 1.375 22.5 20.726 39.62 43.222 38.25 22.496-1.38 39.618-20.73 38.242-43.23-1.375-22.49-20.726-39.61-43.222-38.24Zm-46.389 43.72c-1.65-26.99 18.896-50.21 45.891-51.86 26.995-1.65 50.216 18.89 51.867 45.89 1.65 26.99-18.896 50.21-45.891 51.86-26.995 1.65-50.216-18.89-51.867-45.89Zm154.783-9.46c-1.375-22.5 15.746-41.85 38.242-43.22 22.496-1.38 41.847 15.74 43.223 38.24 1.375 22.49-15.746 41.85-38.242 43.22-22.496 1.38-41.847-15.74-43.223-38.24Zm37.744-51.37c-26.995 1.65-47.541 24.87-45.89 51.87 1.65 26.99 24.872 47.54 51.867 45.89 26.995-1.65 47.541-24.87 45.89-51.87-1.65-26.99-24.872-47.54-51.867-45.89Zm-56.776 7.56-32.586 1.99a4.083 4.083 0 0 0 .498 8.15l32.586-1.99a4.088 4.088 0 0 0 3.824-4.33 4.075 4.075 0 0 0-4.322-3.82Zm-105.334 149.54a4.088 4.088 0 0 1 3.824-4.33l187.368-11.45a4.076 4.076 0 0 1 4.323 3.82l2.241 36.66-195.515 11.95-2.241-36.65Z"></path></g></svg>'),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 0.112*screenWidth,
                            height: 0.113*screenWidth,

                            child: Container(
                              width: 0.112*screenWidth,
                              height: 0.113*screenWidth,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/LOGO_RADIO.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            //decoration: BoxDecoration(color: Colors.amberAccent),
                            //height: 0.113*screenWidth,
                            width: 0.4*screenWidth,
                            //padding: EdgeInsets.symmetric(horizontal: 0.041*screenWidth),
                            child: Column(
                              children: [
                                Text(
                                  'SaigonNewsRadio',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 0.041*screenWidth,
                                    color: black_white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      height: 0.035 *screenWidth,
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(app_State.is_dark_mode_on?Colors.white:Colors.black, BlendMode.srcIn),
                                        child: SvgPicture.string(
                                          //fit:BoxFit.fill,
                                            '<svg xmlns="http://www.w3.org/2000/svg" aria-label="Follow" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M10 14C12.7614 14 15 16.2386 15 19V21C15 21.5523 14.5523 22 14 22H1C0.447715 22 0 21.5523 0 21V19C0 16.2386 2.23858 14 5 14H10ZM10 16H5C3.34315 16 2 17.3431 2 19V20H13V19C13 17.4023 11.7511 16.0963 10.1763 16.0051L10 16ZM19 7C19.5523 7 20 7.44772 20 8V11H23C23.5523 11 24 11.4477 24 12C24 12.5523 23.5523 13 23 13H20V16C20 16.5523 19.5523 17 19 17C18.4477 17 18 16.5523 18 16V13H15C14.4477 13 14 12.5523 14 12C14 11.4477 14.4477 11 15 11H18V8C18 7.44772 18.4477 7 19 7ZM7.5 2C10.5376 2 13 4.46243 13 7.5C13 10.5376 10.5376 13 7.5 13C4.46243 13 2 10.5376 2 7.5C2 4.46243 4.46243 2 7.5 2ZM7.5 4C5.567 4 4 5.567 4 7.5C4 9.433 5.567 11 7.5 11C9.433 11 11 9.433 11 7.5C11 5.567 9.433 4 7.5 4Z"></path></svg>'
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text('Follow',
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 0.035*screenWidth,
                                          color: black_white,
                                        ),
                                      ),
                                    ),
                                    //Expanded(child: Container()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin:EdgeInsets.symmetric(horizontal: 0.041*screenWidth) ,
                              child: CustomSwitch()
                          ),
                          GestureDetector(
                            onTap: (){
                              //audioPlayer.dispose();
                              miniAudioScreen(context).show();
                              Navigator.of(context).pop();},
                            child: Container(
                              width: 0.112*screenWidth,
                              height: 0.113*screenWidth,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                              ),
                              child: Center(
                                child: Container(
                                    child:ColorFiltered(
                                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                        child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="Minimize event" aria-hidden="true" class="icon" fill="currentColor" height="20" role="img" viewBox="0 0 24 24" width="20"><path d="M0.260067 6.32733C-0.0828625 6.70455 -0.0835802 7.27246 0.239759 7.6498L0.327334 7.73994L11.3273 17.7399C11.677 18.0578 12.1956 18.0843 12.5734 17.8194L12.6727 17.7399L23.6727 7.73994C24.0813 7.36844 24.1115 6.73599 23.7399 6.32733C23.397 5.95011 22.8317 5.89543 22.4254 6.18145L22.3273 6.26006L12 15.649L1.67268 6.26006C1.29546 5.91713 0.727549 5.91642 0.350211 6.23975L0.260067 6.32733Z"></path></svg>'))),
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 0.05*screenWidth,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(black_white, BlendMode.srcIn) ,
                                  child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="Info" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M24 12C24 5.37258 18.6274 0 12 0C5.37258 0 0 5.37258 0 12C0 18.6274 5.37258 24 12 24C18.6274 24 24 18.6274 24 12ZM2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12ZM12.9933 9.88338C12.9355 9.38604 12.5128 9 12 9H10C9.44771 9 9 9.44771 9 10C9 10.5523 9.44771 11 10 11H11V17H9C8.44771 17 8 17.4477 8 18C8 18.5523 8.44771 19 9 19H12H15C15.5523 19 16 18.5523 16 18C16 17.4477 15.5523 17 15 17H13V10C13 9.96055 12.9977 9.92164 12.9933 9.88338ZM11.5 7C12.3284 7 13 6.32843 13 5.5C13 4.67157 12.3284 4 11.5 4C10.6716 4 10 4.67157 10 5.5C10 6.32843 10.6716 7 11.5 7Z"></path></svg>')),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 0.02*screenWidth),
                              child: Text(
                                  "Saigonewsradio's live audio",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 0.041*screenWidth,
                                  color: black_white,
                                ),
                              ),
                            ),
                          ],

                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.015*screenWidth),
                            height: 0.05*screenWidth,
                            child: Text(
                              'Jun 9,2023',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 0.035*screenWidth,
                                color: black_white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.only(right: 0.02*screenWidth),
                              width: 0.112*screenWidth,
                              height: 0.113*screenWidth,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                              ),
                              child: Center(
                                child: Container(
                                    child:ColorFiltered(
                                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                        child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="Show visualzier" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M8 1C8 0.447716 8.44771 0 9 0C9.55229 0 10 0.447715 10 1V23C10 23.5523 9.55229 24 9 24C8.44771 24 8 23.5523 8 23V1ZM5 4C4.44772 4 4 4.44772 4 5V19C4 19.5523 4.44772 20 5 20C5.55228 20 6 19.5523 6 19V5C6 4.44772 5.55228 4 5 4ZM1 9C0.447715 9 0 9.44772 0 10V14C0 14.5523 0.447715 15 1 15C1.55228 15 2 14.5523 2 14V10C2 9.44772 1.55228 9 1 9ZM13 6C12.4477 6 12 6.44771 12 7V17C12 17.5523 12.4477 18 13 18C13.5523 18 14 17.5523 14 17V7C14 6.44772 13.5523 6 13 6ZM16 3C16 2.44772 16.4477 2 17 2C17.5523 2 18 2.44772 18 3V21C18 21.5523 17.5523 22 17 22C16.4477 22 16 21.5523 16 21V3ZM21 8C20.4477 8 20 8.44771 20 9V15C20 15.5523 20.4477 16 21 16C21.5523 16 22 15.5523 22 15V9C22 8.44771 21.5523 8 21 8Z"></path></svg>'))),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: 0.112*screenWidth,
                              height: 0.113*screenWidth,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                              ),
                              child: Center(
                                child: Container(
                                    child:ColorFiltered(
                                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                        child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="Share recording" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path fill-rule="evenodd" clip-rule="evenodd" d="M14.4826 0.710819L23.3186 8.30424L23.3453 8.33094C24.1851 9.17074 24.2698 10.5407 23.29 11.3814M23.289 11.3823L14.4683 18.9625C13.8701 19.4753 12.968 19.8927 12.0942 19.4328C11.2639 18.9958 11.0258 18.0483 11.0258 17.2385V15.2064H9.84349C6.58352 15.8322 4.45041 18.793 3.04135 22.3389C2.96776 22.5522 2.86116 22.7801 2.70055 22.9761C2.54223 23.1693 2.21975 23.4586 1.73218 23.4586C1.22248 23.4586 0.893783 23.1456 0.734191 22.9203C0.577052 22.6985 0.491014 22.4466 0.440439 22.2244C0.146878 21.0463 0 19.8659 0 18.6167C0 11.8688 4.3852 6.2531 11.0258 4.76886V2.35363C11.0258 1.56469 11.2714 0.626894 12.0942 0.193849C12.9756 -0.270092 13.8781 0.156293 14.4826 0.710819M13.0426 2.10923C13.0327 2.17428 13.0258 2.2552 13.0258 2.35363V6.4396L12.1902 6.57886C6.06514 7.59972 2 12.5506 2 18.6167C2 18.9793 2.01414 19.3342 2.04243 19.6841C3.58264 16.6438 5.93899 13.8714 9.57597 13.222L9.66318 13.2064H13.0258V17.2385C13.0258 17.3631 13.0353 17.4613 13.0482 17.5365C13.0829 17.5123 13.1223 17.4821 13.1663 17.4444L21.9864 9.86459L21.9874 9.86375C21.9934 9.85865 21.9972 9.85464 21.9995 9.85188L21.9991 9.84963C21.9982 9.84534 21.9923 9.82926 21.9923 9.82926C21.9859 9.81454 17.024 5.52745 17 5.5L13.1512 2.20366L13.1371 2.19057C13.103 2.15892 13.0714 2.13201 13.0426 2.10923ZM2.40429 21.8297L2.40356 21.8278L2.40429 21.8297Z"></path></svg>'))),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                            shape: BoxShape.circle,
                          ),
                          width: 0.2*screenWidth,
                          height: 0.2*screenWidth,
                          child: Center(
                            child: IconButton(
                                onPressed: ()async{app_State().playPause();},
                               /* async{
                                  if(app_State.isPlaying){
                                    await audioPlayer.pause();
                                  }else{
                                    await audioPlayer.resume();
                                  }
                                  setState(() {
                                    app_State.isPlaying != app_State.isPlaying;
                                  });*/

                                icon: Icon(app_State.isPlaying?Icons.pause:Icons.play_arrow),
                                iconSize: 0.12*screenWidth,
                              color: Colors.white,

                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.only(top: 0.082*screenWidth),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                width: 0.1*screenWidth,
                                height: 0.1*screenWidth,
                                child: GestureDetector(
                                  child: IconButton(
                                      onPressed: ()
                                      {
                                        if(audioPlayerModel.position>Duration(seconds: 0)){
                                          final newPosition_before15s = audioPlayerModel.position - Duration(seconds: 15);
                                          setState(() {
                                            //audioPlayerModel.position = newPosition_before15s;
                                            audioPlayerModel.audioPlayer.seek(newPosition_before15s);
                                          });
                                        };
                                      },
                                      icon: ColorFiltered(
                                        child: SvgPicture.string(
                                            height: 0.06*screenWidth,
                                            width:0.06*screenWidth,
                                            '<svg xmlns="http://www.w3.org/2000/svg" aria-label="Rewind 15 seconds" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12,0 C18.627417,0 24,5.372583 24,12 C24,18.627417 18.627417,24 12,24 C5.372583,24 0,18.627417 0,12 C0,11.4477153 0.44771525,11 1,11 C1.55228475,11 2,11.4477153 2,12 C2,17.5228475 6.4771525,22 12,22 C17.5228475,22 22,17.5228475 22,12 C22,6.4771525 17.5228475,2 12,2 C9.92479712,2 7.94892059,2.63315701 6.29171478,3.78798729 L6.29171478,3.78798729 L7.12178079,4.77904449 C7.23424317,4.91324358 7.29623177,5.08550197 7.29623177,5.26382145 C7.29623177,5.67040164 6.98056077,6 6.59116084,6 L6.59116084,6 L3.00142936,6 C2.957837,6 2.91433858,5.99577888 2.87149287,5.98739087 C2.48876251,5.9124628 2.23667281,5.52776854 2.30843475,5.12815219 L2.30843475,5.12815219 L2.94191678,1.60051937 C2.97105977,1.43823258 3.05160809,1.2908867 3.17061893,1.18215782 C3.46367223,0.914422891 3.90910969,0.945428897 4.16553133,1.25141167 L4.16553133,1.25141167 L5.00220371,2.250502 C7.02061156,0.79891615 9.45005293,0 12,0 Z M16,7 C16.5522847,7 17,7.44771525 17,8 C17,8.51283584 16.6139598,8.93550716 16.1166211,8.99327227 L16,9 L12.999,9 L12.999,10.5 L14,10.5 L14.1920352,10.5051789 C16.0357224,10.6048736 17.5,12.1314366 17.5,14 C17.5,15.9329966 15.9329966,17.5 14,17.5 C12.5994732,17.5 11.6431081,17.0539791 10.8101872,16.2290468 C10.4177857,15.8404089 10.4147347,15.2072513 10.8033726,14.8148497 C11.1920106,14.4224481 11.8251682,14.4193971 12.2175698,14.8080351 C12.6965544,15.2824257 13.1630806,15.5 14,15.5 C14.8284271,15.5 15.5,14.8284271 15.5,14 C15.5,13.2203039 14.9051119,12.5795513 14.14446,12.5068666 L14,12.5 L11.993,12.5 L11.8668252,12.4930296 C11.353151,12.4379228 11.0677765,12.0639838 11.0107015,11.6546189 L11.0011891,11.5517036 L11,11.5 L11,8 C11,7.48716416 11.3860402,7.06449284 11.8833789,7.00672773 L12,7 L16,7 Z M8,7 C8.51283584,7 8.93550716,7.38604019 8.99327227,7.88337887 L9,8 L9,16.5 C9,17.0522847 8.55228475,17.5 8,17.5 C7.48716416,17.5 7.06449284,17.1139598 7.00672773,16.6166211 L7,16.5 L7,8 C7,7.44771525 7.44771525,7 8,7 Z"></path></svg>'),
                                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                      )
                                  ),
                                ),
                              ),
                              Expanded(child: Column(
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black, BlendMode.srcIn),
                                    child: Slider(
                                      max: audioPlayerModel.duration.inSeconds.toDouble(),
                                      min: 0,
                                      value: audioPlayerModel.position.inSeconds.toDouble(),
                                      onChanged: (value) async{
                                        print("slider: $value");
                                        final newPosition = Duration(seconds: value.toInt());
                                        await audioPlayerModel.audioPlayer.seek(newPosition);
                                        await audioPlayerModel.audioPlayer.resume();
                                        setState(() {
                                          audioPlayerModel.position = newPosition;
                                        });

                                       /* setState(() {
                                          position = newPosition;
                                        });*/
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal:8 ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(audioPlayerModel.formatTime(audioPlayerModel.position)),
                                        Text(audioPlayerModel.formatTime(audioPlayerModel.duration - audioPlayerModel.position)),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                              Container(
                                decoration: BoxDecoration(
                                  color: app_State.is_dark_mode_on?Color.fromRGBO(153, 153, 153, 1.0):Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                width: 0.1*screenWidth,
                                height: 0.1*screenWidth,
                                child: GestureDetector(
                                  child: IconButton(
                                      onPressed: ()
                                      {
                                        final newPosition_after15s = audioPlayerModel.position + Duration(seconds: 15);
                                        setState(() {
                                          //position = newPosition_after15s;
                                          audioPlayerModel.audioPlayer.seek(newPosition_after15s);
                                        });
                                        //Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage()),);
                                      },
                                      icon: ColorFiltered(
                                        child: SvgPicture.string(
                                            height: 0.06*screenWidth,
                                            width:0.06*screenWidth,
                                          '<svg xmlns="http://www.w3.org/2000/svg" aria-label="Fast Foward 15 seconds" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12,0 C14.5499471,0 16.9793884,0.79891615 18.9977963,2.250502 L19.8344687,1.25141167 C20.0908903,0.945428897 20.5363278,0.914422891 20.8293811,1.18215782 C20.9483919,1.2908867 21.0289402,1.43823258 21.0580832,1.60051937 L21.6915653,5.12815219 C21.7633272,5.52776854 21.5112375,5.9124628 21.1285071,5.98739087 C21.0856614,5.99577888 21.042163,6 20.9985706,6 L17.4088392,6 C17.0194392,6 16.7037682,5.67040164 16.7037682,5.26382145 C16.7037682,5.08550197 16.7657568,4.91324358 16.8782192,4.77904449 L17.7082852,3.78798729 C16.0510794,2.63315701 14.0752029,2 12,2 C6.4771525,2 2,6.4771525 2,12 C2,17.5228475 6.4771525,22 12,22 C17.5228475,22 22,17.5228475 22,12 C22,11.4477153 22.4477153,11 23,11 C23.5522847,11 24,11.4477153 24,12 C24,18.627417 18.627417,24 12,24 C5.372583,24 0,18.627417 0,12 C0,5.372583 5.372583,0 12,0 Z M16,7 C16.5522847,7 17,7.44771525 17,8 C17,8.51283584 16.6139598,8.93550716 16.1166211,8.99327227 L16,9 L12.999,9 L12.999,10.5 L14,10.5 L14.1920352,10.5051789 C16.0357224,10.6048736 17.5,12.1314366 17.5,14 C17.5,15.9329966 15.9329966,17.5 14,17.5 C12.5994732,17.5 11.6431081,17.0539791 10.8101872,16.2290468 C10.4177857,15.8404089 10.4147347,15.2072513 10.8033726,14.8148497 C11.1920106,14.4224481 11.8251682,14.4193971 12.2175698,14.8080351 C12.6965544,15.2824257 13.1630806,15.5 14,15.5 C14.8284271,15.5 15.5,14.8284271 15.5,14 C15.5,13.2203039 14.9051119,12.5795513 14.14446,12.5068666 L14,12.5 L11.993,12.5 L11.8668252,12.4930296 C11.353151,12.4379228 11.0677765,12.0639838 11.0107015,11.6546189 L11.0011891,11.5517036 L11,11.5 L11,8 C11,7.48716416 11.3860402,7.06449284 11.8833789,7.00672773 L12,7 L16,7 Z M8,7 C8.51283584,7 8.93550716,7.38604019 8.99327227,7.88337887 L9,8 L9,16.5 C9,17.0522847 8.55228475,17.5 8,17.5 C7.48716416,17.5 7.06449284,17.1139598 7.00672773,16.6166211 L7,16.5 L7,8 C7,7.44771525 7.44771525,7 8,7 Z"></path></svg>',
                                        ),
                                        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              )
            ]
          ),
        ),
      ),
    );
  }

  /*void dispose() {
    audioPlayer.dispose();
    isPlaying = false;
    super.dispose();
  }*/
}