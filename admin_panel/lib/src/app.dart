import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cartify Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006D77),
        ),
      ),
      initialRoute: AppRoutes.dashboard,
      getPages: AppRoutes.pages,
    );
  }
}