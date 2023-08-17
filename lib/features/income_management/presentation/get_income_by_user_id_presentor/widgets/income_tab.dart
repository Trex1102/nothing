import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nothing/features/income_management/presentation/get_income_by_user_id_presentor/widgets/income_list.dart';

import '../../../../common/presentation/widgets/custom_text_styles.dart';
import '../../../../common/presentation/widgets/datemanagement.dart';
import '../../../../common/presentation/widgets/welcome.dart';

class IncomeTab extends StatelessWidget {
  //DateManagement date = DateManagement();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Welcome(),
        RemainingCash(),
        DateManagement(),
        // Container(
        //   margin: EdgeInsets.only(left: 22),
        //   alignment: AlignmentDirectional.topStart,
        //   child: Row(
        //     children: [
        //       Text(
        //         date.getToday(),
        //         style: CustomTextStyle.defaultTextStyle,
        //       ),
        //       Icon(Icons.calendar_month_rounded),
        //     ],
        //   ),
        // ),
        IncomeTile()
      ],
    );
  }
}
