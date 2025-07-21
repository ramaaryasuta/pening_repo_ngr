import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screens/home/models/post_model.dart';

class FirebaseUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> getAllPostsFromAllUsers(String userId) async {
    final querySnapshot = await _firestore.collectionGroup('posts').get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return PostModel.fromJson(data);
    }).toList();
  }

  Future<void> createPost({
    required String userId,
    required PostModel post,
  }) async {
    final postRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('posts');
    await postRef.add(post.toJson());
  }
}
