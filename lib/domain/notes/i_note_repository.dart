import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'note.dart';
import 'note_failure.dart';

abstract class INoteRepository {
  //watch notes
  //watch uncompleted notes
  //CUD
  //C Read UD

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create();
}
