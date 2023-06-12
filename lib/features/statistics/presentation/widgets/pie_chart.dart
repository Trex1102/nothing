import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataPoint {
  final String category;
  final int value;

  DataPoint({
    required this.category,
    required this.value,
  });
}

class Statistics extends StatelessWidget {
  List<DataPoint> data = [
    DataPoint(category: 'Category 1', value: 30),
    DataPoint(category: 'Category 2', value: 40),
    DataPoint(category: 'Category 3', value: 20),
    DataPoint(category: 'Category 4', value: 10),
  ];

  Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<DataPoint, String>(
            dataSource: data,
            xValueMapper: (DataPoint point, _) => point.category,
            yValueMapper: (DataPoint point, _) => point.value,
            dataLabelMapper: (DataPoint point, _) =>
                '${point.category}: ${point.value}',
          )
        ],
      ),
    );
  }
}
