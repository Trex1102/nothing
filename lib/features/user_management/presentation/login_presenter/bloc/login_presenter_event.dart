part of 'login_presenter_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object>get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final UserEntity user;

  const LoginButtonPressed({
    required this.user
  });

  @override
  List<Object> get props => [user];
}