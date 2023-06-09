part of 'register_presenter_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object>get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final UserEntity user;

  const RegisterButtonPressed({
    required this.user
  });

  @override
  List<Object> get props => [user];
}