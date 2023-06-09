import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nothing/features/user_management/domain/usecases/register_user_usecase.dart';
import 'package:test/expect.dart';

import '../../../domain/entities/user_entity.dart';

part 'register_presenter_event.dart';
part 'register_presenter_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterBloc({required this.registerUserUseCase}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      await registerButtonPressed(event, emit);
    });
  }

  Future<void> registerButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      final id = event.user.id;
      final username = event.user.username;
      final email = event.user.email;
      final password = event.user.password;

      final result = await registerUserUseCase.call(
          username: username, email: email, password: password);

      result.fold((failure) => emit(RegisterFailure('Register failed')),
          (_) => emit(RegisterSuccess()));
    } catch (e) {
      emits(RegisterFailure('Register failed'));
    }
  }
}