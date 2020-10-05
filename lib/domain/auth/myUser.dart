import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/value_objects.dart';

part 'myUser.freezed.dart';

@freezed
abstract class MyUser with _$MyUser {
  const factory MyUser({
    @required UniqueId id,
  }) = _User;
}
