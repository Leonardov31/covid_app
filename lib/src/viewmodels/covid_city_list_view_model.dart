import 'package:flutter/material.dart';

import '../services/web_service.dart';
import '../utils/api_urls.dart';
import '../utils/loading_states.dart';

import 'covid_data_view_model.dart';

class CovidCityListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<CovidDataViewModel> covidDataList = <CovidDataViewModel>[];

  CovidCityListViewModel(String state) {
    populateCovidCitiesInfo(state);
  }

  Future<void> populateCovidCitiesInfo(String state) async {
    final covidData = await WebService().getData(covidInfoByCity(state));

    covidDataList = covidData.map((data) {
      return CovidDataViewModel(covidData: data);
    }).toList();

    loadingStatus =
        covidDataList.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;

    notifyListeners();
  }
}
