import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_presenter_event.dart';
part 'login_presenter_state.dart';

class LoginPresenterBloc extends Bloc<LoginPresenterEvent, LoginPresenterState> {
  LoginPresenterBloc() : super(LoginPresenterInitial()) {
    on<LoginPresenterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
