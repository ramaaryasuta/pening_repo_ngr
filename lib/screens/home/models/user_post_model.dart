class UserPostModel {
  final String uid; // from firebase
  final String displayName;
  final String email;
  final String photoURL;

  UserPostModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    return UserPostModel(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'email': email,
    'photoURL': photoURL,
  };
}
