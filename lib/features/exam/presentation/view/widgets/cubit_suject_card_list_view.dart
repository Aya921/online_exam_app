import 'package:exam_app/features/exam/presentation/view/widgets/subject_card_list_view.dart';
import 'package:exam_app/features/exam/presentation/view_models/subject_view_model/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitSubjectCardListView extends StatefulWidget {
  const CubitSubjectCardListView({super.key});

  @override
  State<CubitSubjectCardListView> createState() => _CubitSubjectCardListViewState();
  
}

class _CubitSubjectCardListViewState extends State<CubitSubjectCardListView> {
  @override
  void initState() {
    context.read<ExploreCubit>().fetchAllSubjects();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreSuccess) {
          return  SujectCardListView( subjects: state.subjects,);
        } else if (state is ExploreFailed) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}