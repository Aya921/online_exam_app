import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final Color colorUsed;

  final String txt;
  final int score;

  const Score({
    super.key,
    required this.colorUsed,

    required this.txt,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt, style: TextStyle(color: colorUsed)),

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorUsed),
            color: Colors.transparent,
          ),
          child: Center(
            child: Text(
              '$score',
              style: TextStyle(
                color: colorUsed,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
