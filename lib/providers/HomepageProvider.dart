import 'package:flutter/cupertino.dart';

class HomepageProvider extends ChangeNotifier {
  bool? isEligible;
  String eligibilityMessage = '';

  void checkEligibility(String text) {
    if(text == '') {
      isEligible = null;
      eligibilityMessage = '';
      notifyListeners();
    }
    else {
      int age = int.parse(text);
      if(age >= 18) {
        isEligible = true;
        eligibilityMessage = 'Congratulations you are eligible for driving liscence';
        notifyListeners();
      }
      else {
        isEligible = false;
        eligibilityMessage = 'You are not eligible for driving liscence';
        notifyListeners();
      }
    }
  }
}