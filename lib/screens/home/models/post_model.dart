class PostModel {
  final String title;
  final String body;
  final List<LinkPost> links;

  PostModel({required this.title, required this.body, required this.links});

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'links': links.map((e) => e.toJson()).toList(),
  };

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      links: (json['links'] as List<dynamic>? ?? [])
          .map((e) => LinkPost.fromJson(e))
          .toList(),
    );
  }

  // copy with
  PostModel copyWith({String? title, String? body, List<LinkPost>? links}) {
    return PostModel(
      title: title ?? this.title,
      body: body ?? this.body,
      links: links ?? this.links,
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
