import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dartz/dartz.dart';

import '../../helper/config/handler/request_status.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Either<RequestStatus, User?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    print('in login service');
    print(email);
    print(password);
    try {
      print('getting into try');
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('after trying send login');
      print(email);
      print(password);
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

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Google sign-in cancelled by user.');
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        print('Google login successful.');
        return userCredential.user;
      } else {
        print('Google login failed: No user returned.');
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException during Google login: ${e.message}');
      return null;
    } on TypeError catch (e) {
      print('Type error during Google login: ${e.toString()}');
      return null;
    } catch (e) {
      print('Unexpected error during Google login: $e');
      return null;
    }
  }
}
