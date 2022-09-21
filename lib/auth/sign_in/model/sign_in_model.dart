class SignInModel{
  final String email;
  final String password;

  SignInModel({required this.email, required this.password});

  Map<String, String> tojson(){
    return {
      "email" : email,
    "password" : password
    };
  }
}