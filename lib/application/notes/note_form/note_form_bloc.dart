import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc() : super(_Initial());

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
