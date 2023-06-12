import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Welcome, user',
          style: CustomTextStyle.defaultTextStyle,
        ),
        Text(
          'date',
          style: CustomTextStyle.defaultTextStyle,
        ),
      ]),
    );
  }
}
