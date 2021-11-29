import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../app/app_text_style.dart';
import '../../../viewmodels/covid_data_view_model.dart';

class CovidCitiesInfoCard extends StatelessWidget {
  const CovidCitiesInfoCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CovidDataViewModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Cidade - ${utf8.decode(utf8.encode(data.city))}",
              style: AppTextStyle.title,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("População estimada:"),
                      Text(
                        "${data.estimatedPopulation}",
                        style: AppTextStyle.bodyTitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("População estimada 2019:"),
                      Text(
                        "${data.estimatedPopulation2019}",
                        style: AppTextStyle.bodyTitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Casos confirmados:"),
                      Text(
                        "${data.confirmed}",
                        style: AppTextStyle.bodyTitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Mortes confirmadas:"),
                      Text(
                        "${data.deaths}",
                        style: AppTextStyle.bodyTitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Mortes por casos confirmados:"),
                Text(
                  "${data.deathRate}",
                  style: AppTextStyle.bodyTitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
