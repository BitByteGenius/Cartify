import 'package:get/get.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

class UsersController extends GetxController {
  var isLoading = true.obs;
  var users = <UserModel>[].obs;
  final UserRepository _repo = UserRepository();

  @override
  void onInit() {
    super.onInit();
    _loadUsers();
  }

  void _loadUsers() async {
    isLoading.value = true;
    final list = await _repo.getAll();
    users.assignAll(list);
    isLoading.value = false;
  }

  void handleAction(UserModel user, String action) async {
    switch (action) {
      case 'edit':
        // TODO: navigate to edit screen (not implemented yet)
        break;
      case 'disable':
        await _repo.update(user.uid, user..status = 'disabled');
        _loadUsers();
        break;
      case 'delete':
        await _repo.delete(user.uid);
        _loadUsers();
        break;
    }
  }
}
