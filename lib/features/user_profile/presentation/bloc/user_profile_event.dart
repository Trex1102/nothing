part of 'user_profile_bloc.dart';



abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfileEvent {}

class UserProfileLoadEvent extends UserProfileEvent {}





// abstract class UserProfileEvent extends Equatable {
//   const UserProfileEvent();

//   @override
//   List<Object> get props => [];
// }

// class FetchUserProfile extends UserProfileEvent {
//   final GetCurrentUserUsecase getCurrentUserUsecase;

//   FetchUserProfile({required this.getCurrentUserUsecase});

//   @override
//   List<Object> get props => [getCurrentUserUsecase];
// }
