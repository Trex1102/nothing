import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/usecases/login_user_usecase.dart';
import 'package:nothing/features/user_management/presentation/register_presenter/widgets/register_form.dart';
import 'package:nothing/features/user_profile/presentation/widgets/user_profile_form.dart';

import '../../../domain/repositories/user_repository.dart';
import '../bloc/login_presenter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register_login_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserProfilePage(userRepository:
                                                        widget.userRepository,)),
                                  );
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
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.buildingColumns,
                                  color: Colors.amber,
                                  size: 32.17,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'FinTracker',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: "MPlusRounded1C",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Positioned(
                              child: Opacity(
                                opacity: 1,
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        fontFamily: 'MPlusRounded1C',
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Positioned(
                              child: Opacity(
                                opacity: 1,
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        fontFamily: 'MPlusRounded1C',
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      //forgot pass logic
                                    },
                                    child: const Opacity(
                                        opacity: 0.5,
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "MPlusRounded1C",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(height: 35.0),
                            SizedBox(
                              width: 168,
                              height: 64,
                              child: ElevatedButton(
                                onPressed: () {
                                  final loginBloc =
                                      BlocProvider.of<LoginBloc>(context);
                                  loginBloc.add(LoginButtonPressed(
                                    user: UserEntity(
                                      id: '',
                                      username: '',
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      isLoggedIn: '',
                                    ),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color(0xffffc310),
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'MPlusRounded1C',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Positioned(
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
                                                  RegisterForm(
                                                    userRepository:
                                                        widget.userRepository,
                                                  )),
                                        );
                                      },
                                      child: const Text(
                                        'Create an account',
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
            ),
          ),
        ));
  }
}
