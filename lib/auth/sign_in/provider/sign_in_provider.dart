
import 'package:flutter/material.dart';
import 'package:pizza_hut/api_serviece/api_service.dart';
import 'package:pizza_hut/auth/sign_in/model/sign_in_model.dart';
import '../../../first_screen/view/first_screen_view.dart';

class SignInProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  
  bool isLoading = false;

  void validate(BuildContext context) {
    emailFormKey.currentState?.validate() == true &&
            passwordFormKey.currentState?.validate() == true
        ? isValidate(context)
        : isNotValidate(context);
  }

  void isValidate(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final user = SignInModel(email: emailController.text.trim(), password: passwordController.text.trim());
    ApiService().signInFunction(user).then((value) {
      if(value == "success"){
        Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FirstScreen(),
        ),
      );
      }
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
    });
    
  }

  void isNotValidate(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something Went Wrong !'),
        ),
      );
}
