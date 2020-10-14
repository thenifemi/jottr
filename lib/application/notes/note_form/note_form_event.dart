part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.bodyChanged(String bodyStr) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;
  const factory NoteFormEvent.todosChanged(List<String> todos) = _TodosChanged;
}
