import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pening_repository_ngr/screens/auth/providers/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  User? _user;

  AuthProvider() {
    _authServices.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  Future<void> login() async {
    await _authServices.signInWithGoogle();
  }

  Future<void> logout() async {
    await _authServices.signOut();
  }
}
