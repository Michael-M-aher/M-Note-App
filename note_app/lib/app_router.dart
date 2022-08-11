import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'screens/main_screen.dart';
import 'screens/note_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case noteScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => NoteScreen(note: args),
        );
      case addNoteScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const NoteScreen(note: {'title': "", 'data': "", 'id': -1}),
        );
      default:
        return null;
    }
  }
}
