import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = "";
    if (resultScore <= 10) {
      resultText = 'We are sorry for your inconvinience';
      Text(
        "$resultText",
        style: TextStyle(color: Colors.red),
      );
    } else if (resultScore <= 20) {
      resultText = 'Hope we serve you better next time';
      Text(
        "$resultText",
        style: TextStyle(color: Colors.yellow),
      );
    } else if (resultScore <= 30) {
      resultText = 'We hope you come back next time';
      Text(
        "$resultText",
        style: TextStyle(color: Colors.green),
      );
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          Text(
            'Score' '$resultScore',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              child: Text(
                'Restart',
              ),
              onPressed: () => resetHandler),
        ],
      ),
    );
  }
}
