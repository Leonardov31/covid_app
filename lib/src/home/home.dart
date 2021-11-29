import 'package:covid_app/src/utils/loading_states.dart';

import '../viewmodels/covid_state_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/covid_state_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<CovidStateListViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xffefeef3),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text("Dados por estado"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.approval),
          ),
        ],
      ),
      body: _buildList(_viewModel),
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
