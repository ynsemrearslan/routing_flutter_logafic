import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:navigator_flutter_web/locator.dart';
import 'package:navigator_flutter_web/routing/route_names.dart';
import 'package:navigator_flutter_web/routing/router.dart';
import 'package:navigator_flutter_web/services/navigation_service.dart';
import 'package:navigator_flutter_web/widgets/centered_view/centered_view.dart';
import 'package:navigator_flutter_web/widgets/navigation_bar/navigation_bar.dart';
import 'package:navigator_flutter_web/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[NavigationBar(), Expanded(child: child)],
          ),
        ),
      ),
    );
  }
}
