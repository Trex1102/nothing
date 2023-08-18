import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/domain/usecases/get_current_user_usecase.dart';

import '../../../user_management/domain/entities/user_entity.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;

  UserProfileBloc({required this.getCurrentUserUsecase})
      : super(UserProfileInitial()) {
    on<FetchUserProfile>((event, emit) async {
      await fetchUserProfile(event, emit);
    });
  }

  Future<void> fetchUserProfile(
    FetchUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      final currentUser = await getCurrentUserUsecase.call();
      // (failure) => emit(UserProfileError('Profile loading failed'));
      // (_) => {
      emit(UserProfileLoaded(currentUser));
      print('Current User:');
      print('ID: ${currentUser.id}');
      print('Username: ${currentUser.username}');
      print('Email: ${currentUser.email}');
      //};
    } catch (e) {
      emit(const UserProfileError('Profile loading failed'));
    }
  }
}

//

// class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
//   final GetCurrentUserUsecase getCurrentUserUsecase;

//   UserProfileBloc({required this.getCurrentUserUsecase})
//       : super(UserProfileInitial());

//   @override
//   Stream<UserProfileState> mapEventToState(
//     UserProfileEvent event,
//   ) async* {
//     if (event is FetchUserProfile) {
//       yield UserProfileLoading();
//       print('fetched p');
//       try {
//         final user = await getCurrentUserUsecase.call();
//         yield UserProfileLoaded(user);
//       } catch (e) {
//         yield UserProfileError('Failed to fetch user profile');
//       }
//     }
//   }

// }


  // @override
  // Stream<UserProfileState> mapEventToState(
  //   UserProfileEvent event,
  // ) async* {
  //   if (event is FetchUserProfile) {
  //     yield UserProfileLoading();
  //     try {
  //       final user = await getCurrentUserUsecase.call();
  //       yield UserProfileLoaded(user);
  //     } catch (e) {
  //       yield UserProfileError('Failed to fetch user profile');
  //     }
  //   }
  // }

