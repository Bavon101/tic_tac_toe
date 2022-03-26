import 'package:flutter/material.dart';

import '../widgets/board_tile.dart';
import '../widgets/score_box.dart';

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);
  /// This is the page that all the user action and interactions occur
  ///
  /// It a stateful widget to keep track of user interaction and render the UI with the latest data
  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  ///String List that keeps track of the board keyed data, it's just updated as per the new moves, by default it's a list of empty strings

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
        actions: [
            IconButton(
              tooltip: 'restart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                        label: 'YES',
                        onPressed: () => {}),
                    content: const Text(
                        'Are you sure you want another genesis?\n[Ignore for continuum]')));
              },
              icon: const Icon(Icons.restart_alt_rounded))
        ],
      ),
      body: Column(
        children: [
                    const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Text(
                "Scores Board",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ScoreBox(player: 'o', score: _playerOscores),
                ScoreBox(player: 'x', score: _playerXScores),
                const Spacer(),
                const Tooltip(
                    message: 'player', child: Icon(Icons.next_plan_rounded)),
                Text(
                  _nextPlayer.toUpperCase(),
                  style: _style(),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
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
          ),
        ],
      ),
    );
  }

  /// Player's text style, displayed in different color as per the current player
    TextStyle _style() {
    return TextStyle(
        color: _nextPlayer == 'o' ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 80);
  }
}
