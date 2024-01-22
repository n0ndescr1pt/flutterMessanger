import 'package:flutter/material.dart';
import 'package:flutter_messnger/components/my_button.dart';
import 'package:flutter_messnger/components/my_text_field.dart';

class MyRegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const MyRegisterPage({super.key, required this.onTap});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),

                //logo
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[800],
                ),

                const SizedBox(height: 50),

                //welcome message
                const Text(
                  "create acount",
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 50),

                //emailTextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                //PasswordTextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                //ConfirmPasswordTextField
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                //Button
                MyButton(onTap: signUp, text: "Sign Up"),

                const SizedBox(height: 20),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?"),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Login now", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}