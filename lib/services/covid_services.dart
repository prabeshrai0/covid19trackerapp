import 'dart:convert';

import 'package:covid19tracker/models/country_model.dart';
import 'package:covid19tracker/models/country_summary_model.dart';
import 'package:covid19tracker/models/global_summary_model.dart';
import 'package:http/http.dart' as http;

class CovidService {
  Future<GlobalSummaryModel> getGlobalSummary() async {
    http.Response data = await http.Client()
        .get(Uri.parse('https://api.covid19api.com/summary'));

    if (data.statusCode == 200) {
// print(data.body);

      var decodeData = jsonDecode(data.body);

      return GlobalSummaryModel.fromJson(decodeData);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async {
    final data = await http.get(
        Uri.parse("https://api.covid19api.com/total/dayone/country/" + slug));

    if (data.statusCode != 200) throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List)
        .map((item) => new CountrySummaryModel.fromJson(item))
        .toList();

    // print(summaryList);
    return summaryList;
  }

  Future<List<CountryModel>> getCountryList() async{
    final data = await http.Client().get(Uri.parse("https://api.covid19api.com/countries"));

    if(data.statusCode != 200)
      throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List).map((item) => new CountryModel.fromJson(item)).toList();

    return countries;
  }
}
