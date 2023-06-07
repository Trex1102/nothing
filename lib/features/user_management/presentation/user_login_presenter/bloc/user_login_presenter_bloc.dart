import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_login_presenter_event.dart';
part 'user_login_presenter_state.dart';

class UserLoginPresenterBloc extends Bloc<UserLoginPresenterEvent, UserLoginPresenterState> {
  UserLoginPresenterBloc() : super(UserLoginPresenterInitial()) {
    on<UserLoginPresenterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
