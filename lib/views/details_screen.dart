import 'package:covid19_tracker/utils/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String countryName;
  final String countryFlag;
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  final int todayCases;
  final int todayDeaths;
  final int active;
  final int critical;
  final int test;

  const DetailsScreen({
    Key? key,
    required this.countryName,
    required this.countryFlag,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.todayCases,
    required this.todayDeaths,
    required this.active,
    required this.critical,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Card(
                  child: Column(
                    children: [
                      SizedBox(),
                      Reusable(
                        title: "Total Cases",
                        trailing: widget.totalCases.toString(),
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -50, 0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.countryFlag,
                    ),
                    radius: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
