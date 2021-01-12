import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigator_flutter_web/routing/route_names.dart';
import 'package:navigator_flutter_web/views/about/about_view.dart';
import 'package:navigator_flutter_web/views/episode_details/episode_details.dart';
import 'package:navigator_flutter_web/views/episodes/episodes_view.dart';
import 'package:navigator_flutter_web/views/home/home_view.dart';
import 'package:navigator_flutter_web/extensions/string_extensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData;
  switch (routingData.route) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case AboutRoute:
      return _getPageRoute(AboutView(), settings);
    case EpisodesRoute:
      return _getPageRoute(EpisodesView(), settings);
    case EpisodeDetailsRoute:
      var id = int.parse(routingData['id']);
      return _getPageRoute(
          EpisodeDetails(
            id: id,
          ),
          settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
