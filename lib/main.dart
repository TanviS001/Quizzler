import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Quizzler', style: TextStyle(color: Colors.white)),
        ),
        body: Quizzler(),
      ),
    ),
  );
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {

  List<Icon> scoreKeeper = [];

  int getScore() {
    return scoreKeeper.where((icon) => icon.icon == Icons.check).length;
  }

  void checkAnswer(bool answerByUser){
    setState(() {

      if (quizBrain.isFinished()==true){
        Alert(context: context, title: "Game Over", desc: "Your score is: ${getScore()}").show();
      }

      if(quizBrain.getAnswer()==answerByUser){
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else{
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.getNextQuestion();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height:10.0,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('False', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height:10.0,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.removeRange(0, scoreKeeper.length);
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Icon(
                color: Colors.white,
                Icons.refresh,
              )
            ),
          ),
          Wrap(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
