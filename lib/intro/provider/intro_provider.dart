import 'package:flutter/widgets.dart';

class IntroductionController with ChangeNotifier {
  PageController controller = PageController();

  bool onLastPage = false;

  void boolianUpdate(value) {
    onLastPage = (value == 2);
    notifyListeners();
  }


}
