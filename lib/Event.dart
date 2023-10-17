import 'package:provider/provider.dart';
import 'package:sgnradiooo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sgnradiooo/playing_audio_screen.dart';
import 'About.dart';
import 'Custom_widget.dart';
import 'HomePage.dart';

class event extends StatefulWidget{

  @override
  _events createState() => _events();
}

class _events extends State<event> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
@override
  Widget build(BuildContext context){
  bool isDarkModeOn = Provider.of<app_State>(context).isDarkModeOn;
  double screenWidth = MediaQuery.of(context).size.width;
  Color black_white = app_State.is_dark_mode_on?Colors.white:Colors.black;

  return Scaffold(
    key: scaffoldKey,
    endDrawer: MyEndDrawer(),
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: app_State.is_dark_mode_on?Colors.black:Colors.white,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: appBar(),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1.7*screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //decoration: BoxDecoration(color: Colors.black),
                      width: 0.3*screenWidth,
                      height: 0.3*screenWidth,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(black_white, BlendMode.srcIn),
                        child: SvgPicture.string(
                          '<svg width="80" height="80" viewBox="0 0 80 80" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M19 34C19 32.3431 20.3431 31 22 31H34C35.6569 31 37 32.3431 37 34V46C37 47.6569 35.6569 49 34 49H22C20.3431 49 19 47.6569 19 46V34ZM22 33C21.4477 33 21 33.4477 21 34V46C21 46.5523 21.4477 47 22 47H34C34.5523 47 35 46.5523 35 46V34C35 33.4477 34.5523 33 34 33H22Z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M22 55C20.3431 55 19 56.3431 19 58V70C19 71.6569 20.3431 73 22 73H34C35.6569 73 37 71.6569 37 70V58C37 56.3431 35.6569 55 34 55H22ZM21 58C21 57.4477 21.4477 57 22 57H34C34.5523 57 35 57.4477 35 58V70C35 70.5523 34.5523 71 34 71H22C21.4477 71 21 70.5523 21 70V58Z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M43 58C43 56.3431 44.3431 55 46 55H58C59.6569 55 61 56.3431 61 58V70C61 71.6569 59.6569 73 58 73H46C44.3431 73 43 71.6569 43 70V58ZM46 57C45.4477 57 45 57.4477 45 58V70C45 70.5523 45.4477 71 46 71H58C58.5523 71 59 70.5523 59 70V58C59 57.4477 58.5523 57 58 57H46Z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M46 31C44.3431 31 43 32.3431 43 34V46C43 47.6569 44.3431 49 46 49H58C59.6569 49 61 47.6569 61 46V34C61 32.3431 59.6569 31 58 31H46ZM45 34C45 33.4477 45.4477 33 46 33H58C58.5523 33 59 33.4477 59 34V46C59 46.5523 58.5523 47 58 47H46C45.4477 47 45 46.5523 45 46V34Z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M64 9H76C78.2091 9 80 10.7909 80 13V76C80 78.2091 78.2091 80 76 80H4C1.79086 80 0 78.2091 0 76V13C0 10.7909 1.79086 9 4 9H16V1C16 0.447715 16.4477 0 17 0C17.5523 0 18 0.447715 18 1V9H62V1C62 0.447715 62.4477 0 63 0C63.5523 0 64 0.447715 64 1V9ZM18 18V11H62V18C62 18.5523 62.4477 19 63 19C63.5523 19 64 18.5523 64 18V11H76C77.1046 11 78 11.8954 78 13V24H2V13C2 11.8954 2.89543 11 4 11H16V18C16 18.5523 16.4477 19 17 19C17.5523 19 18 18.5523 18 18ZM2 26V76C2 77.1046 2.89543 78 4 78H76C77.1046 78 78 77.1046 78 76V26H2Z"></path></svg>',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical:0.04*screenWidth),
                      child: Text(
                        'SaigonNewsRadio does not have any',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 0.041*screenWidth,
                          color: black_white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                          'upcoming events.',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 0.041*screenWidth,
                          color: black_white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
}

