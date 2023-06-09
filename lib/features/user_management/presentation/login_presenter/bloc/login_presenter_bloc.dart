import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nothing/features/user_management/domain/usecases/login_user_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'login_presenter_event.dart';
part 'login_presenter_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;

  LoginBloc({required this.loginUserUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      // TODO: implement event handler
      await loginButtonPressed(event, emit);
    });
  }

  Future<void> loginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final email = event.user.email;
      final password = event.user.password;

      final result = await loginUserUseCase.call(
        email, password);

      result.fold((failure) => emit(LoginFailure('Login failed')),
          (_) => emit(LoginSuccess()));
    } catch (e) {
      emit(LoginFailure('Login failed'));
    }
  }
}
