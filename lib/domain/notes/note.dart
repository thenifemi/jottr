import 'package:Jottr/domain/core/value_objects.dart';
import 'package:Jottr/domain/notes/todo_item.dart';
import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note {
  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> todos,
  }) = _Note;
}
