part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.addition() = _Addition;

  const factory HomeState.marking() = _Marking;

  const factory HomeState.success() = _Success;
}
