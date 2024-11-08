class RegisterUserModel {
  final String userName;
  final String email;
  final String mobileNumber;
  final String uId;
  final String profilePic;

  RegisterUserModel(
      {required this.userName,
      required this.profilePic,
      required this.email,
      required this.mobileNumber,
      required this.uId});

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      profilePic: json['profilePic'],
      userName: json['userName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      uId: json['uId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'profilePic': profilePic,
      'email': email,
      'mobileNumber': mobileNumber,
      'uId': uId,
    };
  }
}
