
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CardsStackView extends StatelessWidget {
  const CardsStackView({
    Key? key,
    required this.myCards,
    required this.cardSpace,
  }) : super(key: key);

  final List<Image> myCards;
  final double cardSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Stack(children: [
          // Card Deck
          SizedBox(
              width:
              110 + (myCards.length - 1) * cardSpace,
              height: 200),
          // Cards
          ...myCards
              .mapIndexed((index, widget) => Positioned(
              left: index * cardSpace,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.elliptical(20, 10)),
                child: Container(
                  padding: EdgeInsets.all(0),
                  color: Color(0XFF72B6B5),
                  // color: Colors.grey,
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(0),
                      child: widget),
                ),
              )))
              .toList()
        ])
      // GridView.builder(
      //   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      //   itemCount: myCards.length,
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(
      //           mainAxisSpacing: 3, crossAxisCount: 3),
      //   itemBuilder: (context, index) {
      //     return myCards[index];
      //   },
      // ),
    );
  }
}