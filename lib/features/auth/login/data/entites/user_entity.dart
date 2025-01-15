class UserEntity {
  final String email;
  final String name;
  final String uId;

  UserEntity({
    required this.email,
    required this.name,
    required this.uId,
  });
  toMap() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
    };
  }
}
