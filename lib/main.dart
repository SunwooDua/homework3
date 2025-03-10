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

class grid_box extends StatelessWidget {
  const grid_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
