import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/cubit_suject_card_list_view.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/search_text_field.dart';
import 'package:exam_app/features/exam/presentation/view_models/subject_view_model/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  final viewModel = getIt<ExploreCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Survey',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SearchTextField(),
              const SizedBox(height: 40),

              Text(
                'Browse by subject',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              const CubitSubjectCardListView(),
            ],
          ),
        ),
      ),
    );
    
  }
}
