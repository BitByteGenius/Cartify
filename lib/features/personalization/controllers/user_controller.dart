import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/authentication/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert Name to first and last name
  final nameParts =
    UserModel.nameParts(userCredentials.user?.displayName ?? '');

final username =
    UserModel.generateUsername(userCredentials.user?.displayName ?? '');

final user = UserModel(
  id: userCredentials.user!.uid,
  firstName: nameParts.isNotEmpty ? nameParts[0] : '',
  lastName: nameParts.length > 1
      ? nameParts.sublist(1).join(' ')
      : '',
  email: userCredentials.user?.email ?? '',
  username: username,
  phoneNumber: userCredentials.user?.phoneNumber ?? '',
  profilePicture: userCredentials.user?.photoURL ?? '',
);

await UserRepo.instance.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile.",
      );
    }
  }
}
