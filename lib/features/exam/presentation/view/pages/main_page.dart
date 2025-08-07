import 'package:exam_app/features/exam/presentation/view/pages/explore_page.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/cutom_nav_bar.dart';
import 'package:exam_app/features/profile/presentation/views/pages/update_profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: curentPage(currentIndex),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTabSelected: onTabChanged,
      ),
    );
  }
  
  Widget curentPage(int index) {
    switch (currentIndex) {
      case 0:
        return ExplorePage();
      case 1:
        return const Center(child: Text('Result Page')); // Placeholder for Result Page
      case 2:
        return const UpdateProfilePage(); 
      default:
        return ExplorePage();
    }
  }
}
