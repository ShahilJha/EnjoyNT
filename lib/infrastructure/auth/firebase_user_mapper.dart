import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/core/entities/user.dart' as app_user;
import '../../domain/core/value_objects/unique_id.dart';

extension FirebaseUserDomainX on User {
  app_user.User toDomain() {
    return app_user.User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
