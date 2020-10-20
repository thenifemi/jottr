import 'package:Jottr/presentation/notes/note_form/note_form_screen.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../notes/notes_overview/notes_overview_screen.dart';
import '../sign_in/sign_in_screen.dart';
import '../splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: SignInScreen),
    CupertinoRoute(page: NotesOverviewScreen),
    CupertinoRoute(page: NoteFormScreen, fullscreenDialog: true),
  ],
  generateNavigationHelperExtension: true,
)
class $MyRouter {}
