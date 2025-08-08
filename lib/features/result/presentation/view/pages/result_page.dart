import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/result/presentation/view/widgets/custum_list_view.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  
  const ResultPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Results",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ),
      body:const  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: CustumListView(),
          
      ),
    );
  }
}
