import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  SquareTile({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16)),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
