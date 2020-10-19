import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/notes/i_note_repository.dart';
import '../../domain/notes/note.dart';
import '../../domain/notes/note_failure.dart';
import '../../infastructure/core/firestore_helpers.dart';
import 'note_dtos.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).set(noteDTO.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        //log error
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).update(noteDTO.toJson());

      return right(unit);
    } on PlatformException catch (e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        //log error
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();

      await userDoc.noteCollection.doc(noteId).delete();

      return right(unit);
    } on PlatformException catch (e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        //log error
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    yield left(const NoteFailure.insufficientPermissions());

    // final userDoc = await _firestore.userDocument();
    // yield* userDoc.noteCollection
    //     .orderBy('serverTimeStamp', descending: true)
    //     .snapshots()
    //     .map(
    //       (snapshot) => right<NoteFailure, KtList<Note>>(
    //         snapshot.docs
    //             .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
    //             .toImmutableList(),
    //       ),
    //     )
    //     .handleError((e) {
    //   if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
    //     return left(const NoteFailure.insufficientPermissions());
    //   } else {
    //     //log error
    //     return left(const NoteFailure.unexpected());
    //   }
    // });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(
              (doc) => NoteDTO.fromFirestore(doc).toDomain(),
            ))
        .map((notes) => right<NoteFailure, KtList<Note>>(
              notes
                  .where((note) =>
                      note.todos.getOrCrash().any((todoItem) => !todoItem.done))
                  .toImmutableList(),
            ))
        .handleError((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        //log error
        return left(const NoteFailure.unexpected());
      }
    });
  }
}
