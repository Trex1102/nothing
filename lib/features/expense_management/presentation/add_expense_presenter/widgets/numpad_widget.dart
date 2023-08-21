import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumpadWidget extends StatefulWidget {
  final Function(String) onKeyPressed;

  const NumpadWidget({Key? key, required this.onKeyPressed}) : super(key: key);

  @override
  _NumpadWidgetState createState() => _NumpadWidgetState();
}

class _NumpadWidgetState extends State<NumpadWidget> {
  String? pressedNumber;

  @override
  Widget build(BuildContext context) {
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h), // Use screenutil
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h), // Use screenutil
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h), // Use screenutil
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h), // Use screenutil
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('.'),
              _buildNumberButton('0'),
              _buildBackspaceButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return Material(
      elevation: pressedNumber == number ? 5.0 : 0.0, // Add elevation for shadow effect when pressed
      shadowColor: Colors.black, // Shadow color
      borderRadius: BorderRadius.circular(25.w), // Use screenutil
      child: GestureDetector(
        onTap: () {
          setState(() {
            pressedNumber = number;
          });
          Future.delayed(Duration(milliseconds: 12), () {
            setState(() {
              pressedNumber = null; // Reset the pressedNumber
            });
          });
          widget.onKeyPressed(number);
        },
        child: Container(
          width: 100.w, // Use screenutil
          height: 60.h, // Use screenutil
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 1),
            borderRadius: BorderRadius.circular(25.w), // Use screenutil
            color: pressedNumber == number ? Colors.amber : Colors.transparent,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontFamily: 'MPlusRounded1C',
                fontSize: 40.sp, // Use screenutil
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Material(
      elevation: pressedNumber == 'backspace' ? 5.0 : 0.0, // Add elevation for shadow effect when pressed
      shadowColor: Colors.black, // Shadow color
      borderRadius: BorderRadius.circular(25.w), // Use screenutil
      child: GestureDetector(
        onTap: () {
          setState(() {
            pressedNumber = 'backspace';
          });
          Future.delayed(Duration(milliseconds: 12), () {
            setState(() {
              pressedNumber = null; // Reset the pressedNumber
            });
          });
          widget.onKeyPressed('backspace');
        },
        child: Container(
          width: 100.w, // Use screenutil
          height: 60.h, // Use screenutil
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(25.w), // Use screenutil
            color: pressedNumber == 'backspace' ? Colors.white : Colors.amber,
          ),
          child: Center(
            child: Icon(
              Icons.backspace,
              color: pressedNumber == 'backspace' ? Colors.amber : Colors.black,
              size: 40.sp, // Use screenutil
            ),
          ),
        ),
      ),
    );
  }
}
