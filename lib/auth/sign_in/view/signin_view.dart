import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pizza_hut/auth/sign_in/provider/sign_in_provider.dart';
import 'package:pizza_hut/auth/sign_up/view/sign_up.dart';
import 'package:pizza_hut/custom_widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#152238'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Text(
                'Hello',
                style: GoogleFonts.lobster(
                  fontSize: 60,
                  color: Colors.orange,
                ),
              ),
              Text(
                'Please Sign In your Account',
                style: GoogleFonts.lobster(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Form(
                  key: context.read<SignInProvider>().emailFormKey,
                  child: CustomTextField(
                    controller: context.watch<SignInProvider>().emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter a valid email Address';
                      }
                      return null;
                    },
                    icon: Icons.email,
                    type: TextInputType.emailAddress,
                    hinttext: 'email',
                    onChanged: (value) => context
                        .read<SignInProvider>()
                        .emailFormKey
                        .currentState!
                        .validate(),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Form(
                  key: context.read<SignInProvider>().passwordFormKey,
                  child: CustomTextField(
                    controller:
                        context.watch<SignInProvider>().passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required';
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$')
                          .hasMatch(value)) {
                        return 'Password should be 1 UpperCase Alphabet and 1 Special Character and Numeric';
                      }
                      return null;
                    },
                    icon: Icons.lock,
                    type: TextInputType.name,
                    hinttext: 'password',
                    onChanged: (value) => context
                        .read<SignInProvider>()
                        .passwordFormKey
                        .currentState!
                        .validate(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password ?',
                        style: GoogleFonts.kanit(
                            fontSize: 18, color: Colors.orange))
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<SignInProvider>().validate(context);
                    },
                    child: Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Consumer<SignInProvider>(
                        builder: (context, value, child) {
                          return value.isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  'Sign In',
                                  style: GoogleFonts.kanit(
                                      fontSize: 22, color: Colors.white),
                                );
                        },
                      )),
                    ),
                  )),
              RichText(
                text: TextSpan(
                  text: "Already have an account  ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: HexColor(
                      '#A89D9D',
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const AuthView()),
                              (route) => false,
                            );
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
