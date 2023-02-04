import 'package:flutter_bloc/flutter_bloc.dart';

class FloorState {
  String? floorName;
  int? index;
  FloorState({this.floorName, this.index});
  FloorState copyWith({floorName, index}) {
    return FloorState(
      floorName: floorName ?? this.floorName,
      index: index ?? this.index,
    );
  }
}

class FloorCubit extends Cubit<FloorState> {
  FloorCubit() : super(FloorState());

  void update({floorName, index}) =>
      emit(state.copyWith(floorName: floorName, index: index));
}
