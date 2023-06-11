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
  late final TextEditingController _confirmpasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (_) => RegisterBloc(
            registerUserUseCase: RegisterUserUseCase(widget.userRepository)),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/register_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
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
                                                Navigator.pop(
                                                    context); // Close the dialog
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginForm(
                                                            userRepository: widget
                                                                .userRepository,
                                                          )),
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
                                      content: Text(
                                          'Something is wrong. Please try again.'),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 100),
                                const Positioned(
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontFamily: 'MPlusRounded1C',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Positioned(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 40),
                                    child: Opacity(
                                      opacity: 1,
                                      child: TextFormField(
                                        controller: _usernameController,
                                        decoration: const InputDecoration(
                                            labelText: 'Username',
                                            labelStyle: TextStyle(
                                              fontFamily: 'MPlusRounded1C',
                                            )),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a username';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Positioned(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 40),
                                    child: Opacity(
                                      opacity: 1,
                                      child: TextFormField(
                                        controller: _emailController,
                                        decoration: const InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                              fontFamily: 'MPlusRounded1C',
                                            )),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter an email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Positioned(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 40),
                                    child: Opacity(
                                      opacity: 1,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                              fontFamily: 'MPlusRounded1C',
                                            )),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 40),
                                    child: Opacity(
                                      opacity: 1,
                                      child: TextFormField(
                                        controller: _confirmpasswordController,
                                        decoration: const InputDecoration(
                                            labelText: 'Confirm Password',
                                            labelStyle: TextStyle(
                                              fontFamily: 'MPlusRounded1C',
                                            )),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          if (_confirmpasswordController.text !=
                                              _passwordController.text) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),
                                SizedBox(
                                  width: 168,
                                  height: 64,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        final username =
                                            _usernameController.text;
                                        final email = _emailController.text;
                                        final password =
                                            _passwordController.text;
                                        final confirmpassword =
                                            _confirmpasswordController.text;

                                        final registerBloc =
                                            BlocProvider.of<RegisterBloc>(
                                                context);
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
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Color(0xffffc310),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontFamily: 'MPlusRounded1C',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                  left: 56,
                                  top: 707,
                                  child: Opacity(
                                    opacity: 0.50,
                                    child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginForm(
                                                        userRepository: widget
                                                            .userRepository,
                                                      )),
                                            );
                                          },
                                          child: const Text(
                                            'Already have an account? Sign in.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'MPlusRounded1C',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ))));
  }
}
