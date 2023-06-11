import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/usecases/login_user_usecase.dart';

import '../../../domain/repositories/user_repository.dart';
import '../bloc/login_presenter_bloc.dart';

class LoginForm extends StatefulWidget {
  //const LoginForm({Key? key}) : super(key: key);

  final UserRepository userRepository;
  LoginForm({required this.userRepository});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(
          loginUserUseCase: LoginUserUseCase(widget.userRepository)),
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Login Success'),
                      content: const Text('Logged in successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else if (state is LoginFailure) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Login Failure'),
                      content: const Text('Failed to log in.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          final loginBloc = BlocProvider.of<LoginBloc>(context);
                          loginBloc.add(
                            LoginButtonPressed(
                              user: UserEntity(
                              id: '',
                              username: '',
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                            )
                          );
                        },
                        child: const Text('Log in'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }

}
