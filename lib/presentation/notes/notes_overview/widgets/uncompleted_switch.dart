import 'package:Jottr/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UncompletedSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);

    return InkResponse(
      onTap: () {
        toggleState.value = !toggleState.value;
        context.bloc<NoteWatcherBloc>().add(toggleState.value
            ? const NoteWatcherEvent.watchUncompletedStarted()
            : const NoteWatcherEvent.watchAllStarted());
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: toggleState.value
            ? const Icon(
                Icons.check_box_outline_blank_rounded,
                key: Key('outline'),
              )
            : const Icon(
                Icons.indeterminate_check_box_rounded,
                key: Key('indeterminate'),
              ),
      ),
    );
  }
}
