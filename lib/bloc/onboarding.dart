import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingState {
  final int index;

  OnboardingState(this.index);
  OnboardingState copyWith({required index}) {
    return OnboardingState(index ?? this.index);
  }
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(super.initialState);

  void setIndex(int index) => emit(state.copyWith(index: index));
}
