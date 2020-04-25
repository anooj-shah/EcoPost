import 'package:EcoPost/models/ecopost_info.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/widgets/post_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.leaf),
                      color: Colors.white,
                      onPressed: () {
                        //TODO: Take to a point submission page
                      },
                    ),
                    AutoSizeText("35+")
                  ],
                ),
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
            backgroundColor: Constants.themeGreen,
            style: TabStyle.reactCircle,
          ),
          body: new ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    new PostCard(),
                    Divider(
                      thickness: 3,
                      indent: 12,
                      endIndent: 12,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
