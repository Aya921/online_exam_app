import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/presentation/view/widgets/result_card.dart';
import 'package:flutter/material.dart';

class CustumListView extends StatelessWidget {
  final List<ResultModel> resultList;
  const CustumListView({super.key, required this.resultList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: resultList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.answers,arguments: resultList[index]);
                  },
                  child: ResultCard(resultList: resultList[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
