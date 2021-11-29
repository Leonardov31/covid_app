const baseUrl = "https://api.brasil.io/v1/dataset/covid19/caso/data/";
const covidInfoByState = "?place_type=state&is_last=True";

String covidInfoByCity(String state) =>
    "?state=$state&city=&place_type=city&is_last=True";
