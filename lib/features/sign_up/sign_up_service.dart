import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../helper/config/handler/request_status.dart';

class SignUpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<RequestStatus, User?>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        print(credential);
        print(credential.user?.email);
        print('Email login successful.');
        print('User email verified: ${credential.user?.emailVerified}');
        return Right(credential.user);
      } else {
        print('Email login failed: No user returned.');
        return const Left(RequestStatus.failure);
      }
    } on FirebaseAuthException catch (e) {
      print('During email login: ${e.toString()}');

      return const Left(RequestStatus.credentialFailure);
    } on TypeError catch (e) {
      print('Type error during email login: ${e.toString()}');
      return const Left(RequestStatus.failure);
    } catch (e) {
      print('Unexpected error during email login: $e');
      return const Left(RequestStatus.failure);
    }
  }
}
