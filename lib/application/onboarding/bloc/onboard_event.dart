part of 'onboard_bloc.dart';

@freezed
class OnboardEvent with _$OnboardEvent {
  const factory OnboardEvent.clickedType(String option) = ClickedType;
  const factory OnboardEvent.clickedLookingFor(String option) =
      ClickedLookingFor;
  const factory OnboardEvent.clickedIntrestedOption(String option) =
      ClickedIntrestedOption;
}
