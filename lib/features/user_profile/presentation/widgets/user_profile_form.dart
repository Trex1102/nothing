import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nothing/core/network/network_info.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import '../../../user_management/data/repositories/user_repository_impl.dart';
import '../../../user_management/domain/usecases/get_current_user_usecase.dart';
import '../bloc/user_profile_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/profile_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 50),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "XXX",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                )
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Edit Profile',
                  )),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Account",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                ),
                FaIcon(
                  FontAwesomeIcons.envelope,
                  color: Colors.amber,
                  size: 32.17,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'xxx@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "MPlusRounded1C",
                  ),
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Preferences",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                ),
                FaIcon(
                  FontAwesomeIcons.globe,
                  color: Colors.amber,
                  size: 32.17,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Currency',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "MPlusRounded1C",
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  'BDT',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "MPlusRounded1C",
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27),
                ),
                FaIcon(
                  FontAwesomeIcons.brush,
                  color: Colors.amber,
                  size: 32.17,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Theme',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "MPlusRounded1C",
                  ),
                ),
                SizedBox(
                  width: 220,
                ),
                FaIcon(
                  FontAwesomeIcons.toggleOn,
                  color: Colors.amber,
                  size: 32.17,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

// class UserProfilePage extends StatelessWidget {
//   UserRepository userRepository;
//   UserProfilePage(this.userRepository);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserProfileBloc(
//         getCurrentUserUsecase:
//             GetCurrentUserUsecase(userRepository), // Replace with your actual implementation
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('User Profile'),
//         ),
//         body: BlocConsumer<UserProfileBloc, UserProfileState>(
//           listener: (context, state) {
//             if (state is UserProfileError) {
//               // Handle error, show snackbar, etc.
//             }
//           },
//           builder: (context, state) {
//             if (state is UserProfileLoading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is UserProfileLoaded) {
//               final user = state.user;
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Username: ${user.username}'),
//                     Text('Email: ${user.email}'),
//                     // Add more user profile information widgets as needed
//                   ],
//                 ),
//               );
//             } else if (state is UserProfileNotLoggedIn) {
//               return Center(
//                 child: Text('User is not logged in'),
//               );
//             } else {
//               return Container(); // Placeholder widget
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nothing/features/user_profile/presentation/bloc/user_profile_bloc.dart';

// import '../../../user_management/domain/repositories/user_repository.dart';
// import '../../../user_management/domain/usecases/get_current_user_usecase.dart';

// class UserProfileForm extends StatefulWidget {
//   final UserRepository userRepository;
//   UserProfileForm({required this.userRepository});

//   @override
//   _UserProfileFormState createState() => _UserProfileFormState();
// }

// class _UserProfileFormState extends State<UserProfileForm> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => UserProfileBloc(
//             getCurrentUserUsecase:
//                 GetCurrentUserUsecase(widget.userRepository)),
//         child: Scaffold(
//           body: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/profile_bg.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('hehe'),
//                   BlocBuilder<UserProfileBloc, UserProfileState>(
//                       builder: (context, state) {
//                     if (state is UserProfileLoading) {
//                       return CircularProgressIndicator(); // Show loading indicator
//                     } else if (state is UserProfileLoaded) {
//                       BlocProvider.of<UserProfileBloc>(context).add(
//                           FetchUserProfile(
//                               getCurrentUserUsecase: GetCurrentUserUsecase(
//                                   widget.userRepository)));
//                       return _buildUserProfile();
//                     } else {
//                       return Container();
//                     }
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }

//   Widget _buildUserProfile() {
//     BlocProvider.of<UserProfileBloc>(context).add(FetchUserProfile(
//         getCurrentUserUsecase: GetCurrentUserUsecase(widget.userRepository)));
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Username: '),
//           SizedBox(height: 8.0),
//           Text('Email: '),
//           SizedBox(height: 8.0),
//           // Add more fields to display other user information
//           // such as name, address, phone number, etc.
//           ElevatedButton(
//             onPressed: () {
//               // Handle edit user profile logic
//             },
//             child: Text('Edit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
