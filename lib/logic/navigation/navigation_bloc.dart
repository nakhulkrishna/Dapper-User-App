import 'package:dapper_user/logic/navigation/navigation_event.dart';
import 'package:dapper_user/logic/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomnavBloc extends Bloc<NavigatorEvent, NavigationState> {
  BottomnavBloc() : super(NavigationInitialState()) {
    on<SelectNavigationEvent>((event, emit) {
      emit(NavigationUpdatedState(selectedIndex: event.index));
    });
  }
}
