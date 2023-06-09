part of 'weather_management_bloc.dart';

abstract class WeatherManagementState extends Equatable {
  const WeatherManagementState();  

  @override
  List<Object> get props => [];
}
class WeatherManagementInitial extends WeatherManagementState {}
