import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  const BoardTile(
      {Key? key, this.active = true, required this.value, required this.onTap})
      : super(key: key);

  /// [BoardTile] acts as the card to display the current tapped value
  ///
  /// Keeping a record of the UI

  /// The value to display as text in the tile, basicaly an empty string for no moves in the tile yet and a "X" or "O" for a clicked tile
  final String value;

  /// a function that is called when the user taps on the boardTile
  final Function onTap;

  /// controls if the tile should be active ontap or not or if it has been clicked before
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: active? () => onTap():null,
      child: Container(
           decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: Center(
            child: Text(
              value.toUpperCase(),
              style: TextStyle(
                  color: value == 'o' ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
          ),
      ));
  }
}
