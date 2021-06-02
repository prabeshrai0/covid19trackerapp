import 'package:covid19tracker/models/global_summary_model.dart';
import 'package:covid19tracker/services/covid_services.dart';
import 'package:flutter/material.dart';

import 'global_loading.dart';
import 'global_statistics.dart';



class Global extends StatefulWidget {



  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {

  CovidService covidService=CovidService();




  Future<GlobalSummaryModel> summary;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    summary=covidService.getGlobalSummary();




print(summary);

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Global Corona Virus Cases",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),),
                GestureDetector(
                  onTap: (){
                    setState(() {
summary=covidService.getGlobalSummary();



                    });
                  },
                  child: Icon(
                    Icons.refresh,color: Colors.white,),
                )


              ],
            ),
          ),
          FutureBuilder(
            future: summary,
            builder: (context,snapshot){
// print(snapshot.data);

              if(snapshot.hasError){
                return Center(child: Text('Error'),);
              }
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return GlobalLoading();

                default:
                  return  !snapshot.hasData ? Center(child: Text('Empty'),) :GlobalStatistics(summary: snapshot.data);


              }


            },)



        ],
      ),
    );
  }
}
