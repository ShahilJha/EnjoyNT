import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/domain/core/entities/user.dart' as app_user;
import 'package:enjoy_nt/infrastructure/auth/user_dto.dart';
import 'package:enjoy_nt/infrastructure/core/firestore/firestore_helpers.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../domain/auth/user/i_user_repository.dart';
import '../../domain/auth/user/user_failures.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  @override
  Future<Either<UserFailure, Unit>> create(app_user.User user) async {
    try {
      final userDoc = await _firestore.userDocument();
      final userDto = UserDTO.fromDomain(user);

      await userDoc.userCollection.doc(userDto.id).set(userDto.toJson());
      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFailure.insufficientPermission());
      } else {
        // log.error(e.toString())
        return left(const UserFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<UserFailure, Unit>> delete(app_user.User user) async {
    try {
      final userDoc = await _firestore.userDocument();
      final userId = user.id.getOrCrash();

      await userDoc.userCollection.doc(userId).delete();
      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFailure.insufficientPermission());
      } else if (exception.message!.contains('NOT_FOUND')) {
        return left(const UserFailure.unableToDelete());
      } else {
        // log.error(e.toString())
        return left(const UserFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<UserFailure, Unit>> read() async {
    // _firebaseAuth.currentUser.uid

    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Either<UserFailure, Unit>> update(app_user.User user) async {
    try {
      final userDoc = await _firestore.userDocument();
      final userDto = UserDTO.fromDomain(user);

      final json = userDto.toJson();
      await userDoc.userCollection.doc(userDto.id).update(json);
      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFailure.insufficientPermission());
      } else if (exception.message!.contains('NOT_FOUND')) {
        return left(const UserFailure.unableToUpdate());
      } else {
        // log.error(e.toString())
        return left(const UserFailure.unexpected());
      }
    }
  }
}
