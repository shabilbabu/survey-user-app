
import 'package:flutter/material.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';

class SignUpProvider with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> usernameFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmPasswordFormkey = GlobalKey<FormState>();

  void validate(BuildContext context) {
    usernameFormkey.currentState?.validate() == true &&
            emailFormKey.currentState?.validate() == true &&
            passwordFormKey.currentState?.validate() == true &&
            confirmPasswordFormkey.currentState?.validate() == true
        ? isValidate(context)
        : isNotValidate(context);
  }

  void isValidate(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FirstScreen(),
        ),
      );

  void isNotValidate(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something Went Wrong !'),
        ),
      );
}
