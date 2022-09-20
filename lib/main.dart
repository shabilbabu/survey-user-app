
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_hut/auth/sign_up/provider/sign_up_provider.dart';
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
      ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: IntroductionScreen(),
            ),
          ),
        );
      },
      designSize: const Size(411.42857142857144, 843.4285714285714),
    );
      
  }
}