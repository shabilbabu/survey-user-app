import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';

import '../question_model/question_model.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#152238'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                height: 40.h,
                width: MediaQuery.of(context).size.width.w,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Question ${currentQuestionIndex + 1}/${questionList.length.toString()}',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                questionList[currentQuestionIndex].questionText,
                style: GoogleFonts.kanit(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _answerList(),
              SizedBox(
                height: 20.h,
              ),
              _nextButton()
            ],
          ),
        ),
      ),
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return GestureDetector(
      onTap: () {
        if (selectedAnswer == null) {
          if (answer.isCorrect) {
            score++;
          }
          setState(() {
            selectedAnswer = answer;
          });
        }
      },
      child: Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width.w,
        margin: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.grey,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            answer.answerText,
            style: GoogleFonts.kanit(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Center(
      child: GestureDetector(
        onTap: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: MediaQuery.of(context).size.width * 0.5,
          height: 60.h,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              isLastQuestion ? "Submit" : "Next",
              style: GoogleFonts.kanit(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Container(
        height: 300.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/Shooting Coin.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "$title | Score is $score",
              style: GoogleFonts.kanit(
                fontSize: 25,
                color: isPassed ? Colors.green : Colors.red,
              ),
            )
          ],
        ),
      ),
      content: GestureDetector(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const FirstScreen()),
            (route) => false,
          );
        },
        child: Container(
          height: 60.h,
          width: MediaQuery.of(context).size.width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor('#152238'),
          ),
          child: Center(
            child: Text(
              'Restart',
              style: GoogleFonts.kanit(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
