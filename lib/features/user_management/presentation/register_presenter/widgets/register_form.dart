import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/framework.dart' as s;
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/presentation/login_presenter/widgets/login_form.dart';

import '../../../domain/repositories/user_repository.dart';
import '../../../domain/usecases/register_user_usecase.dart';
import '../bloc/register_presenter_bloc.dart';

class RegisterForm extends StatefulWidget {
  //const RegisterForm({Key? key}) : super(key: key);

  final UserRepository userRepository;
  RegisterForm({required this.userRepository});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends s.State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => RegisterBloc(
          registerUserUseCase: RegisterUserUseCase(widget.userRepository)),
    child : Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Registration success!'),
                          content: Text('Registered successfully.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginForm(userRepository: widget.userRepository,)),
                                    );
                                  },
                                )),
                          ],
                        ));
              } else if (state is RegisterFailure) {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Registration failed'),
                          content:
                              Text('Something is wrong. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('ok'),
                            ),
                          ],
                        ));
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final username = _usernameController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          final registerBloc =
                              BlocProvider.of<RegisterBloc>(context);
                          registerBloc.add(
                            RegisterButtonPressed(
                              user: UserEntity(
                                id: '',
                                username: username,
                                email: email,
                                password: password,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    )));
  }
}
