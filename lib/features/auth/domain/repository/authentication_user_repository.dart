import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/error/failure.dart';
import 'package:flutter_project/features/auth/data/models/user_model.dart';

abstract class LoginUserRepository {
  Future<Either<Failure, User>> login({required User user});
}
//Bu abstract class’ı interface olarak kullanacağız.