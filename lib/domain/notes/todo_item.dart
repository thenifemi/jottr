import 'package:Jottr/domain/core/failures.dart';
import 'package:Jottr/domain/core/value_objects.dart';
import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const TodoItem._();

  // ignore: sort_unnamed_constructors_first
  const factory TodoItem({
    @required UniqueId id,
    @required TodoName name,
    @required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (r) => none());
  }
}
