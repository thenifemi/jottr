import 'package:Jottr/application/notes/note_form/note_form_bloc.dart';
import 'package:Jottr/domain/notes/value_objects.dart';
import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BodyField extends HookWidget {
  const BodyField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Note",
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.primarygray,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5.0),
            TextFormField(
              controller: textEditingController,
              cursorColor: AppColors.primaryDark,
              // ignore: avoid_bool_literals_in_conditional_expressions
              style: const TextStyle(
                color: AppColors.primarygray,
              ),
              maxLength: NoteBody.maxLength,
              maxLines: null,
              minLines: 8,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                labelStyle: TextStyle(
                  color: AppColors.primarygray,
                  fontSize: 14.0,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) => context
                  .bloc<NoteFormBloc>()
                  .add(NoteFormEvent.bodyChanged(value)),
              validator: (_) => context
                  .bloc<NoteFormBloc>()
                  .state
                  .note
                  .body
                  .value
                  .fold(
                    (f) => f.maybeMap(
                      empty: (f) => 'Cannot be empty',
                      exceedingLength: (f) => 'Exceeding length, max: ${f.max}',
                      orElse: () => null,
                    ),
                    (r) => null,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
