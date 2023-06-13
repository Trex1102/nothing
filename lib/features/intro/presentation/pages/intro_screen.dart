// import 'package:flutter/material.dart';
// import 'dart:async';



// class IntroScreen extends StatefulWidget {
//   const IntroScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _IntroScreenState createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen>
//     with SingleTickerProviderStateMixin {
//   int timeToWait = 5;

//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     animation();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void animation() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//     _animationController.repeat(reverse: true);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       getStarted();
//     });
//   }

//   void getStarted() {
//     Timer(Duration(seconds: timeToWait), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const TaskListScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedBuilder(
//                 animation: _animation,
//                 builder: (BuildContext context, Widget? child) {
//                   return Transform.scale(
//                     scale: _animation.value,
//                     child: Image.asset(
//                       Constants.introImagePath,
//                       width: 80,
//                       height: 80,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }