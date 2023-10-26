part of 'onboard_bloc.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState({
    required String userType,
    required List<String> userCategory,
    required List<String> userIntrest,
    required int listSize,
  }) = _OnboardState;

  factory OnboardState.initial() => OnboardState(
        userType: '',
        userCategory: List<String>.empty(),
        userIntrest: List<String>.empty(),
        listSize: 0,
      );
}
