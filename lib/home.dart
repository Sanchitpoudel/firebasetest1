// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Logged in as ' + user.email!),
          MaterialButton(
            color: Colors.deepPurple,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              'LOGOUT',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
