import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
              return TodoTile(
                index: i,
                key: ValueKey(context.formTodos[i].id),
              );
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
    final todo = context.formTodos.getOrElse(
      index,
      (_) => TodoItemPrimitive.empty(),
    );

    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outline,
          color: Colors.red,
          onTap: () {
            context.formTodos = context.formTodos.minusElement(todo);
            context
                .bloc<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryDark),
            borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 6.0,
        ),
        child: ListTile(
          leading: Checkbox(
            activeColor: AppColors.primaryDark,
            value: todo.done,
            onChanged: (value) {
              context.formTodos = context.formTodos.map((listTodo) =>
                  listTodo == todo ? todo.copyWith(done: value) : listTodo);

              context.bloc<NoteFormBloc>().add(
                    NoteFormEvent.todosChanged(context.formTodos),
                  );
            },
          ),
          title: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Todo',
              counterText: '',
              border: InputBorder.none,
            ),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodos.map((listTodo) =>
                  listTodo == todo ? todo.copyWith(name: value) : listTodo);

              context.bloc<NoteFormBloc>().add(
                    NoteFormEvent.todosChanged(context.formTodos),
                  );
            },
            validator: (_) {
              return context.bloc<NoteFormBloc>().state.note.todos.value.fold(
                    // Failure stemming from TodoList length should NOT be displayed by the individual TextformFields
                    (f) => null,
                    (todoList) => todoList[index].name.value.fold(
                          (f) => f.maybeMap(
                            orElse: () => null,
                            empty: (_) => 'Cannot be empty',
                            exceedingLength: (_) => 'Too long',
                            multiline: (_) => 'Has to be in a single line',
                          ),
                          (_) => null,
                        ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
