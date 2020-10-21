import 'package:Jottr/application/notes/note_form/note_form_bloc.dart';
import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previous, current) =>
          previous.note.color != current.note.color,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 100.0,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: NoteColor.predefinedColors.length,
              separatorBuilder: (context, i) {
                return const SizedBox(width: 15.0);
              },
              itemBuilder: (context, i) {
                final itemColor = NoteColor.predefinedColors[i];
                return Material(
                  color: itemColor,
                  elevation: 4.0,
                  shape: const CircleBorder(side: BorderSide(width: 1.5)),
                  child: const SizedBox(
                    width: 60.0,
                    height: 60.0,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
