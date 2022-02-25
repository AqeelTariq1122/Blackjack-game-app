import 'dart:math';
import 'package:black_jack/widgets/cards_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/customButtons.dart';
import 'widgets/custon _text.dart';
import 'widgets/custom_result.dart';


class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  _BlackJackScreenState createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool isGAmeStarted = false;
  final double cardSpace = 50;
// Card Images
  List<Image> myCards = [];
  List<Image> dealersCards = [];

// Cards
  String? dealerFirstCard;
  String? dealerSecondCard;

  String? PlayerFirstCard;
  String? playerSecondCard;

  // Score
  int dealerScore = 0;
  int PlayerScore = 0;

  final Map<String, int> deckOfCards = {
    "Cards/2.1.png": 2,
    "Cards/2.2.png": 2,
    "Cards/2.3.png": 2,
    "Cards/2.4.png": 2,
    "Cards/3.1.png": 3,
    "Cards/3.2.png": 3,
    "Cards/3.3.png": 3,
    "Cards/3.4.png": 3,
    "Cards/4.1.png": 4,
    "Cards/4.2.png": 4,
    "Cards/4.3.png": 4,
    "Cards/4.4.png": 4,
    "Cards/5.1.png": 5,
    "Cards/5.2.png": 5,
    "Cards/5.3.png": 5,
    "Cards/5.4.png": 5,
    "Cards/6.1.png": 6,
    "Cards/6.2.png": 6,
    "Cards/6.3.png": 6,
    "Cards/6.4.png": 6,
    "Cards/7.1.png": 7,
    "Cards/7.2.png": 7,
    "Cards/7.3.png": 7,
    "Cards/7.4.png": 7,
    "Cards/8.1.png": 8,
    "Cards/8.2.png": 8,
    "Cards/8.3.png": 8,
    "Cards/8.4.png": 8,
    "Cards/9.1.png": 9,
    "Cards/9.2.png": 9,
    "Cards/9.3.png": 9,
    "Cards/9.4.png": 9,
    "Cards/10.1.png": 10,
    "Cards/10.2.png": 10,
    "Cards/10.3.png": 10,
    "Cards/10.4.png": 10,
    "Cards/J1.png": 10,
    "Cards/J2.png": 10,
    "Cards/J3.png": 10,
    "Cards/J4.png": 10,
    "Cards/Q1.png": 10,
    "Cards/Q2.png": 10,
    "Cards/Q3.png": 10,
    "Cards/Q4.png": 10,
    "Cards/K1.png": 10,
    "Cards/K2.png": 10,
    "Cards/K3.png": 10,
    "Cards/K4.png": 10,
    "Cards/A1.png": 11,
    "Cards/A2.png": 11,
    "Cards/A3.png": 11,
    "Cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};
  @override
  void initState() {
    super.initState();
    playingCards.addAll(deckOfCards);
  }

//Reset the round abd reset the cards
  void StartNewRound() {
    isGAmeStarted = true;

    // start new round with full deck of cards
    playingCards = {};
    playingCards.addAll(deckOfCards);

    //Reset cards images
    myCards = [];
    dealersCards = [];

    Random random = Random();

    // Random card one key for Dealer
    String CardOneKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == CardOneKey);

    // Random card Two key for Dealer
    String CardTwoKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == CardTwoKey);

    // Random card one key for Player
    String CardThreeKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == CardThreeKey);

    // Random card Two key for Player
    String CardFourKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    playingCards.removeWhere((key, value) => key == CardFourKey);

    // set Dealer first and second cards keys
    dealerFirstCard = CardOneKey;
    dealerSecondCard = CardTwoKey;

    // set Player first and second card key
    PlayerFirstCard = CardThreeKey;
    playerSecondCard = CardFourKey;

    // set Dealers first & second card image for Display(Grid view)
    dealersCards.add(
      Image.asset(
        dealerFirstCard!,
        width: 110,
        height: 200,
      ),
    );
    dealersCards.add(
      Image.asset(
        dealerSecondCard!,
        width: 110,
        height: 200,
      ),
    );
    //add score
    dealerScore =
        deckOfCards[dealerFirstCard]! + deckOfCards[dealerSecondCard]!;

    // set Players first & second card image for Display (Grid view)
    myCards.add(Image.asset(
      PlayerFirstCard!,
      width: 110,
      height: 200,
    ));
    myCards.add(Image.asset(
      playerSecondCard!,
      width: 110,
      height: 200,
    ));
    //add score
    PlayerScore =
        deckOfCards[PlayerFirstCard]! + deckOfCards[playerSecondCard]!;

    if (dealerScore <= 14) {
      Random random = Random();
      String dealersNewCardKey =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == dealersNewCardKey);

      dealersCards.add(Image.asset(
        dealersNewCardKey,
        width: 110,
        height: 200,
      ));
      dealerScore = dealerScore + deckOfCards[dealersNewCardKey]!;
    }

    setState(() {});
  }

// add extra card to player
  void addCard() {
    if (PlayerScore > 0) {
      Random random = Random();
      String newCardKey =
          playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == newCardKey);

      myCards.add(Image.asset(
        newCardKey,
        width: 110,
        height: 200,
      ));
      PlayerScore = PlayerScore + deckOfCards[newCardKey]!;
    }
    setState(() {});
  }



  Success() {
    if (PlayerScore > 21 && PlayerScore > dealerScore) {
      return custom_result_text(lable: "You lose!",);
    } else if (PlayerScore > dealerScore && PlayerScore < 21) {
      return custom_result_text(lable: "You Win!",);
    } else
      () {
        return Text("fuck");
      };

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isGAmeStarted
            ? SafeArea(
                child: Container(
                  color: Color(0XFF72B6B5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          custom_text(
                            PlayerScore: dealerScore,
                            label: "Dealer's Score : ",
                          ),
                          CardsStackView(
                              myCards: dealersCards, cardSpace: cardSpace),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Success(),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          custom_text(
                            PlayerScore: PlayerScore,
                            label: "Player's Score : ",
                          ),
                          CardsStackView(
                              myCards: myCards, cardSpace: cardSpace),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButtons(
                                onPressed: () {
                                  addCard();
                                },
                                label: "Another Card",
                                buttonColor: Color(0XFF418281),
                              ),
                              CustomButtons(
                                onPressed: () {
                                  StartNewRound();
                                },
                                label: "Next Round",
                                buttonColor: Color(0XFFE90003),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                color: Color(0XFF72B6B5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/logo.jpg"),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButtons(
                      onPressed: () {
                        StartNewRound();
                      },
                      label: "Start",
                      buttonColor: Color(0XFFE90003),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}



