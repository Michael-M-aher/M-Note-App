import 'package:flutter/material.dart';
import '../constants/my_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/floating_button.dart';
import '../widgets/my_dialog.dart';
import '../widgets/text_field.dart';

class NoteScreen extends StatelessWidget {
  final Map<String, dynamic> note;

  const NoteScreen({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: note['title']);
    TextEditingController dataController =
        TextEditingController(text: note['data']);
    bool isChanged() {
      if (note['title'] != titleController.text ||
          note['data'] != dataController.text) {
        return true;
      } else {
        return false;
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return isChanged() ? await onPop(context) : true;
      },
      child: Scaffold(
        floatingActionButton: MyFloatingButton(
          clk: () async {
            note['id'] == -1
                ? Navigator.pop(context)
                : await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(id: note['id']);
                    });
          },
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.white,
          ),
        ),
        backgroundColor: MyColors.myDarkGrey,
        body: SafeArea(
          child: Column(
            children: [
              MyAppBar(
                saveclk: () async {
                  await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return MyDialog(
                          text: 'Save',
                          titleText: "Save changes ?",
                          id: note['id'],
                          title: titleController.text,
                          data: dataController.text,
                        );
                      });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      MyTextField(
                        hintText: "Title",
                        fontSize: 40,
                        controller: titleController,
                      ),
                      MyTextField(
                        hintText: "Type something...",
                        fontSize: 22,
                        controller: dataController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> onPop(BuildContext context) async {
  final value = await showDialog<bool>(
      context: context,
      builder: (context) {
        return const MyDialog(
            text: 'Keep',
            titleText: "Are your sure you want discard your changes ?");
      });
  return value == true;
}
