import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mordern_login_ui/pages/login_or_register.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
const AuthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Text('something went wrong');
          } else {
            return const LoginOrRegister();
          }
        }
        ),
    );
  }
} 