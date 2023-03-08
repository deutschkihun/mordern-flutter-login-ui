// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordern_login_ui/components/custom_text_field.dart';
import 'package:mordern_login_ui/components/custom_button.dart';
import 'package:mordern_login_ui/components/square_tile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({ super.key,required this.onTap });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {

    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
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

  void signInWithGoogle() async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator());
    });

    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    // finally, lets sign in
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pop(context);
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
     body: SafeArea(child:
      SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50),
              const Icon (
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              CustomTextField(controller: emailController, hintText: 'Email', obscureText: false),   
              const SizedBox(height: 10),
              CustomTextField(controller: passwordController, hintText: 'Password', obscureText: true),
              const SizedBox(height: 25),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color:Colors.grey.shade600),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
        
              CustomButton(onTap: signUserIn, text: 'Sign in',),
              
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
                  SquareTile(imagePath: 'lib/images/google.png', onTap:  () =>  signInWithGoogle()),
                  const SizedBox(width: 25),
                  //SquareTile(imagePath: 'lib/images/kakao.png')
                ],
              ),
              const SizedBox(height: 50),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap:widget.onTap,
                    child: const Text(
                    'Register now',
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