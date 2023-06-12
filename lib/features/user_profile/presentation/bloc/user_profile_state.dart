part of 'user_profile_bloc.dart';


abstract class UserProfileState extends Equatable {
  const UserProfileState();  

  @override
  List<Object> get props => [];
}
class UserProfileInitial extends UserProfileState {}


class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserEntity userProfile;

  const UserProfileLoaded(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}

class UserProfileError extends UserProfileState {
  final String message;

  const UserProfileError(this.message);

  @override
  List<Object> get props => [message];
}

