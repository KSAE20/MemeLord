import 'package:flutter/material.dart';
import 'package:memelord/components/input_container.dart';
import 'package:memelord/constants.dart';


class TextInputField extends StatelessWidget {
    final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  final String hint;
  const TextInputField({
    Key? key,
  required this.controller,
  required this.icon,
  required this.labelText,
  required this.hint,
  this.isObscure=false,
  }) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
      decoration: InputDecoration(
      labelText: labelText,
      
      //prefixIcon: Icon(icon),
      labelStyle: const TextStyle(fontSize: 17,color: Color.fromARGB(255, 31, 199, 211)),
                icon: Icon(icon, color: Color.fromARGB(255, 31, 199, 211)),
                
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),
          border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide:  BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide:  BorderSide(
              color: Colors.white,
            )),
      ),
      obscureText: isObscure,
        cursorColor: Colors.black,
      

        ),
      );
  }
}