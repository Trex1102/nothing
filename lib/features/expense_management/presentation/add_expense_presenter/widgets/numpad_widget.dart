import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumpadWidget extends StatelessWidget {
  final Function(String) onKeyPressed;

  const NumpadWidget({Key? key, required this.onKeyPressed}) : super(key: key);

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
    return Container(
      width: 100.w, // Use screenutil
      height: 65.h, // Use screenutil
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(25.w), // Use screenutil
      ),
      child: MaterialButton(
        onPressed: () => onKeyPressed(number),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w), // Use screenutil
        ),
        color: Colors.transparent,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: Text(
          number,
          style: TextStyle(
            fontFamily: 'MPlusRounded1C',
            fontSize: 40.sp, // Use screenutil
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Container(
      width: 100.w, // Use screenutil
      height: 65.h, // Use screenutil
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(25.w), // Use screenutil
        color: Colors.amber,
      ),
      child: IconButton(
        icon: Icon(Icons.backspace),
        onPressed: () => onKeyPressed('backspace'),
        color: Colors.black,
        iconSize: 40.sp, // Use screenutil
      ),
    );
  }
}
