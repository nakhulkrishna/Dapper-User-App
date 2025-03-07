import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState(selectedMaterials: {})) {
    on<ToggleMaterialFilterEvent>(_onToggleMaterialFilterEvent);
  }

  void _onToggleMaterialFilterEvent(
      ToggleMaterialFilterEvent event, Emitter<FilterState> emit) {
    final updatedMaterials = Map<String, bool>.from(state.selectedMaterials);
    updatedMaterials[event.material] = event.isSelected;
    emit(state.copyWith(selectedMaterials: updatedMaterials));
  }
}
