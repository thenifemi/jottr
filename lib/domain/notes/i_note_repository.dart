import 'package:Jottr/domain/notes/note.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  //watch notes
  //watch uncompleted notes
  //CUD
  //C Read UD

  Stream<KtList<Note>> watchAll();
}
