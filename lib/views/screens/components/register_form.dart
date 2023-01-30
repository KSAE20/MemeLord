import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/controllers/Auth_controller.dart';
import 'package:memelord/views/screens/components/rounded_button.dart';
import 'package:memelord/views/screens/components/text_input_field_widget.dart';

class RegisterForm extends StatefulWidget {
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
  final TextEditingController passwordController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),

                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  const SizedBox(height: 40),

                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 66,
                        backgroundImage:
                            const AssetImage("assets/images/profileicon.png"),
                        backgroundColor: const Color.fromARGB(27, 74, 154, 255),
                        child: authController.profilePhoto!.path.isNotEmpty
                            ? CircleAvatar(
                                radius: 66,
                                backgroundImage:
                                    FileImage(authController.profilePhoto!))
                            : Container(),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: () async {
                            //authController.pickImage();
                            final pickedImage = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedImage != null) {
                              Get.snackbar('Profile Picture',
                                  'You have successfully selected your profile picture!');
                            }
                            authController.pickedImage =
                                (File(pickedImage!.path));
                            setState(() {});
                          },
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
                  TextInputField(
                    controller: widget.usernameController,
                    icon: Icons.person,
                    labelText: 'Username',
                    hint: 'meme_username',
                  ),
                  TextInputField(
                    controller: widget.emailController,
                    icon: Icons.email,
                    labelText: 'Email',
                    hint: 'memelord@gmail.com',
                  ),
                  TextInputField(
                      controller: widget.passwordController,
                      icon: Icons.lock,
                      labelText: 'Password',
                      isObscure: true,
                      hint: 'ex:20#26*d7'),

                  SizedBox(height: 10),

                  InkWell(
                    child: Container(

                      child:  Text('press'),

                    ),
                    onTap: () => authController.registerUser(
                      widget.usernameController.text,
                      widget.emailController.text,
                      widget.passwordController.text,
                      authController.profilePhoto,
                    ),
                  ),
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
