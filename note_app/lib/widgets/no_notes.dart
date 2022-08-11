import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Notebook-rafiki.png"),
            Text(
              "Create your first note !",
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
