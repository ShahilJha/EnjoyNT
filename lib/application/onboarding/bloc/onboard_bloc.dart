import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';
part 'onboard_bloc.freezed.dart';

@injectable
class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(OnboardState.initial()) {
    on<OnboardEvent>((event, emit) {
      on<ClickedType>(((event, emit) async {
        emit(
          state.copyWith(userType: event.option),
        );
      }));

      on<ClickedLookingFor>(((event, emit) async {
        emit(
          state.copyWith(
            userCategory: [...state.userCategory, event.option],
          ),
        );
      }));

      on<ClickedIntrestedOption>(((event, emit) async {
        emit(
          state.copyWith(userIntrest: [...state.userIntrest, event.option]),
        );
      }));
    });
  }
}
