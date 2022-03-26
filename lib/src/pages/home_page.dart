import 'package:flutter/material.dart';

import '../widgets/board_tile.dart';

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);
  /// This is the page that all the user action and interactions occur
  ///
  /// It a stateful widget to keep track of user interaction and render the UI with the latest data
  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  /// keeps track of the board keyed data, it's just updated as per the new moves

  List<String> _moves = ['', '', '', '', '', '', '', '', ''];

    /// The player who is to make the next move
  String _nextPlayer = 'o';

   /// controls all the board tiles status  to be [active or dissabled]
   bool _active = true;

  /// keeps a record of player "O" scores, the score are updated having +5 points
  int _playerOscores = 0;

  /// keeps a record of player "X" scores, having same track as [_playerOscores]
  int _playerXScores = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s Tic Tac Toe'),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        children: List.generate(
            _moves.length,
            (i) => BoardTile(
                value: _moves[i],
                active: _moves[i].isEmpty && _active,
                onTap: () => {})),
      ),
    );
  }
}
