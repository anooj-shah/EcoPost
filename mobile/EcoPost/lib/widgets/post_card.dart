import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/utilities/requests.dart';
import 'package:EcoPost/widgets/back_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      onFlip: () async {
        print("flipped");
//        await Requests.uploadImage();
      },
      flipOnTouch: true,
      direction: FlipDirection.VERTICAL,
      // default
      front: Container(
//        height: 300,
//        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      CircularProfileAvatar(
                        '',
                        child: Image(image: AssetImage('assets/avatar1.JPG')),
                        radius: 25,
                        borderColor: Constants.themeGreen,
                        borderWidth: 4,
                      ),
                      VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      AutoSizeText("Yonathan Zetune")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "assets/trashtag1.jpg",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                        child: Icon(
                          Icons.thumb_up,
                          size: 18,
                        ),
                      ),
                      AutoSizeText("32")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      back: BackCard(lat: 33.071153, long: -96.704665),
    );
  }
}
