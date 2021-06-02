class CountryModel{

final String country;
final String slug;
final String iso2;

CountryModel({this.country, this.slug,this.iso2});


factory CountryModel.fromJson(Map<String,dynamic> json){



  return CountryModel(
    slug: json['Slug'],
    country: json["Country"],
    iso2: json['ISO2']
  );

}








}