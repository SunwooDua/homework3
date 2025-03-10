import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const CardMatchApp());
}

class CardMatchApp extends StatelessWidget {
  const CardMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Matching App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CardMatchScreen(),
    );
  }
}

class grid_box extends StatefulWidget {
  final frontCard card;
  const grid_box({Key? key, required this.card}) : super(key: key);

  @override
  State<grid_box> createState() => _grid_boxState();
}

class _grid_boxState extends State<grid_box> {
  bool selected = false;

  final List<String> cardFronts = [
    'assets/card1.png',
    'assets/card2.png',
    'assets/card3.png',
    'assets/card4.png',
    'assets/card5.png',
    'assets/card6.png',
    'assets/card7.png',
    'assets/card8.png',

    'assets/card1.png',
    'assets/card2.png',
    'assets/card3.png',
    'assets/card4.png',
    'assets/card5.png',
    'assets/card6.png',
    'assets/card7.png',
    'assets/card8.png',
  ]; // card list for front, put two since need matching

  String randomFront = ''; // save random image
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          widget.card.isFlipped = selected;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: AnimatedContainer(
          height: 25,
          width: 25,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          duration: Duration(seconds: 2),
          curve: Curves.bounceInOut,
          child:
              selected
                  ? Image(image: AssetImage(widget.card.frontImage))
                  : Image(image: AssetImage('assets/card_back.png')),
        ),
      ),
    );
  }
}

class frontCard {
  //track if cards are flippped
  final String frontImage;
  bool isFlipped;

  frontCard({required this.frontImage, this.isFlipped = false});
}

class CardMatchScreen extends StatefulWidget {
  @override
  State<CardMatchScreen> createState() => _CardMatchScreenState();
}

class _CardMatchScreenState extends State<CardMatchScreen> {
  List<frontCard> cards = [];

  // initialzation of cards (random and check if flipped) use initState
  void initState() {
    super.initState();

    cards = [
      frontCard(frontImage: 'assets/card1.png'),
      frontCard(frontImage: 'assets/card2.png'),
      frontCard(frontImage: 'assets/card3.png'),
      frontCard(frontImage: 'assets/card4.png'),
      frontCard(frontImage: 'assets/card5.png'),
      frontCard(frontImage: 'assets/card6.png'),
      frontCard(frontImage: 'assets/card7.png'),
      frontCard(frontImage: 'assets/card8.png'),

      frontCard(frontImage: 'assets/card1.png'),
      frontCard(frontImage: 'assets/card2.png'),
      frontCard(frontImage: 'assets/card3.png'),
      frontCard(frontImage: 'assets/card4.png'),
      frontCard(frontImage: 'assets/card5.png'),
      frontCard(frontImage: 'assets/card6.png'),
      frontCard(frontImage: 'assets/card7.png'),
      frontCard(frontImage: 'assets/card8.png'),
    ];

    //randomize
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardMatchingApp"),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        itemCount: 16, //number of card 4x4
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return grid_box(card: cards[index]);
        },
      ),
    );
  }
}
