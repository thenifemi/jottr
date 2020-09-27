import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidName({
    @required String failedValure,
  }) = InvalidName<T>;

  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}
