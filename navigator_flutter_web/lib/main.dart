import 'package:flutter/material.dart';
import 'package:navigator_flutter_web/routing/route_names.dart';
import 'package:navigator_flutter_web/routing/router.dart';
import 'package:navigator_flutter_web/services/navigation_service.dart';
import 'package:navigator_flutter_web/views/layout_template/layout_template.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => LayoutTemplate(child: child),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
