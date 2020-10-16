import 'package:Jottr/application/auth/auth_bloc.dart';
import 'package:Jottr/application/notes/note_actor/note_actor_bloc.dart';
import 'package:Jottr/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:Jottr/injection.dart';
import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            listener: (context, state) {},
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
              const IconButton(
                  icon: Icon(
                    Icons.check_box_rounded,
                    color: AppColors.primaryDark,
                  ),
                  onPressed: null),
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
