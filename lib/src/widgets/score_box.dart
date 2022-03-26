import 'package:flutter/material.dart';
/// A card to display the type of player "X" or "O" with the current score record

class ScoreBox extends StatelessWidget {
  const ScoreBox({ Key? key, required this.player, required this.score }) : super(key: key);
  /// player's current score
  final int score;

  /// player "X" or "O"
  final String player;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                decoration: BoxDecoration(border: Border.all()),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  player,
                  style: _style(),
                ),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  '$score',
                  style:
                      _style().copyWith(color: Colors.blueGrey, fontSize: 40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/// custom text style for the texts
    TextStyle _style() {
    return TextStyle(
        color: player == 'o' ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 40);
  }
}