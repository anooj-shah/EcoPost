import 'package:EcoPost/models/ecopost_info.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  static List<TabItem> tabs = new List<TabItem>();

  @override
  Widget build(BuildContext context) {
    tabs = new List<TabItem>();
    tabs.add(TabItem(title: "Explore", icon: Icons.explore));
    tabs.add(TabItem(title: "Post", icon: Icons.add_a_photo));
    tabs.add(TabItem(title: "Around Me", icon: Icons.map));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EcoPostInfo()),
      ],
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.themeGreen,
            title: AutoSizeText('EcoPost',
                minFontSize: 48,
                style: GoogleFonts.grandHotel(
                    textStyle: TextStyle(
                  color: Colors.white,
                  letterSpacing: 7,
                ))),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 0,
            onTap: (ind) async {
//                await Requests.getFires();
              switch (ind) {
                case 0:
                  Navigator.of(context).canPop()
                      ? Navigator.of(context).popAndPushNamed('/')
                      : print('cant push');
                  break;
                case 1:
                  Navigator.of(context).pushNamed('/ExplorePage');
                  break;
                case 2:
                  //Navigator.of(context).canPop()
                  Navigator.of(context).pushNamed('/ProfilePage');
                  // : print('cant push');
                  break;
              }
            },
            items: tabs,
            backgroundColor: Constants.themeLightGreen,
            style: TabStyle.reactCircle,
          ),
//          appBar: AppBar(
//          ),

          body: FlatButton(
            onPressed: () {},
            child: Text(""),
          ),
        ),
      ),
    );
  }
}
