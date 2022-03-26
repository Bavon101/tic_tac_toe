import 'dart:typed_data';

import 'package:flutter/material.dart';

/// Used to show dialog data is diffent game stage alerts, such a winning and a draw
///
///It has some dynamic modification
///
class DialogBody extends StatelessWidget {
  const DialogBody(
      {Key? key,
      this.backgroundColor = Colors.blueGrey,
      required this.title,
      required this.message,
      this.boardView})
      : super(key: key);
  /// option background color for the dialog
  final Color backgroundColor;

  /// the title for the alert dialog
  final String title;

  /// the message to be displayed in the dialog 
  final String message;

  /// The image for the last board view after a stage is completed, in [bytes]
  final Uint8List? boardView;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Material(
        child: Container(
           width: size.width * .80,
          height: size.height * (boardView != null ? .35 : .20),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              color: backgroundColor),
          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: _style(),
                    ),
                    const Divider(),
                    if(boardView != null)
                    Image.memory(boardView!,
                    height: size.height*.15,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: _style(),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor)),
                      child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Continue".toUpperCase(),
                              style: _style().copyWith(color: Colors.green))),
                    )
                  ],
                ),
              ),
        ),
      ),
    );
  }
  /// custom styling for the texts
  TextStyle _style() {
    return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  }
}
