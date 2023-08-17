import 'package:flutter/material.dart';

class NumpadWidget extends StatelessWidget {
  final Function(String) onKeyPressed;

  const NumpadWidget({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
      width: 100,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(
        onPressed: () => onKeyPressed(number),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.transparent,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: Text(
          number,
          style: const TextStyle(fontFamily: 'MPlusRounded1C' , fontSize: 40),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Container(
      width: 100,
      height: 65,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(25),
        color: Colors.amber,
      ),
      child: IconButton(
        icon: const Icon(Icons.backspace),
        onPressed: () => onKeyPressed('backspace'),
        color: Colors.black,
        iconSize: 40,
      ),
    );
  }
}
