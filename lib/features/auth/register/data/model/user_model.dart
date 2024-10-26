class UserModel {
  final String userName;
  final String email;
  final String mobileNumber;
  final String uId;

  UserModel(
      {required this.userName,
      required this.email,
      required this.mobileNumber,
      required this.uId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      uId: json['uId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'mobileNumber': mobileNumber,
      'uId': uId,
    };
  }
}
