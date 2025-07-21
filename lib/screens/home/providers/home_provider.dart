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

  Future<void> getAllPosts(String userId) async {
    setLoading(true);
    log('getAllPosts called...');
    try {
      posts = await _firebaseUserService.getAllPostsFromAllUsers(userId);
      log('Posts fetched: ${posts.length}');
    } catch (e, stack) {
      log('getAllPosts error: $e\n$stack');
    } finally {
      setLoading(false);
      log('Loading stopped');
      notifyListeners();
    }
  }
}
