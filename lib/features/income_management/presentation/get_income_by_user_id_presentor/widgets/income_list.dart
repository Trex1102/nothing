import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';

class RemainingCash extends StatelessWidget {
  final customTextStyle = CustomTextStyle();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Expanded(
        child: Column(children: [
          Text(
            "Remaining Cash",
            style: customTextStyle.mediumTextStyle,
          ),
          Text('৳000', style: customTextStyle.largeTextStyle),
        ]),
      ),
    );
  }
}

class IncomeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 217, 217, 217),
      ),
      child: Row(
        children: [
          Container(
            width: 55, // Width of the icon
            child: const Icon(
              Icons.emoji_transportation_rounded,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Amount',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Show Time',
                style: TextStyle(fontSize: 14),
              ),
              Icon(
                Icons.cloud,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
