import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../../../core/colors.dart';
import '../misc/build_context_x.dart';
import '../misc/todo_item_presentation_classes.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.note.todos.isfull != current.note.todos.isfull,
      listener: (context, state) {
        if (state.note.todos.isfull) {
          Flushbar(
            message: 'Want longer lists? Activate premium 💳',
            mainButton: FlatButton(
              onPressed: () {},
              child: const Text(
                'PURCHASE',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            flushbarStyle: FlushbarStyle.FLOATING,
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.all(15),
            borderRadius: 8,
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formtodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: formtodos.value.size,
            itemBuilder: (context, i) {
              return TodoTile(index: i);
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  const TodoTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    return ListTile(
      leading: Checkbox(
        activeColor: AppColors.primaryDark,
        value: todo.done,
        onChanged: (value) {
          context.formTodos = context.formTodos.map((listTodo) =>
              listTodo == todo ? todo.copyWith(done: value) : listTodo);

          context
              .bloc<NoteFormBloc>()
              .add(NoteFormEvent.todosChanged(context.formTodos));
        },
      ),
    );
  }
}
