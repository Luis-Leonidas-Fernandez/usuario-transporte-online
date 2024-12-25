part of 'navigator_bloc.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class BottomNavItemSelected extends NavigatorEvent {
  final int index;
  const BottomNavItemSelected(this.index);

  @override
  List<Object> get props => [index];
}