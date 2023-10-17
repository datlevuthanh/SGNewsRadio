import 'package:flutter/material.dart';
import 'package:sgnradiooo/main.dart';
import 'package:sgnradiooo/playing_audio_screen.dart';
import 'HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Event.dart';
import 'About.dart';
import 'HomePage.dart';


class CustomSwitch extends StatefulWidget{
  @override
  CustomSwitchState createState() => CustomSwitchState();
}


class CustomSwitchState extends State<CustomSwitch> {

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarKModeOn = context.watch<app_State>().isDarkModeOn;
    return GestureDetector(
      onTap: (){
        setState(() {
          app_State().changemode();
          context.read<app_State>().toggleDarkMode();
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Stack(
          children: [
            Container(
              width: 0.125*screenWidth,
              height: 0.064*screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: app_State.is_dark_mode_on ? Colors.grey : Color.fromRGBO(205, 172, 0,1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 0.03*screenWidth,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="" aria-hidden="true" class="icon" fill="currentColor" height="12" role="img" viewBox="0 0 24 24" width="12"><path d="M24 13.0811C23.7898 15.3555 22.9362 17.523 21.5391 19.3301C20.142 21.1371 18.2591 22.5088 16.1109 23.2848C13.9626 24.0608 11.6378 24.2089 9.40838 23.7118C7.17901 23.2147 5.13731 22.0929 3.52219 20.4778C1.90708 18.8627 0.785339 16.821 0.288242 14.5916C-0.208855 12.3622 -0.0607536 10.0374 0.715218 7.88913C1.49119 5.74086 2.86293 3.85801 4.66994 2.46089C6.47695 1.06378 8.64449 0.210186 10.9189 0C9.58731 1.80151 8.94653 4.02113 9.11313 6.25516C9.27973 8.48918 10.2426 10.5892 11.8267 12.1733C13.4108 13.7574 15.5108 14.7203 17.7448 14.8869C19.9789 15.0535 22.1985 14.4127 24 13.0811Z"></path></svg>'
                      ),
                    ),
                  ),
                  Container(
                    height: 0.03*screenWidth,
                    child: ColorFiltered(
                        colorFilter: ColorFilter.mode(Colors.white,BlendMode.srcIn),
                        child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" aria-label="" aria-hidden="true" class="icon" fill="currentColor" height="12" role="img" viewBox="0 0 24 24" width="12"><path d="M12 0C12.5523 0 13 0.447715 13 1V3C13 3.55228 12.5523 4 12 4C11.4477 4 11 3.55228 11 3V1C11 0.447715 11.4477 0 12 0ZM12 17C14.7614 17 17 14.7614 17 12C17 9.23858 14.7614 7 12 7C9.23858 7 7 9.23858 7 12C7 14.7614 9.23858 17 12 17ZM13 21C13 20.4477 12.5523 20 12 20C11.4477 20 11 20.4477 11 21V23C11 23.5523 11.4477 24 12 24C12.5523 24 13 23.5523 13 23V21ZM3.51286 3.51289C3.90339 3.12237 4.53655 3.12237 4.92708 3.51289L6.34708 4.93289C6.7376 5.32342 6.7376 5.95658 6.34708 6.34711C5.95655 6.73763 5.32339 6.73763 4.93286 6.34711L3.51286 4.92711C3.12234 4.53658 3.12234 3.90342 3.51286 3.51289ZM19.0671 17.6529C18.6766 17.2624 18.0434 17.2624 17.6529 17.6529C17.2624 18.0434 17.2624 18.6766 17.6529 19.0671L19.0729 20.4871C19.4634 20.8776 20.0966 20.8776 20.4871 20.4871C20.8776 20.0966 20.8776 19.4634 20.4871 19.0729L19.0671 17.6529ZM0 12C0 11.4477 0.447715 11 1 11H3C3.55228 11 4 11.4477 4 12C4 12.5523 3.55228 13 3 13H1C0.447715 13 0 12.5523 0 12ZM21 11C20.4477 11 20 11.4477 20 12C20 12.5523 20.4477 13 21 13H23C23.5523 13 24 12.5523 24 12C24 11.4477 23.5523 11 23 11H21ZM6.34708 17.6529C6.7376 18.0434 6.7376 18.6766 6.34708 19.0671L4.92708 20.4871C4.53655 20.8776 3.90339 20.8776 3.51286 20.4871C3.12234 20.0966 3.12234 19.4634 3.51286 19.0729L4.93286 17.6529C5.32339 17.2624 5.95655 17.2624 6.34708 17.6529ZM20.4871 4.92711C20.8776 4.53658 20.8776 3.90342 20.4871 3.51289C20.0966 3.12237 19.4634 3.12237 19.0729 3.51289L17.6529 4.93289C17.2624 5.32342 17.2624 5.95658 17.6529 6.34711C18.0434 6.73763 18.6766 6.73763 19.0671 6.34711L20.4871 4.92711Z"></path></svg>')),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: app_State.is_dark_mode_on? 30.0 : 2,
              right: app_State.is_dark_mode_on? 2:30.0,
              child: Container(
                height:0.064*screenWidth,
                width: 0.064*screenWidth,
                child: AnimatedContainer(
                  //margin: EdgeInsets.symmetric(vertical: 1,horizontal: 1),
                  duration: Duration(milliseconds: 200),
                  height:0.064*screenWidth,
                  width: 0.064*screenWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}

   void updateUI(){
    setState(() {

    });
  }

}

//Button menu-------------------------------------------------------------------
class menu extends StatefulWidget{
  @override
  _buttonMenu createState() => _buttonMenu();
}
class _buttonMenu extends State<menu>{

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void open_menu_endDrawer(){
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context){
    bool isDarkModeOn = Provider.of<app_State>(context).isDarkModeOn;
    return Container(
        height:64.00,
        width: 64.00,
        padding: EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: (){Scaffold.of(context).openEndDrawer();},
          icon: Icon(Icons.menu,),
          iconSize: 34.0,
          color: app_State.is_dark_mode_on?Colors.white:Colors.black,
        )
    );
  }
}





//endDrawer menu----------------------------------------------------------------
class MyEndDrawer extends StatefulWidget {
  @override
  _myEndrawer createState() => _myEndrawer();
}
class _myEndrawer extends State<MyEndDrawer> {



  Widget menu_content(String content,Color textColor){
    return Container(
      height: 43,
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 8),
      child: Text(
        content,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    bool isDarkModeOn = Provider.of<app_State>(context).isDarkModeOn;

    Color _menutextColor = app_State.is_dark_mode_on?Colors.white:Colors.black;
    return SafeArea(
      child: Drawer(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: app_State.is_dark_mode_on?Colors.black:Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        color: _menutextColor,
                        icon: Icon(Icons.close),
                        iconSize: 30.0,
                        onPressed: (){Scaffold.of(context).closeEndDrawer();},
                      ),
                      height: 64,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 52,
                      height: 64,
                    ),
                  ],
                ),
                GestureDetector(
                  child: menu_content('Home',_menutextColor),
                  onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>HomePage(),));},
                ),
                GestureDetector(
                  child: menu_content('Events',_menutextColor),
                  onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>event(),));},
                ),
                GestureDetector(
                  child: menu_content('Recordings',_menutextColor),
                  onTap: (){},
                ),
                GestureDetector(
                  child: menu_content('About',_menutextColor),
                  onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>about(),));},
                ),

                // Thêm nhiều ListTiles cho các mục bổ sung
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//AppBar------------------------------------------------------------------------
class appBar extends StatefulWidget{

  @override
  _customAppbar createState() => _customAppbar();
}
class _customAppbar extends State<appBar>{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    return
       Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 33.414),
              child: Container(
                width: 64.00, // Đặt chiều rộng mong muốn
                height:64.00, // Đặt chiều cao mong muốn
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/LOGO_RADIO.png')
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  menu(),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(8),
                child: CustomSwitch()
            ),
          ],
        ),
      );

  }
}

//Mini audio srceen--------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

class miniAudioScreen {
  //final String message;

  final BuildContext context;
  late OverlayEntry overlayEntry;
  miniAudioScreen(this.context);
  void show() {

    double sreenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    EdgeInsets safeAreaInsets = MediaQuery.of(context).padding;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: safeAreaInsets.bottom ,
        width: MediaQuery.of(context).size.width,
        height: 0.167*sreenWidth,
        child: Material(
          //color: Colors.transparent,
          child: GestureDetector(
            onTap: (){
              //Provider.of<app_State>(context, listen: false);
              remove();
              Navigator.push(context,MaterialPageRoute(builder:(context)=>playing_audio_screen(),));},
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.03*sreenWidth,horizontal: 0.05*sreenWidth),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 0.113*sreenWidth,
                      width:  0.113*sreenWidth,
                      child: Container(
                        decoration: BoxDecoration(
                            color: app_State.is_dark_mode_on?Color.fromRGBO(13, 13, 13, 1):Color.fromRGBO(255,255, 255, 1),
                            shape: BoxShape.circle),
                        height: 0.113*sreenWidth,
                        width:  0.113*sreenWidth,
                      ),
                    ),
                    Container(
                      width: 0.61*sreenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Saigonewradio's live audio",
                                style: GoogleFonts.montserrat(
                                  fontSize: 0.032*sreenWidth,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                //width: 0.61*sreenWidth,
                                child: Text(
                                  'Jun9,2023',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 0.032*sreenWidth,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.113*sreenWidth,
                      width:  0.113*sreenWidth,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(250, 250, 250, 0.25),
                            shape: BoxShape.circle),
                        height: 0.113*sreenWidth,
                        width:  0.113*sreenWidth,
                        child: Center(
                            child: Container(
                              height: 0.06*sreenWidth,
                              width: 0.06*sreenWidth,
                              child: GestureDetector(
                                onTap: (){
                                    remove();
                                  },
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  child: SvgPicture.string(
                                    fit: BoxFit.cover,
                                    '<svg xmlns="http://www.w3.org/2000/svg" aria-label="Close mini player" aria-hidden="true" class="icon" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M3.70708 3.70711C4.0976 3.31659 4.73077 3.31659 5.12129 3.70711L12 10.5858L18.8786 3.70711C19.2692 3.31658 19.9023 3.31658 20.2929 3.70711C20.6834 4.09763 20.6834 4.7308 20.2929 5.12132L13.4142 12L20.2929 18.8787C20.6834 19.2692 20.6834 19.9024 20.2929 20.2929C19.9024 20.6834 19.2692 20.6834 18.8787 20.2929L12 13.4142L5.12131 20.2929C4.73078 20.6834 4.09762 20.6834 3.70709 20.2929C3.31657 19.9024 3.31657 19.2692 3.70709 18.8787L10.5858 12L3.70708 5.12132C3.31655 4.7308 3.31655 4.09763 3.70708 3.70711Z"></path></svg>',
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)!.insert(overlayEntry!);
  }
  void remove() {
      overlayEntry?.remove();
  }
}

