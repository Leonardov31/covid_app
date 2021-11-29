import '../models/covid_data_model.dart';

class CovidDataViewModel {
  final CovidDataModel _covidData;

  CovidDataViewModel({
    required CovidDataModel covidData,
  }) : _covidData = covidData;

  String get date => _covidData.date;

  String get state => _covidData.state;

  String get city => _covidData.city;

  int get confirmed => _covidData.confirmed;

  int get deaths => _covidData.deaths;

  int get estimatedPopulation => _covidData.estimatedPopulation;

  int get estimatedPopulation2019 => _covidData.estimatedPopulation_2019;

  double get confirmedPer100kInhabitants =>
      _covidData.confirmedPer100kInhabitants;

  double get deathRate => _covidData.deathRate;
}
