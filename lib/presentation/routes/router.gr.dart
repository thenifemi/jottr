// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/notes/note.dart';
import '../notes/note_form/note_form_screen.dart';
import '../notes/notes_overview/notes_overview_screen.dart';
import '../sign_in/sign_in_screen.dart';
import '../splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String signInScreen = '/sign-in-screen';
  static const String notesOverviewScreen = '/notes-overview-screen';
  static const String noteFormScreen = '/note-form-screen';
  static const all = <String>{
    splashScreen,
    signInScreen,
    notesOverviewScreen,
    noteFormScreen,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.signInScreen, page: SignInScreen),
    RouteDef(Routes.notesOverviewScreen, page: NotesOverviewScreen),
    RouteDef(Routes.noteFormScreen, page: NoteFormScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    SignInScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignInScreen(),
        settings: data,
      );
    },
    NotesOverviewScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NotesOverviewScreen(),
        settings: data,
      );
    },
    NoteFormScreen: (data) {
      final args = data.getArgs<NoteFormScreenArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NoteFormScreen(
          key: args.key,
          editednote: args.editednote,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension MyRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushSignInScreen() => push<dynamic>(Routes.signInScreen);

  Future<dynamic> pushNotesOverviewScreen() =>
      push<dynamic>(Routes.notesOverviewScreen);

  Future<dynamic> pushNoteFormScreen({
    Key key,
    @required Note editednote,
  }) =>
      push<dynamic>(
        Routes.noteFormScreen,
        arguments: NoteFormScreenArguments(key: key, editednote: editednote),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NoteFormScreen arguments holder class
class NoteFormScreenArguments {
  final Key key;
  final Note editednote;
  NoteFormScreenArguments({this.key, @required this.editednote});
}
