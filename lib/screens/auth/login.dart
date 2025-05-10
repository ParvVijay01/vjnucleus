import 'package:flutter/material.dart';
import 'package:vjnucleus/screens/home/home.dart';
import 'package:vjnucleus/utility/constants/colors.dart';
import 'package:vjnucleus/utility/constants/images.dart';
import 'package:vjnucleus/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Track loading state
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Top Logo
            CircleAvatar(
              foregroundImage: AssetImage(IKImages.logo),
              radius: 150,
            ),

            // Login Form (centered)
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextField(
                          controller: emailController,
                          labelText: "Username",
                          iconShow: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is required';
                            } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            ).hasMatch(value)) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                          controller: passwordController,
                          labelText: "Password",
                          iconShow: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Minimum length 6';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            height: screenHeight / 17,
                            child: ElevatedButton(
                              onPressed:
                                  isLoading
                                      ? null
                                      : () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });

                                          Future.delayed(
                                            Duration(seconds: 2),
                                            () {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              Navigator.pushNamed(
                                                context,
                                                '/home',
                                              );
                                            },
                                          );
                                        }
                                      },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: IKColors.secondary,
                              ),
                              child:
                                  isLoading
                                      ? CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              IKColors.primary,
                                            ),
                                      )
                                      : const Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// void _login() async {
  //   if (!_formKey.currentState!.validate()) return;

  //   setState(() {
  //     isLoading = true;
  //   });

  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   bool success = await userProvider.login(
  //     context,
  //     emailController.text,
  //     passwordController.text,
  //   );

  //   if (success) {
  //     Navigator.pushReplacementNamed(context, "/home");
  //   }

  //   setState(() {
  //     isLoading = false;
  //   });
  // }
