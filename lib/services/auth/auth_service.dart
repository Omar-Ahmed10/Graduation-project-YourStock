import 'package:firebase_auth/firebase_auth.dart';
import 'package:yourstock/services/auth/auth_provider.dart';
import 'package:yourstock/services/auth/auth_user.dart';
import 'package:yourstock/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);
  
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String confirmpassword,
  }) =>
      provider.createUser(
        email: email,
        password: password,
        confirmpassword: confirmpassword,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<User?> signInWithGoogle() => provider.signInWithGoogle();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
  
  @override
  String? get userInfo => provider.userInfo;
}
