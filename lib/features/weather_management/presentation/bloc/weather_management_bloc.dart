import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_management_event.dart';
part 'weather_management_state.dart';

class WeatherManagementBloc extends Bloc<WeatherManagementEvent, WeatherManagementState> {
  WeatherManagementBloc() : super(WeatherManagementInitial()) {
    on<WeatherManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
