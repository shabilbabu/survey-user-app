import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pizza_hut/auth/sign_in/model/sign_in_model.dart';
import 'package:pizza_hut/auth/sign_up/model/signup_model.dart';

class ApiService {
  final String baseUrl = "https://survey-api-latest.herokuapp.com/";
  final String signUpUrl = "api/v1/signup";
  final String signInUrl = "api/v1/signin";


//--------------- This function for sign up ---------------//
  Future<String?> signUpFunction(SignUpModel user) async {
    try {
      Response response =
          await Dio().post(baseUrl + signUpUrl, data: user.tojson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("hey Sign Up---------------------------------");
        return "success";
      } else {
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      log(e.message);
      if (e.message.startsWith("SocketException")) {
        return "Check your internet connection";
      } else {
        return e.response!.data['error'];
      }
    }
  }


  //------------- This function for sign in ----------------//
  Future<String?> signInFunction(SignInModel user) async{
    try{
      Response response =  await Dio().post(baseUrl + signInUrl, data: user.tojson());
      if(response.statusCode! >= 200 || response.statusCode! <= 299){
        log("hey Sign in---------------------------------");
        return "success";
      } else {
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      log(e.message);
      if(e.message.startsWith("SocketException")){
        return "Check your internet Connection";
      } else {
        return e.response!.data['error'];
      }
    }
  }
}
