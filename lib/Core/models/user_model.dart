class UserModel {
  UserModel({
    this.displayName,
    this.email,
    this.photoURL,
    this.totalPoints,
    this.uid,
  });

  final String? displayName;
  final String? email;
  final String? photoURL;
  final int? totalPoints;
  final String? uid;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] ?? 'Anonymous User',
      email: map['email'] ?? 'Anonymous User',
      photoURL: map['photoURL'] ?? 'Anonymous User',
      totalPoints: map['totalPoints'] is int
          ? map['totalPoints'] as int
          : int.tryParse(map['totalPoints']?.toString() ?? '') ?? 0,
      uid: map['uid'] ?? 'Anonymous User',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName ?? 'Anonymous User',
      'email': email ?? 'Anonymous User',
      'photoURL': photoURL ?? 'Anonymous User',
      'totalPoints': totalPoints ?? 0,
      'uid': uid ?? 'Anonymous User',
    };
  }
}
