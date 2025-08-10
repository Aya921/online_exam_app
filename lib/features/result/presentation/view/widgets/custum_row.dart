
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:flutter/material.dart';

class CustumRow extends StatelessWidget {
  const CustumRow({
    super.key,
    required this.questionList,
    required this.correctcontainerNumber,
    required this.wrongcontainerNumber,
  });

  final QuestionsModel questionList;
  final int correctcontainerNumber;
  final int wrongcontainerNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: questionList.answers!.length,
    
      itemBuilder: (context, index) {
        
        Color myColor = AppColors.transperant;
        Color containerColor = AppColors.lightBlue;
        Color circleBorderColor = AppColors.blue;
    
        // index+1 because question keys start from 1
    
        if ((index + 1 == correctcontainerNumber &&
                index + 1 == wrongcontainerNumber) ||
            index + 1 == wrongcontainerNumber) {
          myColor = AppColors.red;
          circleBorderColor = AppColors.red;
    
          containerColor = AppColors.lightRed;
        } else if (index + 1 ==
            correctcontainerNumber) {
          myColor = AppColors.green;
          circleBorderColor = AppColors.green;
          containerColor = AppColors.lightGreen;
        }
    
        final answers = questionList.answers![index];
    
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: myColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: circleBorderColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: myColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text('${answers.answer}',style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
        );
      },
    );
  }
}
