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
  bool isLoadingUser = false;

  void onTabChanged(int index) async {
    setState(() => currentIndex = index);

  
    if (index == 2) {
      await _fetchUserData();
    }
  }

  Future<void> _fetchUserData() async {
    setState(() => isLoadingUser = true);

    final result = await getIt<GetAllUserDataUsecase>().call();

    switch (result) {
      case final ApiSucessResult<UserEntity> successResult:
        widget.userEntity = successResult.sucessResult;
        break;

      case final ApiFailedResult errorResult:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.red,
            content: Text(errorResult.errorMessage),
          ),
        );
        break;
    }

    setState(() => isLoadingUser = false);
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData(); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => widget.viewModel,
      child: Scaffold(
        body: _currentPage(currentIndex),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTabSelected: onTabChanged,
        ),
      ),
    );
  }

  Widget _currentPage(int index) {
    switch (index) {
      case 0:
        return  ExplorePage();
      case 1:
        return const Center(child: Text('Result Page'));
      case 2:
        if (isLoadingUser) {
          return const Center(child: CircularProgressIndicator());
        }
        return UpdateProfilePage(userEntity: widget.userEntity);
      default:
        return  ExplorePage();
    }
  }
}
