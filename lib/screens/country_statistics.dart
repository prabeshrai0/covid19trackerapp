import 'package:covid19tracker/models/country_summary_model.dart';
import 'package:covid19tracker/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart.dart';


import '../models/time_series_cases.dart';

class CountryStatistics extends StatefulWidget {

  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  _CountryStatisticsState createState() => _CountryStatisticsState();

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(List<CountrySummaryModel> summaryList) {

    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.deaths));
    }

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),

    ];
  }

}

class _CountryStatisticsState extends State<CountryStatistics> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.summaryList[widget.summaryList.length-1].country);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        buildCard(
          "CONFIRMED",
          widget.summaryList[widget.summaryList.length - 1].confirmed,
          kConfirmedColor,
          "ACTIVE",
          widget.summaryList[widget.summaryList.length - 1].active,
          kActiveColor,
        ),

        buildCard(
          "RECOVERED",
          widget.summaryList[widget.summaryList.length - 1].recovered,
          kRecoveredColor,
          "DEATH",
          widget.summaryList[widget.summaryList.length - 1].deaths,
          kDeathColor,
        ),

        buildCardChart(widget.summaryList),

      ],
    );
  }

  Widget buildCard(String leftTitle, int leftValue, Color leftColor, String rightTitle, int rightValue, Color rightColor){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                Text(
                  leftValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                Text(
                  "Total",
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                Text(
                  rightValue.toString().replaceAllMapped(reg, mathFunc),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryModel> summaryList){
    return Card(
      elevation: 1,
      child: Container(
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Chart(
          CountryStatistics._createData(summaryList),
          animate: false,
        ),
      ),
    );
  }
}