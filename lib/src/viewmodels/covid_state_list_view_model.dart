import 'package:flutter/material.dart';

import '../services/web_service.dart';
import '../utils/api_urls.dart';
import '../utils/loading_states.dart';
import 'covid_data_view_model.dart';

class CovidStateListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<CovidDataViewModel> covidDataList = <CovidDataViewModel>[];

  CovidStateListViewModel() {
    populateCovidStatesInfo();
  }

  Future<void> populateCovidStatesInfo() async {
    final covidData = await WebService().getData(covidInfoByState);

    covidDataList = covidData.map((data) {
      return CovidDataViewModel(covidData: data);
    }).toList();

    loadingStatus =
        covidDataList.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
