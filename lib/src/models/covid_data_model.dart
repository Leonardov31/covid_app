class CovidDataModel {
  final String city;

  final int confirmed;
  final double confirmedPer100kInhabitants;
  final String date;
  final double deathRate;
  final int deaths;
  final int estimatedPopulation;
  final int estimatedPopulation_2019;
  final bool isLast;
  final int orderForPlace;
  final String placeType;
  final String state;

  CovidDataModel({
    required this.city,
    required this.confirmed,
    required this.confirmedPer100kInhabitants,
    required this.date,
    required this.deathRate,
    required this.deaths,
    required this.estimatedPopulation,
    required this.estimatedPopulation_2019,
    required this.isLast,
    required this.orderForPlace,
    required this.placeType,
    required this.state,
  });

  factory CovidDataModel.fromMap(Map<String, dynamic> map) {
    return CovidDataModel(
      city: map['city'] ?? '',
      confirmed: map['confirmed'],
      confirmedPer100kInhabitants: map['confirmed_per_100k_inhabitants'] ?? -1,
      date: map['date'],
      deathRate: map['death_rate'],
      deaths: map['deaths'],
      estimatedPopulation: map['estimated_population'] ?? -1,
      estimatedPopulation_2019: map['estimated_population_2019'] ?? -1,
      isLast: map['is_last'],
      orderForPlace: map['order_for_place'],
      placeType: map['place_type'],
      state: map['state'],
    );
  }
}
