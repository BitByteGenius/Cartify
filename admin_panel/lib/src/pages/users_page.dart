import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersController ctrl = Get.put(UsersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: ctrl.users.length,
          itemBuilder: (context, index) {
            final user = ctrl.users[index];

            return ListTile(
              leading: (user.photoUrl != null &&
                      user.photoUrl!.isNotEmpty)
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(user.photoUrl!),
                    )
                  : const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
              title: Text(
  user.displayName ?? user.email,
),
              subtitle: Text(
                'Role: ${user.role} • Status: ${user.status}',
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) =>
                    ctrl.handleAction(user, value),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem(
                    value: 'disable',
                    child: Text('Disable'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}