import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteNotFound extends StatelessWidget {
  const NoteNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/File searching-cuate.png"),
            Text(
              "No Notes found.",
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
