import 'package:exam_app/features/result/presentation/view/widgets/result_card.dart';
import 'package:flutter/material.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () {
               
              },
              child: const ResultCard(),
            ),
          );
        },
      ),
    );
  }
}
