import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/note_watcher/note_watcher_bloc.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadingProgress: (_) =>
              const Center(child: CircularProgressIndicator()),
          loadSuccess: (state) {
            return ListView.builder(
              itemCount: state.notes.size,
              itemBuilder: (context, i) {
                final note = state.notes[i];
                if (note.failureOption.isSome()) {
                  return Container(
                    color: Colors.red,
                    height: 100.0,
                    width: 100.0,
                  );
                } else {
                  return Container(
                    color: Colors.green,
                    height: 100.0,
                    width: 100.0,
                  );
                }
              },
            );
          },
          loadFailure: (_) => Container(
            color: Colors.yellow,
            height: 200.0,
            width: 200.0,
          ),
        );
      },
    );
  }
}