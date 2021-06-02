import 'package:covid19tracker/screens/country.dart';

class CountrySummaryModel{


  final String  country;
  final int confirmed;
 final  int deaths;
 final int recovered;
 final int active;
 final  DateTime date;

  CountrySummaryModel({
  this.country,
  this.confirmed,
  this.deaths,
  this.recovered,
  this.active,
  this.date,
  });


  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) => CountrySummaryModel(
    country: json['Country'],
    confirmed: json["Confirmed"],
    deaths: json["Deaths"],
    recovered: json["Recovered"],
    active: json["Active"],
    date: DateTime.parse(json["Date"]),
  );

}