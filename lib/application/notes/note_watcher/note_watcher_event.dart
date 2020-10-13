part of 'note_watcher_bloc.dart';

@freezed
abstract class NoteWatcherEvent with _$NoteWatcherEvent {
  const factory NoteWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory NoteWatcherEvent.watchUncompletedStarted() =
      _WatchUncompletedStarted;

  const factory NoteWatcherEvent.notesRecieved(
    Either<NoteFailure, KtList<Note>> failureOrNotes,
  ) = _NotesRecieved;
}
