import 'package:flutter/material.dart';
import 'package:testapp/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionlist = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedanswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Simple Quize App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            _questionWidget(),
            _answerList(),
            _nextButtob(),
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionlist.length.toString()}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionlist[currentQuestionIndex].questationText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionlist[currentQuestionIndex]
          .answerList
          .map((e) => _answerButton(e))
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isseleced = answer == selectedanswer;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 30,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: isseleced ? Colors.greenAccent : Colors.white,
          onPrimary: isseleced ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedanswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedanswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButtob() {
    bool islastQuestion = false;
    if (currentQuestionIndex == questionlist.length - 1) {
      islastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 30,
      child: ElevatedButton(
          child: Text(islastQuestion ? 'Submit' : 'Next'),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.redAccent,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            if (islastQuestion) {
              //display Score
              showDialog(context: context, builder: (_) => _showscoreDialog());
            } else {
              // next question
              setState(() {
                selectedanswer = null;
                currentQuestionIndex++;
              });
            }
          }),
    );
  }

  _showscoreDialog() {
    bool ispassed = false;
    if (score >= questionlist.length * 0.6) {
      // pass if 60%
      ispassed = true;
    }
    String title = ispassed ? 'passed' : 'failed';

    return AlertDialog(
      title: Text(
        title + '| Score  $score',
        style: TextStyle(color: ispassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: Text('Restart'),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedanswer = null;
          });
        },
      ),
    );
  }
}
