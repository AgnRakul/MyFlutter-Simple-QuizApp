import 'package:flutter/material.dart';
import 'model/question.dart';

void main() {
  runApp(MaterialApp(home: QuizApp()));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

QuestionList questionList = QuestionList();

int _currentQuestionIndex = 0;

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 120.0,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    questionList
                        .questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(fontSize: 16.9, color: Colors.white),
                  ),
                )),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RaisedButton(
                onPressed: () => _previousQuestion(),
                color: Colors.blueGrey.shade900,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              RaisedButton(
                onPressed: () => _checkAnswer(true),
                color: Colors.blueGrey.shade900,
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () => _checkAnswer(false),
                color: Colors.blueGrey.shade900,
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () => _nextQuestion(),
                color: Colors.blueGrey.shade900,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ]),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice ==
        questionList.questionBank[_currentQuestionIndex].isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: '✔️',
            onPressed: () {},
          ),
          content: const Text("Correct Answer"),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.greenAccent,
          width: 200.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
      _updateQuestion();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: '❌',
          onPressed: () {},
        ),
        content: const Text("Incorrect Answer"),
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.redAccent,
        width: 200.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ));
    }
  }

// NEXT QUESTION
  _nextQuestion() {
    _updateQuestion();
  }

  // Next Ouestion if True

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex + 1) % questionList.questionBank.length;
    });
  }
  // Previous Question

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex - 1) % questionList.questionBank.length;
    });
  }
}
