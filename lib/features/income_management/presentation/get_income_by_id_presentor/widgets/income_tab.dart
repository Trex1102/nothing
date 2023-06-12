import 'package:flutter/material.dart';
import 'package:nothing/features/income_management/presentation/get_income_by_id_presentor/widgets/income_list.dart';

class IncomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [RemainingCash(), IncomeTile()],
    );
  }
}
