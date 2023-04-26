import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning/app_events.dart';
import 'package:flutter_ulearning/app_state.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
    });
  }
}
