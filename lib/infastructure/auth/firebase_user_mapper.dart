import 'package:firebase_auth/firebase_auth.dart';
import 'package:jottr/domain/auth/myUser.dart';
import 'package:jottr/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  MyUser toDomain() {
    return MyUser(id: UniqueId.fromUniqueString(uid));
  }
}
