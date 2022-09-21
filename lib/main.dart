
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_hut/Questions_screen/provider/question_view_provider.dart';
import 'package:pizza_hut/auth/sign_in/provider/sign_in_provider.dart';
import 'package:pizza_hut/auth/sign_in/view/signin_view.dart';
import 'package:pizza_hut/auth/sign_up/provider/sign_up_provider.dart';
import 'package:pizza_hut/auth/sign_up/view/sign_up.dart';
import 'package:pizza_hut/first_screen/view/first_screen_view.dart';
import 'package:pizza_hut/home/view/home_view.dart';
import 'package:pizza_hut/intro/view/intro_main.dart';
import 'package:provider/provider.dart';

import 'intro/provider/intro_provider.dart';

void main(List<String> args) {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => IntroductionController(),
            ),
           
          ],
          child:  MultiProvider(
            providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionViewProvider(),
        ),
      ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignInView(),
            ),
          ),
        );
      },
      designSize: const Size(411.42857142857144, 843.4285714285714),
    );
      
  }
}