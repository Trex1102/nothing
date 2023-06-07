import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_register_presenter_event.dart';
part 'user_register_presenter_state.dart';

class UserRegisterPresenterBloc extends Bloc<UserRegisterPresenterEvent, UserRegisterPresenterState> {
  UserRegisterPresenterBloc() : super(UserRegisterPresenterInitial()) {
    on<UserRegisterPresenterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
