import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, CustomNavigatorState> {
  NavigatorBloc() : super(const CustomNavigatorState(selectedIndex: 0)) {
    // Manejo del evento de selección de un elemento del BottomNavigationBar
    on<BottomNavItemSelected>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
