import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../application/notes/note_form/note_form_bloc.dart';
import '../../../domain/notes/note.dart';
import '../../../injection.dart';
import '../../core/colors.dart';
import '../../routes/router.gr.dart';
import 'misc/todo_item_presentation_classes.dart';
import 'widgets/add_todo_tile_widget.dart';
import 'widgets/body_field_widget.dart';
import 'widgets/color_field_widget.dart';

class NoteFormScreen extends StatelessWidget {
  final Note editednote;

  const NoteFormScreen({
    Key key,
    @required this.editednote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editednote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => {},
            (either) {
              either.fold(
                (failure) {
                  Flushbar(
                    message: failure.map(
                      unexpected: (_) =>
                          'Unexpected error occured, please contact support.',
                      insufficientPermissions: (_) =>
                          'Insufficient Permisions.',
                      unableToUpdate: (_) =>
                          "Couldn't update note. Please contact support.",
                    ),
                    flushbarStyle: FlushbarStyle.FLOATING,
                    duration: const Duration(seconds: 3),
                    margin: const EdgeInsets.all(15),
                    borderRadius: 8,
                  ).show(context);
                },
                (_) => ExtendedNavigator.of(context).popUntil((route) =>
                    route.settings.name == Routes.notesOverviewScreen),
              );
            },
          );
        },
        buildWhen: (previous, current) => previous.isSaving != current.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              const NoteFormScreenScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          );
        },
      ),
    );
  }
}

class NoteFormScreenScaffold extends StatelessWidget {
  const NoteFormScreenScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit note' : 'Create note');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.bloc<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => FormTodos(),
            child: Form(
              // ignore: deprecated_member_use
              autovalidate: state.showErrorMessages,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BodyField(),
                    const ColorField(),
                    const AddTodoTile(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.6) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CircularProgressIndicator(
                backgroundColor: AppColors.primaryDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
