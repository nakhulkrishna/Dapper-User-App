import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final Map<String, bool> selectedMaterials;

  FilterState({required this.selectedMaterials});

  FilterState copyWith({Map<String, bool>? selectedMaterials}) {
    return FilterState(
      selectedMaterials: selectedMaterials ?? this.selectedMaterials,
    );
  }

  @override
  List<Object> get props => [selectedMaterials];
}
