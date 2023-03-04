import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordern_login_ui/components/custom_text_field.dart';
import 'package:mordern_login_ui/components/custom_button.dart';
import 'package:mordern_login_ui/components/square_tile.dart';
import 'package:mordern_login_ui/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({ super.key,required this.onTap });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    if (passwordController.text != confirmPasswordController) {
      Navigator.pop(context);
      showErrorMessage('Password don`t match!');     
      return;
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);      
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        // show error message
        showErrorMessage(e.code);
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center (
          child: Text(message,style: const TextStyle(color: Colors.black))
        ),
      );
    });
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
     body: SafeArea(child:
      SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon (
                Icons.lock,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                'Let\'s create an new account',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(controller: emailController, hintText: 'Email', obscureText: false),   
              const SizedBox(height: 10),
              CustomTextField(controller: passwordController, hintText: 'Password', obscureText: true),
              const SizedBox(height: 10),
              CustomTextField(controller: confirmPasswordController, hintText: 'Confirm Password', obscureText: true),
              const SizedBox(height: 25),
              CustomButton(onTap: signUserUp, text: 'Sign up',),
              const SizedBox(height: 50),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.8,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.8,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 50),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SquareTile(imagePath: 'lib/images/google.png', onTap: () => AuthService().signInWithGoogle()),
                  const SizedBox(width: 25),
                  //SquareTile(imagePath: 'lib/images/kakao.png')
                ],
              ),
        
              const SizedBox(height: 50),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap:widget.onTap,
                    child: const Text(
                    'Login now',
                    style: TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  )

                  )
                ],
              )
        
            ],
          ),
        ),
      )
      )
     ),
    )
     
    ;
  }
}