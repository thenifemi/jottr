import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
abstract class User with _$User {
  const factory User() = _User;
}
