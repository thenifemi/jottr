import 'package:firebase_auth/firebase_auth.dart';
import 'package:Jottr/domain/auth/myUser.dart';
import 'package:Jottr/domain/core/value_objects.dart';

extension FirebaseUserDomainX on User {
  MyUser toDomain() {
    return MyUser(id: UniqueId.fromUniqueString(uid));
  }
}
