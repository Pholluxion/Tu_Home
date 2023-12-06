import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> lineChartData = [
      SalesData(DateTime(2005, 0, 1), 0),
      SalesData(DateTime(2006, 0, 1), 28),
      SalesData(DateTime(2007, 0, 1), 34),
      SalesData(DateTime(2008, 0, 1), 32),
      SalesData(DateTime(2009, 0, 1), 40)
    ];

    final List<ChartData> chartData = [
      ChartData('Enero', 25, Colors.red),
      ChartData('Febrero', 38, Colors.green),
      ChartData('Marzo', 34, Colors.blue),
      ChartData('Abril', 52, Colors.yellow),
      ChartData('Mayo', 25, Colors.redAccent),
      ChartData('Junio', 38, Colors.greenAccent),
      ChartData('Julio', 34, Colors.blueAccent),
      ChartData('Agosto', 52, Colors.yellowAccent),
      ChartData('Septiembre', 25, Colors.purple),
      ChartData('Octubre', 38, Colors.orange),
      ChartData('Noviembre', 34, Colors.grey),
      ChartData('Diciembre', 52, Colors.pink),
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
                height: 300,
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
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCircularChart(
                    legend: const Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap,
                    ),
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.outside,
                          ),
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 40, interval: 10),
                    tooltipBehavior: _tooltip,
                    series: <ChartSeries<ChartData, String>>[
                      BarSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        pointColorMapper: (ChartData data, _) => data.color,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
