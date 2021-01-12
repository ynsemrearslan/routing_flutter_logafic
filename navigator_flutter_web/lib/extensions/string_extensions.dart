import 'package:navigator_flutter_web/datamodels/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParametres: ${uriData.queryParameters} path : ${uriData.path}');
    return RoutingData(
        queryParameters: uriData.queryParameters, route: uriData.path);
  }
}
