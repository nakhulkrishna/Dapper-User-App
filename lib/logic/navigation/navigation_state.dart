abstract class NavigationState {}

class NavigationInitialState extends NavigationState {}

class NavigationUpdatedState extends NavigationState {
  final int selectedIndex;

  NavigationUpdatedState({required this.selectedIndex});
}
