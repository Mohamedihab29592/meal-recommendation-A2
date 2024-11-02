import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendations_a2/core/utiles/constant.dart';
import 'package:meal_recommendations_a2/core/errors/firebase_errors.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/domain/repo_interface/profile_repo.dart';
import 'package:meal_recommendations_a2/features/profile/data/data_source/firebase_storage_services.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl({required this.firebaseNetworkService, required this.firebaseStorageServices});

  final FirebaseNetworkService firebaseNetworkService;
  final FirebaseStorageServices firebaseStorageServices;
  late UserModel userModel;

  @override
  Future<void> deleteImage() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, FirebaseServerFailure>> updateImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
      String url = defaultProfileImageURL;
      if (imagePicked != null) {
        File file = File(imagePicked.path);
        String uid = FirebaseAuth.instance.currentUser!.uid;
        url = await firebaseStorageServices.storeInFirebaseStorage(file, uid);
        await firebaseNetworkService.updateDocument("users", uid, {UserModel.profileURLKey: url});
      }

      return left(url);
    } catch (_) {
      return right(FirebaseServerFailure("Error try again"));
    }
  }

  @override
  Future<Either<UserModel, FirebaseServerFailure>> getProfileData() async {
    try {
      Map<String, dynamic>? res = await firebaseNetworkService.getDocument("users", FirebaseAuth.instance.currentUser!.uid);
      userModel = UserModel.fromJSON(res);
      return left(userModel);
    } catch (e) {
      return right(FirebaseServerFailure("Error try again"));
    }
  }

  @override
  Future<Either<void, FirebaseServerFailure>> updateProfileData(UserModel userModel) async {
    try {
      await firebaseNetworkService.updateDocument("users", userModel.uId, userModel.toMap());
      return left(null);
    } catch (_) {
      return right(FirebaseServerFailure("Error try again"));
    }
  }

  @override
  Future<Either<void, FirebaseServerFailure>> updatePassword(String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FirebaseServerFailure.fromFirebaseErr(e));
    } catch (_) {
      return right(FirebaseServerFailure("Error try again"));
    }
  }
}
