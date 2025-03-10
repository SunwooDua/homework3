import 'package:flutter/material.dart';

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
  @override
  State<grid_box> createState() => _grid_boxState();
}

class _grid_boxState extends State<grid_box> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
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
                  ? Image(image: AssetImage('assets/card1.png'))
                  : Image(image: AssetImage('assets/card_back.png')),
        ),
      ),
    );
  }
}

class CardMatchScreen extends StatefulWidget {
  const CardMatchScreen({super.key});

  @override
  State<CardMatchScreen> createState() => _CardMatchScreenState();
}

class _CardMatchScreenState extends State<CardMatchScreen> {
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
          return grid_box();
        },
      ),
    );
  }
}
