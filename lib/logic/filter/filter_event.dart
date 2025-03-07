import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleMaterialFilterEvent extends FilterEvent {
  final String material;
  final bool isSelected;

  ToggleMaterialFilterEvent(this.material, this.isSelected);

  @override
  List<Object> get props => [material, isSelected];
}
