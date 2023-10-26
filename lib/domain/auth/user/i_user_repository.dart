import 'package:dartz/dartz.dart';
import 'package:enjoy_nt/domain/core/entities/user.dart';

import 'user_failures.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> read();
  Future<Either<UserFailure, Unit>> create(User user);
  Future<Either<UserFailure, Unit>> update(User user);
  Future<Either<UserFailure, Unit>> delete(User user);
}
