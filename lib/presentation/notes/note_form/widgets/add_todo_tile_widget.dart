import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../misc/build_context_x.dart';
import '../misc/todo_item_presentation_classes.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (_) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            (_) => TodoItemPrimitive.fromDomain(_),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.note.todos.isfull != current.note.todos.isfull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isfull,
          title: const Text('Add todo'),
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos = context.formTodos.plusElement(
              TodoItemPrimitive.empty(),
            );

            context.bloc<NoteFormBloc>().add(
                  NoteFormEvent.todosChanged(context.formTodos),
                );
          },
        );
      },
    );
  }
}
