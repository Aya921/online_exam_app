import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/user_entity.dart';
import 'package:exam_app/features/exam/domin/usecase/get_all_user_data_usecase.dart';
import 'package:exam_app/features/exam/presentation/view/pages/explore_page.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/cutom_nav_bar.dart';
import 'package:exam_app/features/exam/presentation/view_models/subject_view_model/cubit/explore_cubit.dart';
import 'package:exam_app/features/profile/presentation/views/pages/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});
  final viewModel = getIt<ExploreCubit>();
  late UserEntity userEntity;

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
  void initState() {
    getIt<GetAllUserDataUsecase>().call().then((result) {
      switch (result) {
        case final ApiSucessResult<UserEntity> successResult:
          widget.userEntity = successResult.sucessResult;
          break;
        case final ApiFailedResult errorResult:
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(
            backgroundColor: AppColors.red,
             content: Text(errorResult.errorMessage)));
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.viewModel,
      child: Scaffold(
        body: curentPage(currentIndex),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTabSelected: onTabChanged,
        ),
      ),
    );
  }

  Widget curentPage(int index) {
    switch (currentIndex) {
      case 0:
        return ExplorePage();
      case 1:
        return const Center(child: Text('Result Page'));
      case 2:
        return UpdateProfilePage(userEntity: widget.userEntity);
      default:
        return ExplorePage();
    }
  }
}
