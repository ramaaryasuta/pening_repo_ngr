import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/post_model.dart';

import '../../../core/services/firebase_user_service.dart';

class HomeProvider with ChangeNotifier {
  final FirebaseUserService _firebaseUserService = FirebaseUserService();

  List<PostModel> posts = [];

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllPosts() async {
    setLoading(true);
    try {
      posts = await _firebaseUserService.getAllPostsFromAllUsers();
    } catch (e) {
      log('getAllPosts error: $e');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
