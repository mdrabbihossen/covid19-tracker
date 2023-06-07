import 'package:covid19_tracker/utils/app_colors.dart';
import 'package:covid19_tracker/utils/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              PieChart(
                dataMap: const {
                  "Total Cases": 100,
                  "Recovered": 50,
                  "Deaths": 20,
                },
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: AppColors.colorList,
                chartRadius: size.width / 3.2,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Card(
                  child: Column(
                children: [
                  Reusable(title: 'Total', trailing: "100"),
                  Reusable(title: 'Total', trailing: "100"),
                  Reusable(title: 'Total', trailing: "100"),
                  Reusable(title: 'Total', trailing: "100"),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
