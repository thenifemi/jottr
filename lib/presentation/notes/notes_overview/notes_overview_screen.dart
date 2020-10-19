import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/notes/note_actor/note_actor_bloc.dart';
import '../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../injection.dart';
import '../../core/colors.dart';
import '../../routes/router.gr.dart';
import 'widgets/notes_overview_body_widget.dart';
import 'widgets/uncompleted_switch.dart';

class NotesOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unAuthenticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.signInScreen),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  Flushbar(
                    message: state.noteFailure.map(
                      unexpected: (_) =>
                          'Unexpected error occured while deleting! Please Contact support',
                      insufficientPermissions: (_) =>
                          'Insufficient Permissions ',
                      unableToUpdate: (_) => 'Impossible error',
                    ),
                    flushbarStyle: FlushbarStyle.FLOATING,
                    duration: const Duration(seconds: 4),
                    margin: const EdgeInsets.all(15),
                    borderRadius: 8,
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Jottr',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 24.0,
              ),
            ),
            actions: [
              UncompletedSwitch(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
                  },
                  child: const CircleAvatar(),
                ),
              ),
            ],
            elevation: 0.0,
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO: Navigate to NoteFormScreen
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
