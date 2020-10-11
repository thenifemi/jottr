import 'package:Jottr/domain/core/value_objects.dart';
import 'package:Jottr/domain/notes/todo_item.dart';
import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
abstract class TodoItemDTO implements _$TodoItemDTO {
  const TodoItemDTO._();

  const factory TodoItemDTO({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDTO;

  factory TodoItemDTO.fromDomain(TodoItem todoItem) {
    return TodoItemDTO(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }
}
