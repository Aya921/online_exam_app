// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';

class ResultState {
  CheckResponseModel? checkResponseModel;
  String? errorMessage;
  bool? isLoading;
  ResultState({this.checkResponseModel, this.errorMessage,this.isLoading=false});

  ResultState copyWith({
    CheckResponseModel? checkResponseModel,
    String? errorMessage,
     bool? isLoading

  }) {
    return ResultState(
      checkResponseModel: checkResponseModel ?? this.checkResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading??this.isLoading
    );
  }
}
