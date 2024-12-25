part of 'navigator_bloc.dart';

class CustomNavigatorState extends Equatable {
  final int selectedIndex;

  const CustomNavigatorState({this.selectedIndex = 0});

  CustomNavigatorState copyWith({
   
    int? selectedIndex
    }) => CustomNavigatorState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  

  @override
  List<Object?> get props => [selectedIndex];
}