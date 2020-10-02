import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jottr/domain/core/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class MyUser with _$User {
  const factory MyUser({
    @required UniqueId id,
  }) = _User;
}
