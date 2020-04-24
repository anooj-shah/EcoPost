import 'package:EcoPost/frontend/home_page.dart';
import 'package:EcoPost/utilities/constants.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the MapView Screen
//        '/ReportPage': (context) => ChangeNotifierProvider(
//            create: (context) => FormInfo(), child: ReportPage()),
        '/HomePage': (context) => new MyHome(),
//        '/ExplorePage': (context) => new ExplorePage(),
//        '/ProfilePage': (context) => new ProfilePage(),
      },
      theme: ThemeData(
//        primaryColor: Constants.themePurple,
          ),
      // TODO: Add boolean using shared pref package to only show login once
      home: MyHome(),
    );
  }
}
