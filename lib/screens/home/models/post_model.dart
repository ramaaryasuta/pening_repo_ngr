import 'package:pening_repository_ngr/screens/home/models/user_post_model.dart';

class PostModel {
  final String title;
  final String body;
  final List<LinkPost> links;
  final UserPostModel userPostModel;
  final DateTime createdAt;
  final DateTime? updateAt;

  PostModel({
    required this.title,
    required this.body,
    required this.links,
    required this.userPostModel,
    required this.createdAt,
    this.updateAt,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'links': links.map((e) => e.toJson()).toList(),
    'userPostModel': userPostModel.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'updateAt': updateAt?.toIso8601String(),
  };

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      links: (json['links'] as List<dynamic>? ?? [])
          .map((e) => LinkPost.fromJson(e))
          .toList(),
      userPostModel: UserPostModel.fromJson(json['userPostModel'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updateAt: json['updateAt'] != null
          ? DateTime.parse(json['updateAt'] ?? '')
          : null,
    );
  }

  // copy with
  PostModel copyWith({
    String? title,
    String? body,
    List<LinkPost>? links,
    UserPostModel? userPostModel,
    DateTime? createdAt,
    DateTime? updateAt,
  }) {
    return PostModel(
      title: title ?? this.title,
      body: body ?? this.body,
      links: links ?? this.links,
      userPostModel: userPostModel ?? this.userPostModel,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}

class LinkPost {
  final String title;
  final String url;

  LinkPost({required this.title, required this.url});

  Map<String, dynamic> toJson() => {'title': title, 'url': url};

  factory LinkPost.fromJson(Map<String, dynamic> json) {
    return LinkPost(title: json['title'] ?? '', url: json['url'] ?? '');
  }
}
