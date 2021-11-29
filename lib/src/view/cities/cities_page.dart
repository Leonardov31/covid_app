import 'package:covid_app/src/utils/loading_states.dart';
import 'package:covid_app/src/viewmodels/covid_city_list_view_model.dart';
import 'package:flutter/material.dart';

import 'widgets/covid_cities_info_card.dart';

class CitysPage extends StatelessWidget {
  const CitysPage({Key? key, required this.state}) : super(key: key);

  final String state;

  @override
  Widget build(BuildContext context) {
    final _viewModel = CovidCityListViewModel(state);
    return Scaffold(
      backgroundColor: const Color(0xffefeef3),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text("Estado: $state"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          return _buildList(_viewModel);
        },
      ),
    );
  }

  _buildList(CovidCityListViewModel _viewModel) {
    switch (_viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return const Center(child: Text("Nenhum dado encontrado"));
      case LoadingStatus.completed:
        return ListView.builder(
          itemCount: _viewModel.covidDataList.length,
          itemBuilder: (context, index) {
            return CovidCitiesInfoCard(
              data: _viewModel.covidDataList[index],
            );
          },
        );
    }
  }
}
