import 'package:firebase_auth/firebase_auth.dart';
import 'package:jottr/domain/auth/user.dart';
import 'package:jottr/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  MyUser toDomain() {
    return MyUser(id: UniqueId.fromUniqueString(uid));
  }
}
