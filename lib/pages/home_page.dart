import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:IconButton(onPressed: signUserOut, icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout, color: Colors.black,)),
        ],
      ),
      body: Column(children: [
        Center(child: Text('Logged IN AS: ${user.email!}')),
        _copyButton()
      ],)
    );
  }

  // 복사 버튼.
  Widget _copyButton() {
    return CupertinoButton(
      pressedOpacity: 1,
      onPressed: () {
        signUserOut();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            '버튼 클릭',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}