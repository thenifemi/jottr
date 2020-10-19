import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/auth/myUser.dart';
import '../../domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  MyUser toDomain() {
    return MyUser(id: UniqueId.fromUniqueString(uid));
  }
}
