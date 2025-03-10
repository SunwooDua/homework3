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

class grid_box extends StatelessWidget {
  final frontCard card;
  final int index;
  final Function onTap;

  const grid_box({
    Key? key,
    required this.card,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(); // move it to CardMatchScreen
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
              card.isFlipped
                  ? Image(image: AssetImage(card.frontImage))
                  : Image(image: AssetImage('assets/card_back.png')),
        ),
      ),
    );
  }
}

class frontCard {
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
  List<int> flippedIndex = [];

  // Initialize cards and randomize
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

    // Randomize the cards
    cards.shuffle();
  }

  void matchCheck() {
    if (flippedIndex.length == 2) {
      int firstIndex = flippedIndex[0];
      int secondIndex = flippedIndex[1];
      if (cards[firstIndex].frontImage == cards[secondIndex].frontImage) {
        // Cards match, leave them flipped
        setState(() {
          flippedIndex.clear();
        });
      } else {
        // Cards don't match, flip them back
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            cards[firstIndex].isFlipped = false;
            cards[secondIndex].isFlipped = false;
            flippedIndex.clear();
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardMatchingApp"),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        itemCount: 16, // Number of cards (4x4 grid)
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 cards per row
        ),
        itemBuilder: (context, index) {
          return grid_box(
            card: cards[index],
            index: index,
            onTap: () {
              if (!cards[index].isFlipped && flippedIndex.length < 2) {
                setState(() {
                  cards[index].isFlipped = true; // Flip selected card
                  flippedIndex.add(index); // Save flipped index
                });
                matchCheck();
              }
            },
          );
        },
      ),
    );
  }
}
