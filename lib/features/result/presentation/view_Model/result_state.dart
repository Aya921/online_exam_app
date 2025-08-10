// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';

class ResultState {
  CheckResponseModel? checkResponseModel;
  String? errorMessage;
  bool? isLoading;
  List<ResultModel>? resultModelList;
  bool? isSaved;
   List<int>? containerWrongNumber;
   List<int>? containerCorrectNumber;



  ResultState({
    this.checkResponseModel,
    this.errorMessage,
    this.isLoading = false,
    this.resultModelList,
    this.isSaved = false,
    this.containerCorrectNumber,
    this.containerWrongNumber,
  });

  ResultState copyWith({
    CheckResponseModel? checkResponseModel,
    String? errorMessage,
    bool? isLoading,
    List<ResultModel>? resultModelList,
    bool? isSaved,
   List<int>? containerWrongNumber,
   List<int>? containerCorrectNumber
    
  }) {
    return ResultState(
      checkResponseModel: checkResponseModel ?? this.checkResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      resultModelList: resultModelList ?? this.resultModelList,
      isSaved: isSaved ?? this.isSaved,
      containerCorrectNumber: containerCorrectNumber??this.containerCorrectNumber,
      containerWrongNumber: containerWrongNumber??this.containerWrongNumber
    );
  }
}
