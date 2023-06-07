import 'package:covid19_tracker/model/world_stats_model.dart';
import 'package:covid19_tracker/services/stats_services.dart';
import 'package:covid19_tracker/utils/app_colors.dart';
import 'package:covid19_tracker/utils/widgets/reusable_widget.dart';
import 'package:covid19_tracker/views/country/screens/country_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
              Expanded(
                child: FutureBuilder(
                  future: StatsServices().getWorldStats(),
                  builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: AppColors.deepGreen,
                          size: 50.0,
                          controller: _controller,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total Cases": snapshot.data!.cases!.toDouble(),
                              "Recovered": snapshot.data!.recovered!.toDouble(),
                              "Deaths": snapshot.data!.deaths!.toDouble(),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                              decimalPlaces: 1,
                            ),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: AppColors.colorList,
                            chartRadius: size.width / 3.2,
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                          ),
                          SizedBox(height: size.height * 0.06),
                          Card(
                            child: Column(
                              children: [
                                Reusable(
                                  title: 'Total',
                                  trailing: snapshot.data!.cases.toString(),
                                ),
                                Reusable(
                                    title: 'Today Deaths',
                                    trailing:
                                        snapshot.data!.todayDeaths.toString()),
                                Reusable(
                                    title: 'Critical',
                                    trailing:
                                        snapshot.data!.critical.toString()),
                                Reusable(
                                    title: 'Affected Countries',
                                    trailing: snapshot.data!.affectedCountries
                                        .toString()),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.06),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CountriesList(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.deepGreen,
                              minimumSize: Size(
                                double.infinity,
                                size.height * .07,
                              ),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Track Countries',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
