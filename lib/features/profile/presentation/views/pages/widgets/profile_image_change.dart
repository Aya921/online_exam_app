import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImageChange extends StatelessWidget {
  const ProfileImageChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.blue.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FittedBox(
                  child: IconButton(
                    color: AppColors.white,
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      // Logic to change profile image
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
