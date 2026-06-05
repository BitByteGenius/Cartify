import 'package:flutter/material.dart';

class BannersPage extends StatelessWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banners')),
      body: const Center(child: Text('Banners Page')),
    );
  }
}
