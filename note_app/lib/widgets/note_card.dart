import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../constants/my_colors.dart';

class NoteCard extends StatelessWidget {
  final String text;
  final String data;
  final Function() onPressed;

  const NoteCard(
      {required this.text,
      required this.data,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Card(
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
        color: MyColors.myGrey,
        child: ListTile(
          onTap: onPressed,
          contentPadding: const EdgeInsets.all(15),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
              text,
              textAlign: isRTL(text) ? TextAlign.right : TextAlign.left,
              softWrap: true,
              style: const TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          subtitle: Text(
            data,
            textAlign: isRTL(data) ? TextAlign.right : TextAlign.left,
            maxLines: null,
            softWrap: true,
            style: const TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}

bool isRTL(String text) {
  return intl.Bidi.detectRtlDirectionality(text);
}
