import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SalesData> lineChartData = [
      SalesData(DateTime(2005, 0, 1), 0),
      SalesData(DateTime(2006, 0, 1), 28),
      SalesData(DateTime(2007, 0, 1), 34),
      SalesData(DateTime(2008, 0, 1), 32),
      SalesData(DateTime(2009, 0, 1), 40)
    ];

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          leading: const SizedBox(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) =>
                            sales.year.add(const Duration(days: 1)),
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) =>
                            sales.year.add(const Duration(days: 1)),
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) =>
                            sales.year.add(const Duration(days: 1)),
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) =>
                            sales.year.add(const Duration(days: 1)),
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                      LineSeries<SalesData, DateTime>(
                        dataSource: lineChartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) =>
                            sales.sales + Random().nextInt(10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

Future<bool>? _onWillPop(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¿Desea cerrar sesión?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Si'),
        ),
      ],
    ),
  );
}
