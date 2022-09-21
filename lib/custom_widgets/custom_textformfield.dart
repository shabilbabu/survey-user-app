import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final String? labeltext;
  final IconData icon;
  final bool val;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hinttext;

  const CustomTextField({
    Key? key,
    this.val = false,
    required this.icon,
    required this.type,
    this.controller,
    this.labeltext,
    this.validator,
    this.hinttext,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      autofocus: false,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          
      color: Colors.white,
      fontSize: 13,
    ),
        hintText: hinttext,
        prefixIcon: Icon(icon,color: Colors.orange,),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: type,
      
      obscureText: val,
      textInputAction: TextInputAction.next,

      // onSaved: (value) {
      //   controller.text = value!;
      // },
      validator: validator,
      onChanged: onChanged,

      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
