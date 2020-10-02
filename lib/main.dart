import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'app_brain.dart';

AppBrain appBrain = AppBrain();
void main() => runApp(TrueOrFalse());

class TrueOrFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  Question currentQuestion;
  Expanded buildTrueButton(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              bool correctAnswer = currentQuestion.questionAnswer;

              if (correctAnswer == true) {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
              } else {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
              }

              //The user picked true.
              setState(() {
                currentQuestion = appBrain.nextQuestion();
              });
            },
          ),
        ),
      ),
    );
  }
  Expanded buildFalseButton(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: FlatButton(
            color: Colors.red,
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              bool correctAnswer = currentQuestion.questionAnswer;

              if (correctAnswer == false) {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
              } else {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
              }
              setState(() {
               currentQuestion = appBrain.nextQuestion();
              });
              //The user picked false.
            },
          ),
        ),
      ),
    );
 }  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion = appBrain.nextQuestion();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestion.questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        buildTrueButton(),
        buildFalseButton(),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*

*/
