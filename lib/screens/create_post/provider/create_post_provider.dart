import 'package:flutter/material.dart';
import '../../../core/services/firebase_user_service.dart';

import '../../home/models/post_model.dart';

class CreatePostProvider with ChangeNotifier {
  final FirebaseUserService _firebaseUserService = FirebaseUserService();

  PostModel createPostData = PostModel(title: '', body: '', links: []);

  void setTitlePostData(String title) {
    createPostData = createPostData.copyWith(title: title);
    notifyListeners();
  }

  void setBodyPostData(String body) {
    createPostData = createPostData.copyWith(body: body);
    notifyListeners();
  }

  void setLinksPostData(LinkPost link) {
    final newLinks = [...createPostData.links, link];
    createPostData = createPostData.copyWith(links: newLinks);
    notifyListeners();
  }

  Future<void> createPost({
    required String userId,
    required PostModel post,
  }) async {
    await _firebaseUserService.createPost(userId: userId, post: post);
  }
}
