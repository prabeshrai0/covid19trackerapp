import 'package:covid19tracker/models/global_summary_model.dart';
import 'package:covid19tracker/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatefulWidget {
  const GlobalStatistics({Key key, this.summary}) : super(key: key);

  final GlobalSummaryModel summary;



  @override
  _GlobalStatisticsState createState() => _GlobalStatisticsState();
}

class _GlobalStatisticsState extends State<GlobalStatistics> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.summary.totalConfirmed);


}


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        buildCard("CONFIRMED", widget.summary.totalConfirmed, widget.summary.newConfirmed,
            kConfirmedColor),
        buildCard(
            "ACTIVE",
           ( widget.summary.totalConfirmed - widget.summary.totalRecovered - widget.summary.totalDeaths),
            (widget.summary.newConfirmed - widget.summary.newRecovered - widget.summary.newDeaths),
            kActiveColor),



        buildCard("RECOVERED", widget.summary.totalRecovered, widget.summary.newRecovered,
            kRecoveredColor),
        buildCard(
            "DEATH", widget.summary.totalDeaths, widget.summary.newDeaths, kDeathColor),

        //timeago issue down

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            'Staticstics updated  '  + timeago.format(widget.summary.date),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        elevation: 1,
        child: Container(

          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        totalCount.toString().replaceAllMapped(reg,mathFunc),
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        todayCount.toString().replaceAllMapped(reg, mathFunc),
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
