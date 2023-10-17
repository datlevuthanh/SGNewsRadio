import 'package:provider/provider.dart';
import 'package:sgnradiooo/Event.dart';
import 'package:sgnradiooo/HomePage.dart';
import 'package:sgnradiooo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sgnradiooo/playing_audio_screen.dart';
import 'Custom_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class about extends StatefulWidget {

  @override
  _about createState() => _about();
}

class _about extends State<about> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  launch_firstURL()async{
    const  first_url = 'https://sgnradio.mixlr.com/';
    Uri firstUri = Uri.parse(first_url);
    if(await canLaunchUrl(firstUri)){
      await launchUrl(firstUri);
    }else{
      throw 'Could not launch $first_url';
    }
  }

  @override
  Widget build(BuildContext context){
    bool isDarkModeOn = Provider.of<app_State>(context).isDarkModeOn;
    Color black_white = app_State.is_dark_mode_on?Colors.white:Colors.black;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: MyEndDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color : app_State.is_dark_mode_on? Colors.black:Colors.white,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: appBar(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'About',
                    style: GoogleFonts.montserrat(
                      fontSize: 0.072*screenWidth,
                      fontWeight: FontWeight.w700,
                      color: black_white,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(

                  margin: EdgeInsets.only(bottom: 0.04*screenWidth,left: 16),
                  child: Text(
                    'SaigonNewsRadio',
                    style: GoogleFonts.montserrat(
                      fontSize: 0.072*screenWidth,
                      fontWeight: FontWeight.w700,
                      color: black_white,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 0.02*screenWidth,left: 16),
                      child: Text(
                        '0',
                        style: GoogleFonts.montserrat(
                          fontSize: 0.072*screenWidth,
                          fontWeight: FontWeight.w700,
                          color: black_white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(bottom: 0.02*screenWidth),
                      child: Text(
                        '33',
                        style: GoogleFonts.montserrat(
                          fontSize: 0.072*screenWidth,
                          fontWeight: FontWeight.w700,
                          color: black_white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 0.04*screenWidth,left: 16),
                      child: Text(
                        'Followers',
                        style: GoogleFonts.montserrat(
                          fontSize: 0.041*screenWidth,
                          fontWeight: FontWeight.w500,
                          color: black_white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(bottom: 0.04*screenWidth),
                      child: Text(
                        'Total Listens',
                        style: GoogleFonts.montserrat(
                          fontSize: 0.041*screenWidth,
                          fontWeight: FontWeight.w500,
                          color: black_white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height:  0.051*screenWidth,
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        height: 0.051*screenWidth,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode( black_white,BlendMode.srcIn),
                          child: SvgPicture.string(
                              fit: BoxFit.fill,
                              '<svg xmlns="http://www.w3.org/2000/svg" aria-label="https://saigonnewsradio.com" aria-hidden="true" class="icon" fill="currentColor" height="20" role="img" viewBox="0 0 24 24" width="20"><path d="M12,1 C18.0751322,1 23,5.92486775 23,12 C23,18.0751322 18.0751322,23 12,23 L12,23 L12,23 L11.7115925,22.9962926 C5.76976358,22.8433652 1,17.9787016 1,12 C1,5.92486775 5.92486775,1 12,1 L12,1 Z M7.05279391,13.0010636 L3.05500569,13.0006955 C3.46835632,16.7372697 6.16921492,19.7842959 9.72607502,20.7102675 C8.2052792,18.4233136 7.28166193,15.7770381 7.05279391,13.0010636 Z M20.9449943,13.0006955 L16.9498422,13.0008226 C16.7255335,15.7635472 15.8008579,18.4154858 14.2745676,20.7097575 C17.8312897,19.7837266 20.5316823,16.7369207 20.9449943,13.0006955 Z M14.9451338,13.0010135 L9.05769731,13.0011 C9.30894175,15.7121797 10.3295959,18.2954853 12,20.449 C13.6768698,18.2876187 14.6988203,15.6963166 14.9451338,13.0010135 Z M9.72543244,3.29024251 L9.6892238,3.29941009 C6.15025532,4.23685972 3.46644779,7.27618877 3.05489527,11.0003032 L7.05007662,11.0001782 C7.27424317,8.2370933 8.19895783,5.58479128 9.72543244,3.29024251 Z M12,3.55 C10.3230059,5.71244403 9.30089864,8.30441355 9.05475967,11.0001802 L14.9423953,10.9998982 C14.6913091,8.28844298 13.6706094,5.70466834 12,3.55 Z M14.273925,3.2897325 L14.4629614,3.58063524 C15.8714653,5.80010201 16.728192,8.34051478 16.9472885,10.9999359 L20.9451047,11.0003032 C20.5321249,7.26327319 17.831102,4.21578659 14.273925,3.2897325 Z"></path></svg>'
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 0.02*screenWidth),
                        height: 0.051*screenWidth,
                        child: Text(
                          'https://https:saigonnewsradio.com',
                          style: GoogleFonts.montserrat(
                            fontSize: 0.041*screenWidth,
                            fontWeight: FontWeight.w500,
                            color: black_white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 0.02*screenWidth,
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        height: 0.051*screenWidth,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(black_white,BlendMode.srcIn),
                          child: SvgPicture.string(
                              fit: BoxFit.fill,
                              '<svg xmlns="http://www.w3.org/2000/svg" aria-label="https://saigonnewsradio.com" aria-hidden="true" class="icon" fill="currentColor" height="20" role="img" viewBox="0 0 24 24" width="20"><path d="M12,1 C18.0751322,1 23,5.92486775 23,12 C23,18.0751322 18.0751322,23 12,23 L12,23 L12,23 L11.7115925,22.9962926 C5.76976358,22.8433652 1,17.9787016 1,12 C1,5.92486775 5.92486775,1 12,1 L12,1 Z M7.05279391,13.0010636 L3.05500569,13.0006955 C3.46835632,16.7372697 6.16921492,19.7842959 9.72607502,20.7102675 C8.2052792,18.4233136 7.28166193,15.7770381 7.05279391,13.0010636 Z M20.9449943,13.0006955 L16.9498422,13.0008226 C16.7255335,15.7635472 15.8008579,18.4154858 14.2745676,20.7097575 C17.8312897,19.7837266 20.5316823,16.7369207 20.9449943,13.0006955 Z M14.9451338,13.0010135 L9.05769731,13.0011 C9.30894175,15.7121797 10.3295959,18.2954853 12,20.449 C13.6768698,18.2876187 14.6988203,15.6963166 14.9451338,13.0010135 Z M9.72543244,3.29024251 L9.6892238,3.29941009 C6.15025532,4.23685972 3.46644779,7.27618877 3.05489527,11.0003032 L7.05007662,11.0001782 C7.27424317,8.2370933 8.19895783,5.58479128 9.72543244,3.29024251 Z M12,3.55 C10.3230059,5.71244403 9.30089864,8.30441355 9.05475967,11.0001802 L14.9423953,10.9998982 C14.6913091,8.28844298 13.6706094,5.70466834 12,3.55 Z M14.273925,3.2897325 L14.4629614,3.58063524 C15.8714653,5.80010201 16.728192,8.34051478 16.9472885,10.9999359 L20.9451047,11.0003032 C20.5321249,7.26327319 17.831102,4.21578659 14.273925,3.2897325 Z"></path></svg>'
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 0.02*screenWidth),
                        height: 0.051*screenWidth,
                        child: Text(
                          'https://sgnradio.com',
                          style: GoogleFonts.montserrat(
                            fontSize: 0.041*screenWidth,
                            fontWeight: FontWeight.w500,
                            color: black_white,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(),
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
