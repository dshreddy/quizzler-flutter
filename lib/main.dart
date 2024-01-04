import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'questions.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "quizzler",
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text("Quizzler"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: const SafeArea(
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
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int questionIndex = 0;
  String currentQuestion = "";

  void checkAnswer(bool button) {
    return setState(() {
      if (questionIndex < questions.length) {
        if (questions[questionIndex].answer == button) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questionIndex++;
        if (questionIndex < questions.length) {
          currentQuestion = questions[questionIndex].question;
        } else {
          currentQuestion = "We reached the end of the quiz";
        }
      } else {
        // currentQuestion = "We reached the end of the quiz";
        Alert(
          context: context,
          title: "Quiz ended",
          desc: "Press cancel & exit the app",
        ).show();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize currentQuestion in the initState method.
    currentQuestion = questions[questionIndex].question;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Question Text
        Expanded(
          // flex 5 ensures the space occupied by the question box is 5 * the true & false buttons
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestion,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // True Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
        ),
        // False Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
        ),
        //Score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
