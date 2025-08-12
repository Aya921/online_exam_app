import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/result/presentation/view/widgets/custum_list_view.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_event.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_state.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  final ResultViewModel resultViewModel = getIt.get<ResultViewModel>();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => resultViewModel..add(GetLocalResultEvent()),
      child: Scaffold(
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
            t.results,
    
           
            
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: BlocBuilder<ResultViewModel, ResultState>(
            builder: (context, state) {
              if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              } else if (state.isLoading!) {
                return const CircularProgressIndicator();
              } else if (state.resultModelList != null) {
                return CustumListView(resultList: state.resultModelList!);
              } else {
                return  Text(t.unExpectedError);
              }
            },
          ),
        ),
      ),
    );
  }
}
