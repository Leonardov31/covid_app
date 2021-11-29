import '../../utils/loading_states.dart';
import '../../viewmodels/covid_city_list_view_model.dart';
import '../../widget/signout_icon_button.dart.dart';

import 'package:flutter/material.dart';
import 'widgets/covid_cities_info_card.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key, required this.state}) : super(key: key);

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
        actions: const [SignoutIconButton()],
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
