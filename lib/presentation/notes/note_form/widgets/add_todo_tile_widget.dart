import 'package:Jottr/application/notes/note_form/note_form_bloc.dart';
import 'package:Jottr/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Add todo'),
      leading: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(Icons.add),
      ),
      onTap: () {
        context.bloc<NoteFormBloc>().add(
              NoteFormEvent.todosChanged(listOf(
                TodoItemPrimitive.empty(),
              )),
            );
      },
    );
  }
}
