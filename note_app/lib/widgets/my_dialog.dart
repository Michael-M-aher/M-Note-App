import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/my_colors.dart';
import '../constants/strings.dart';
import '../provider/note_provider.dart';

class MyDialog extends StatelessWidget {
  final String text;
  final String titleText;
  final String? title;
  final String? data;
  final int? id;

  const MyDialog(
      {super.key,
      required this.text,
      required this.titleText,
      this.title,
      this.data,
      this.id});

  @override
  Widget build(BuildContext context) {
    void saveChanges() {
      id == -1
          ? NoteProvider.insertNote({'title': title, 'data': data})
          : NoteProvider.updateNote({'id': id, 'title': title, 'data': data});
      Navigator.pushNamedAndRemoveUntil(context, mainScreen, (route) => false);
    }

    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 330,
        height: 236,
        decoration: BoxDecoration(
          color: MyColors.myDarkGrey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              size: 36,
              color: MyColors.myInfoIcon,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 262,
              height: 67,
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: MyColors.myLightGrey,
                  fontWeight: FontWeight.normal,
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyBtn(
                  text: "Discard",
                  onPressed: () {
                    text == 'Save'
                        ? Navigator.of(context).pop()
                        : Navigator.pushNamedAndRemoveUntil(
                            context, mainScreen, (route) => false);
                  },
                  color: MyColors.myRed,
                ),
                MyBtn(
                  text: text,
                  onPressed: () {
                    text == 'Save'
                        ? saveChanges()
                        : Navigator.of(context).pop();
                  },
                  color: MyColors.myGreen,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DeleteDialog extends StatelessWidget {
  final int id;

  const DeleteDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 330,
        height: 236,
        decoration: BoxDecoration(
          color: MyColors.myDarkGrey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              size: 36,
              color: MyColors.myInfoIcon,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 262,
              height: 67,
              child: Text(
                "Are you sure ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: MyColors.myLightGrey,
                  fontWeight: FontWeight.normal,
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyBtn(
                  text: "Delete",
                  onPressed: () {
                    NoteProvider.deleteNote(id);
                    Navigator.pushNamedAndRemoveUntil(
                        context, mainScreen, (route) => false);
                  },
                  color: MyColors.myRed,
                ),
                MyBtn(
                  text: "Discard",
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  color: MyColors.myGrey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyBtn extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;
  const MyBtn(
      {required this.text,
      required this.onPressed,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 39,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          )),
    );
  }
}
