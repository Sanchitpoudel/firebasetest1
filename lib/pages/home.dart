// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List noteTitle = ['Fitness', 'Flutter', 'Study'];
    List notes = ['Work', 'Read', 'Study'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 35, 31, 43),
          title: Text(
            'Learning Firebase',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          ),
        ),
        drawer: Drawer(
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
          ),
        ),
        body: GridView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: noteTitle.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Box(
              texts: noteTitle[index],
              notes: notes[index],
            );
          },
        ));
  }
}
