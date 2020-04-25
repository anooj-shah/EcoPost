import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

const kLeaderboardHeaderFontStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

const kWinnersNumberFontStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

const kWinnersNameFontStyle = TextStyle(
  fontSize: 20,
);

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<bool> _isSelected = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Text("Leaderboard", style: kLeaderboardHeaderFontStyle),
          Container(),
          WinnersText(text: "1st Place", name: "Tom Holland"),
          Padding(
            padding: EdgeInsets.fromLTRB(0, screenHeight / 45, 0, 0),
            child: Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              //alignment:new Alignment(x, y)
              children: <Widget>[
                Container(
                  height: 140 + screenHeight / 10.2,
                ),
                Positioned(
                  top: screenHeight / 10,
                  left: screenWidth / 1.8,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.cheatsheet.com/wp-content/uploads/2019/12/tom-holland-spider-man-homecoming-premiere.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight / 10,
                  right: screenWidth / 1.8,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.cheatsheet.com/wp-content/uploads/2019/12/tom-holland-spider-man-homecoming-premiere.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.cheatsheet.com/wp-content/uploads/2019/12/tom-holland-spider-man-homecoming-premiere.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: screenWidth / 3.6,
                    top: -1 * screenHeight / 40,
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Image(image: AssetImage('assets/crown.png'))))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WinnersText(text: "2nd Place", name: "Tom Holland"),
                WinnersText(text: "3rd Place", name: "Tom Holland"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: ToggleButtons(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 36) / 3,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "DAILY",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEEKLY",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
                Container(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "MONTHLY",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _isSelected[buttonIndex] = true;
                    } else {
                      _isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: _isSelected,
            ),
          ),
          LeaderboardColumnTitle(),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    LeaderboardRow(),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

class LeaderboardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(2, 0, 0, 4),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularProfileAvatar(
                '',
                child: Image(image: AssetImage('assets/avatar1.JPG')),
                radius: 25,
                borderColor: Constants.themeGreen,
                borderWidth: 4,
              ),
              AutoSizeText("Yonathan Zetune"),
              Container(),
              Container(),
              Container(),
              Text("300"),
            ],
          ),
        ));
  }
}

class LeaderboardColumnTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: false,
            child: CircularProfileAvatar(
              '',
              child: Image(image: AssetImage('assets/avatar1.JPG')),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
          ),
          Visibility(visible: false, child: AutoSizeText("Yonathan Zetune")),
          Container(),
          Container(),
          Container(),
          Text("Points", style: TextStyle(fontSize: 18)),
        ],
      ),
    ));
  }
}

class WinnersText extends StatelessWidget {
  final String text;
  final String name;

  WinnersText({@required this.text, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: kWinnersNumberFontStyle),
        Text(name, style: kWinnersNameFontStyle),
      ],
    );
  }
}
