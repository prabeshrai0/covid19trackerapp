


class GlobalSummaryModel{


  final int newConfirmed;
  final int totalConfirmed;
 final int newDeaths;
 final  int totalDeaths;
 final int newRecovered;
 final int totalRecovered;
  final DateTime date;

  GlobalSummaryModel({this.newConfirmed, this.totalConfirmed, this.newDeaths,
    this.totalDeaths, this.newRecovered, this.totalRecovered, this.date});



  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) => GlobalSummaryModel(
    newConfirmed: json['Global']["NewConfirmed"],
    totalConfirmed: json['Global']["TotalConfirmed"],
    newDeaths: json['Global']["NewDeaths"],
    totalDeaths: json['Global']["TotalDeaths"],
    newRecovered: json['Global']["NewRecovered"],
    totalRecovered: json['Global']["TotalRecovered"],
    date: DateTime.parse(json["Date"]),
  );

}