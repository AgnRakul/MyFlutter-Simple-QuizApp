import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/question.dart';

final ThemeData? _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber[800],
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme),
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      headline6: base.headline6!.copyWith(fontSize: 18.0),
      caption:
          base.caption!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      button: base.button!.copyWith(letterSpacing: 3.0, fontSize: 15.9),
      bodyText2: base.bodyText2!.copyWith(
        fontSize: 16.9,
        color: Colors.white,
      ));
}

void main() {
  runApp(
    MaterialApp(
      theme: _appTheme,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.red[900],
      //   textTheme: TextTheme(
      //     headline1: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      //     bodyText2: TextStyle(fontSize: 16.9, color: Colors.white),
      //   ),
      // ),
      home: QuizApp(),
    ),
  );
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
        //  backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,
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
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                )),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => _previousQuestion(),
                color: Colors.blueGrey.shade900,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => _checkAnswer(true),
                color: Colors.blueGrey.shade900,
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => _checkAnswer(false),
                color: Colors.blueGrey.shade900,
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // ignore: deprecated_member_use
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
