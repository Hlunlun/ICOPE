import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:icope/mychart/mychart_data.dart';

import 'package:icope/mychart/mychart_model.dart';

class MyChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyChart({Key? key}) : super(key: key);

  @override
  _MyChartState createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  List<MyChartData> datas = MyChartModel.getWeight();


  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: '體重趨勢圖'),
              // Enable legend
              // legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.date,
                    yValueMapper: (_SalesData sales, _) => sales.value,
                    // name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]
            // series: <ChartSeries<MyChartData, String>>[
            //   LineSeries<MyChartData, String>(
            //       dataSource: datas,
            //       xValueMapper: (MyChartData sales, _) => sales.date,
            //       yValueMapper: (MyChartData sales, _) => sales.value,
            //       // name: 'Sales',
            //       // Enable data label
            //       dataLabelSettings: DataLabelSettings(isVisible: true))
            // ]

    );
  }
}

class _SalesData {
  _SalesData(this.date, this.value);

  final String date;
  final double value;
}
