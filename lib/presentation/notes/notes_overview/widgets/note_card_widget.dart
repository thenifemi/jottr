import 'package:Jottr/domain/notes/todo_item.dart';
import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';

import '../../../../domain/notes/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          //TODO: Implement Navigation
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18.0),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4.0),
                Wrap(
                  spacing: 8.0,
                  children: [
                    ...note.todos
                        .getOrCrash()
                        .map(
                          (todo) => TodoDisplay(todo: todo),
                        )
                        .iter,
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({
    Key key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.done)
          const Icon(
            Icons.check_box,
            color: AppColors.primaryDark,
          ),
        if (!todo.done)
          const Icon(
            Icons.check_box_outline_blank,
            color: AppColors.primaryDark,
          ),
        Text(
          todo.name.getOrCrash(),
          style: const TextStyle(fontSize: 14.0),
        )
      ],
    );
  }
}
