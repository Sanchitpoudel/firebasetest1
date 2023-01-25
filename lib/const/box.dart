import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Box extends StatelessWidget {
  final String texts;
    final String notes;

  Box({super.key, required this.texts,required this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 40, 36, 49),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 6.0, top: 4, bottom: 0),
                    child: Text(
                      texts,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Expanded(
                child: Container(
                  child: Text(notes),
                ),
              )
            ],
          )),
    );
  }
}
