import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = const [
    {
      'questionText': 'Q1. How do you like our Service? ',
    },
    {
      'questionText': 'Q2. How did you appreciate the Santiation? ',
    },
    {
      'questionText': 'Q3. How was the sound quality? ',
    },
    {
      'questionText': 'Q4. How was the lighting? ',
    },
    {
      'questionText':
          'Q5. How likely are you to recommend us to your friends? ',
    },
    {
      'questionText': 'Q6. How likely are you to come back here? ',
    },
  ];

  var _qindex = 0;
  var _totalscore = 0;

  void _resetquiz() {
    setState(() {
      _qindex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _qindex += 1;
    });
    print(_qindex);
    if (_qindex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('FeedBack App'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _qindex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  qindex: _qindex,
                  questions: _questions,
                )
              : Result(_totalscore, _resetquiz),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: Column(
        //   // Column is also a layout widget. It takes a list of children and
        //   // arranges them vertically. By default, it sizes itself to fit its
        //   // children horizontally, and tries to be as tall as its parent.
        //   //
        //   // Invoke "debug painting" (press "p" in the console, choose the
        //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //   // to see the wireframe for each widget.
        //   //
        //   // Column has various properties to control how it sizes itself and
        //   // how it positions its children. Here we use mainAxisAlignment to
        //   // center the children vertically; the main axis here is the vertical
        //   // axis because Columns are vertical (the cross axis would be
        //   // horizontal).
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       'You have pushed the button this many times:',
        //     ),
        //     Text(
        //       '$_counter',
        //       style: Theme.of(context).textTheme.headline4,
        //     ),
        //   ],
        // ),
      ),
      debugShowCheckedModeBanner: false,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
