// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest1/pages/signUp.dart';
import 'package:firebasetest1/squaretile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgotPasswordPage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signInUser() async {
    //loading circle'
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Wrong Email'),
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Wrong Password'),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 50,
              ),
              //icon
              Icon(Icons.android, size: 100),
              SizedBox(
                height: 20,
              ),
              //hello again
              Text(
                'Hello Again!',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              SizedBox(
                height: 25,
              ),
              //welcome back
              Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),

              //text field 1

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email', border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              //text field 2
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10),
                    child: GestureDetector(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPasswordPage() ,));
                      }, 
                        child: Text(
                      'Forgot password?',
                      style: GoogleFonts.lato(color: Colors.deepPurple),
                    )),
                  ),
                ],
              ),
              //button=>sign in
              GestureDetector(
                onTap: signInUser,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 18),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //not a member? sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Not a member? ',
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      'Register now',
                      style: GoogleFonts.lato(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                  Expanded(
                      child: Text(
                    ' Or continue with',
                    style: GoogleFonts.lato(color: Colors.grey[700]),
                  )),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/google.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SquareTile(imagePath: 'assets/facebook.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
