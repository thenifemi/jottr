import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jottr/application/core/errors.dart';
import 'package:uuid/uuid.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  ///Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isvalid() => value.isRight();

  @override
  List<Object> get props => [value];
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }
  const UniqueId._(this.value);
}
