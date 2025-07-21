import 'package:flutter/material.dart';
import '../../../core/services/firebase_user_service.dart';

import '../../home/models/post_model.dart';
import '../../home/models/user_post_model.dart';

class CreatePostProvider with ChangeNotifier {
  final FirebaseUserService _firebaseUserService = FirebaseUserService();

  PostModel createPostData = PostModel(
    title: '',
    body: '',
    links: [],
    userPostModel: UserPostModel(
      uid: '',
      displayName: '',
      email: '',
      photoURL: '',
    ),
    createdAt: DateTime.now(),
    updateAt: null,
  );

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

  void setUserPostModel(UserPostModel userPostModel) {
    createPostData = createPostData.copyWith(userPostModel: userPostModel);
    notifyListeners();
  }

  void setUpdateAtPostData(DateTime updateAt) {
    createPostData = createPostData.copyWith(updateAt: updateAt);
    notifyListeners();
  }

  void clearPostData() {
    createPostData = PostModel(
      title: '',
      body: '',
      links: [],
      userPostModel: UserPostModel(
        uid: '',
        displayName: '',
        email: '',
        photoURL: '',
      ),
      createdAt: DateTime.now(),
      updateAt: null,
    );
    notifyListeners();
  }

  void removeLinkPostData(int index) {
    final newLinks = [...createPostData.links];
    newLinks.removeAt(index);
    createPostData = createPostData.copyWith(links: newLinks);
    notifyListeners();
  }

  Future<void> createPost({
    required String userId,
    required PostModel post,
  }) async {
    await _firebaseUserService.createPost(userId: userId, post: post);
    clearPostData();
  }
}
