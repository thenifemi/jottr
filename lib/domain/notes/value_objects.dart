import 'dart:ui';

import 'package:Jottr/domain/core/value_tranformers.dart';
import 'package:Jottr/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingeLine),
    );
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const List<Color> predefinedColors = [
    Color(0xff264653), //Charcaol
    Color(0xff2a9d8f), //Persian Green
    Color(0xffe9c46a), //Orange Yellow Crayola
    Color(0xfff4a261), //Sandy Brown
    Color(0xffe76f51), //Burnt Sienna
    Color(0xffa8dadc), //Powder Blue
    Color(0xff457b9d), //Celadon Blue
  ];

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(right(makeColorOpaque(input)));
  }

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    assert(input != null);
    return List3._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isfull {
    return length == maxLength;
  }
}
