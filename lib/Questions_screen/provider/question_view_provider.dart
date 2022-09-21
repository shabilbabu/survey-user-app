import 'package:flutter/cupertino.dart';

import '../question_model/question_model.dart';

class QuestionViewProvider with ChangeNotifier{
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  int score = 0;
}