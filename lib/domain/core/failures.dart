import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  //Auth failures
  const factory ValueFailure.invalidName({
    @required T failedValure,
  }) = InvalidName<T>;

  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;

  //Notes failures
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;

  const factory ValueFailure.listToLong({
    @required T failedValue,
    @required int max,
  }) = ListToLong<T>;
}
