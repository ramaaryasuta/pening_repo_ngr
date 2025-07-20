import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_services.dart';
import '../../../shared/utils/preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  User? _user;

  AuthenticationProvider() {
    _authServices.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  Future<UserCredential?> login() async {
    final result = await _authServices.signInWithGoogle();
    if (result != null) {
      setIsLogged(true);
      return result;
    }
    return null;
  }

  Future<void> logout() async {
    setIsLogged(false);
    await _authServices.signOut();
  }
}
