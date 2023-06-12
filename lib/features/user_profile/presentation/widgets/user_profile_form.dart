import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

import '../../../user_management/domain/repositories/user_repository.dart';
import '../../../user_management/domain/usecases/get_current_user_usecase.dart';

class UserProfileForm extends StatefulWidget {
  final UserRepository userRepository;
  UserProfileForm({required this.userRepository});

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserProfileBloc(
            getCurrentUserUsecase:
                GetCurrentUserUsecase(widget.userRepository)),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hehe'),
                  BlocBuilder<UserProfileBloc, UserProfileState>(
                      builder: (context, state) {
                    if (state is UserProfileLoading) {
                      return CircularProgressIndicator(); // Show loading indicator
                    } else if (state is UserProfileLoaded) {
                      BlocProvider.of<UserProfileBloc>(context).add(
                          FetchUserProfile(
                              getCurrentUserUsecase: GetCurrentUserUsecase(
                                  widget.userRepository)));
                      return _buildUserProfile();
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildUserProfile() {
    BlocProvider.of<UserProfileBloc>(context).add(FetchUserProfile(
        getCurrentUserUsecase: GetCurrentUserUsecase(widget.userRepository)));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username: '),
          SizedBox(height: 8.0),
          Text('Email: '),
          SizedBox(height: 8.0),
          // Add more fields to display other user information
          // such as name, address, phone number, etc.
          ElevatedButton(
            onPressed: () {
              // Handle edit user profile logic
            },
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }
}
