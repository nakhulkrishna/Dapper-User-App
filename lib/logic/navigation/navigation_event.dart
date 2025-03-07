abstract class NavigatorEvent {}

class SelectNavigationEvent extends NavigatorEvent {
  final int index;

  SelectNavigationEvent({required this.index});
}
