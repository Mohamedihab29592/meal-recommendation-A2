class UserModel {
  final String userName;
  final String email;
  final String phone;
  final String profileURL;
  final String uId;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.profileURL,
    required this.uId,
  });

  static const String userNameKey = "userName";
  static const String emailKey = "email";
  static const String phoneKey = "mobileNumber";
  static const String profileURLKey = "profilePic";
  static const String uIdKey = "uId";

  factory UserModel.initState() {
    return UserModel(
      userName: "",
      email: "",
      phone: "",
      profileURL: "",
      uId: "",
    );
  }

  factory UserModel.fromJSON(dynamic data) {
    return UserModel(
      userName: data[userNameKey],
      email: data[emailKey],
      phone: data[phoneKey],
      profileURL: data[profileURLKey],
      uId: data[uIdKey],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      userNameKey: userName,
      emailKey: email,
      phoneKey: phone,
      profileURLKey: profileURL,
      uIdKey: uId,
    };
  }
}
