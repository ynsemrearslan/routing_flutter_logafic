import 'package:flutter/cupertino.dart';
import 'package:navigator_flutter_web/locator.dart';
import 'package:navigator_flutter_web/routing/route_names.dart';
import 'package:navigator_flutter_web/services/navigation_service.dart';
import 'package:navigator_flutter_web/views/episode_details/episode_details.dart';

class EpisodeListViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateEpisode(int index) {
    _navigationService
        .navigateTo(EpisodeDetailsRoute, queryParams: {'id': index.toString()});
  }
}
