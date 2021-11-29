import 'package:covid_app/src/view/cities/cities_page.dart';
import 'package:flutter/material.dart';

import '../../../app/app_text_style.dart';
import '../../../viewmodels/covid_data_view_model.dart';

class CovidStateInfoCard extends StatelessWidget {
  const CovidStateInfoCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CovidDataViewModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => nextPage(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Estado - ${data.state}", style: AppTextStyle.title),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.confirmed}",
                        style: AppTextStyle.bodyTitle.copyWith(
                          color: Colors.teal[800],
                        ),
                      ),
                      const Text("casos confirmados"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.deaths}",
                        style: AppTextStyle.bodyTitle.copyWith(
                          color: Colors.red[800],
                        ),
                      ),
                      const Text("mortes confirmadas"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CitiesPage(state: data.state)),
    );
  }
}
