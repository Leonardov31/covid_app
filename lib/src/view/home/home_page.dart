import 'package:flutter/material.dart';

import '../../viewmodels/covid_state_list_view_model.dart';
import '../../utils/loading_states.dart';
import 'widgets/covid_state_info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = CovidStateListViewModel();
    return Scaffold(
      backgroundColor: const Color(0xffefeef3),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text("Dados por estado"),
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

  _buildList(CovidStateListViewModel _viewModel) {
    switch (_viewModel.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return const Center(child: Text("Nenhum dado encontrado"));
      case LoadingStatus.completed:
        return ListView.builder(
          itemCount: _viewModel.covidDataList.length,
          itemBuilder: (context, index) {
            return CovidStateInfoCard(
              data: _viewModel.covidDataList[index],
            );
          },
        );
    }
  }
}
