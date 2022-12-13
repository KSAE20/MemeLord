import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/controllers/Auth_controller.dart';
import 'package:memelord/views/screens/components/rounded_button.dart';
import 'package:memelord/views/screens/components/text_input_field_widget.dart';

class RegisterForm extends StatelessWidget {
   RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
 
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController ;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 10),

                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),

                  SizedBox(height: 40),

                 Stack(
                  children: [
                    const CircleAvatar(
                      radius: 66,
                      
                      backgroundImage: AssetImage('assets/images/profileicon.png'
                      ),
                      
                      backgroundColor: Color.fromARGB(27,74,154,255), 
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () => authController.pickImage(),
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    )
                  ],
                 ),

                  SizedBox(height: 40),

                 // RoundedInput(icon: Icons.face, hint: 'Username'),

                  //RoundedInput(icon: Icons.email, hint: 'Email'),

                  //RoundedPasswordInput(hint: 'Password'),
                   TextInputField (controller: usernameController ,icon: Icons.person,labelText: 'Username',hint: 'meme_username', ),
                  TextInputField (controller: emailController ,icon: Icons.email,labelText: 'Email',hint: 'memelord@gmail.com', ),
                  TextInputField(controller: passwordController ,icon: Icons.lock,labelText: 'Password', isObscure: true,hint: 'ex:20#26*d7'),

                  SizedBox(height: 10),

                  InkWell(  
                    child: Container(
                      child: Text('press'),
                    ),
                  onTap:() => authController.registerUser(
                  usernameController.text,
                  emailController.text,
                  passwordController.text,
                  authController.profilePhoto, 
                    ),),
                    /* title: 'SIGN UP'),   */
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}