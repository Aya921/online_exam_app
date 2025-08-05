part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}
final class ExploreLoading extends ExploreState {}
final class ExploreSuccess extends ExploreState {
  final List<SubjectModel> subjects;

  ExploreSuccess({required this.subjects});
}
final class ExploreFailed extends ExploreState {
  final String errorMessage;

  ExploreFailed({required this.errorMessage});
}
