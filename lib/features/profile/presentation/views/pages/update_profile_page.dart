import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Profile')),
      body: const Center(
        child: const Column(children: [Text('Update Profile'), SizedBox(height: 20)]),
      ),
    );
  }
}
