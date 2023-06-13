import 'package:flutter/material.dart';
import 'package:nothing/features/income_management/presentation/get_income_by_user_id_presentor/widgets/income_list.dart';

import '../../../../common/presentation/widgets/custom_text_styles.dart';
import '../../../../common/presentation/widgets/welcome.dart';

class IncomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Welcome(),
        RemainingCash(),
        Container(
          margin: EdgeInsets.only(left: 22),
          alignment: AlignmentDirectional.topStart,
          child: Row(
            children: [
              Text(
                'Today',
                style: CustomTextStyle.defaultTextStyle,
              ),
              Icon(Icons.calendar_month_rounded),
            ],
          ),
        ),
        IncomeTile()
      ],
    );
  }
}
