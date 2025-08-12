// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class LocalResult<T> {}

class SucessLocalResult<T> extends LocalResult<T> {
  T sucessResult;
  SucessLocalResult({required this.sucessResult});
}

class FailedLocalResult<T> extends LocalResult<T> {
  String failedResultMessage;
  FailedLocalResult({
    required this.failedResultMessage,
  });
  
}
